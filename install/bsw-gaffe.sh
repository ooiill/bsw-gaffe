#!/usr/bin/env bash

# sudo curl -L "https://raw.githubusercontent.com/ooiill/bsw-gaffe/master/install/bsw-gaffe.sh" -o /usr/local/bin/bsw-gaffe && sudo chmod a+x /usr/local/bin/bsw-gaffe

while [[ "${1}" ]]
do
    case "${1}" in
        --app)
            app="${2}"
            shift 2
            ;;
        --type)
            type="${2}"
            shift 2
            ;;
        --env)
            env="${2}"
            shift 2
            ;;
        --port)
            port="${2}"
            shift 2
            ;;
        --git)
            git="${2}"
            shift 2
            ;;
        --npm)
            npm="${2}"
            shift 2
            ;;
        --install)
            mode="install"
            shift
            ;;
        --www)
            www="${2}"
            shift 2
            ;;
        --host)
            host="${2}"
            shift 2
            ;;
        --top)
            top="${2}"
            shift 2
            ;;
        --db-user)
            dbUser="${2}"
            shift 2
            ;;
        --db-pwd)
            dbPwd="${2}"
            shift 2
            ;;
        --db-host)
            dbHost="${2}"
            shift 2
            ;;
        --db-port)
            dbPort="${2}"
            shift 2
            ;;
        --db-name)
            dbName="${2}"
            shift 2
            ;;
        --ir-admin-phone)
            irAdminPhone="${2}"
            shift 2
            ;;
        --ir-admin-pwd)
            irAdminPwd="${2}"
            shift 2
            ;;
        -h|--help)
            help="yes"
            shift
            ;;
        *)
            shift
            ;;
    esac
done

app=${app}
type=${type}
env=${env-dev}
port=${port-$[$RANDOM%50000+20000]}
git=${git-https://github.com/ooiill/bsw-gaffe.git}
npm=${npm-yes}
mode=${mode-create}
www=${www-app}
top=${top-com}
dbUser=${dbUser-root}
dbPwd=${dbPwd-MySQL&9527}
dbPwd=$(printf '%q' "${dbPwd}")
dbHost=${dbHost-mysql}
dbPort=${dbPort-3306}
irAdminPhone=${irAdminPhone-17011223344}
irAdminPwd=${irAdminPwd-bsw@2020#BSW}
help=${help-no}
user=`whoami`

if [[ "${host}" == "" ]]; then
    host=${app//_/-}
fi

if [[ "${dbName}" == "" ]]; then
    dbName=${app//-/_}
fi

function color()
{
    color=$1
    message=$2
    begin=${3-"\t"}
    end=${4-"\n"}

    echo -e "${begin}\033[1;${color}m${message}\033[0;0m${end}"
}

if [[ "${help}" == "yes" ]]; then
    color 34 "Usage: bsw-gaffe [args...]"   "\n\t"
    color 32 "--app"            "\t"  "\t\t\t[*] ????????????"
    color 32 "--type"           "\t"  "\t\t\t[*] ???????????? [backend|web|api]"
    color 32 "--env"            "\t"  "\t\t\t[ ] ???????????? [dev|prod] [default:dev]"
    color 32 "--port"           "\t"  "\t\t\t[ ] ?????????????????????+port, ??????????????????????????? 0 [default:random(20000,50000)]"
    color 32 "--git"            "\t"  "\t\t\t[ ] ?????? git ?????? [default:https://github.com/ooiill/bsw-gaffe.git]"
    color 32 "--npm"            "\t"  "\t\t\t[ ] ?????????????????? npm install [default:yes]"
    color 32 "--install"        "\t"  "\t\t[-] ????????? install ??????, ??????????????????????????? create ??????"
    color 32 "--www"            "\t"  "\t\t\t[ ] ?????????????????? [default:app]" "" "\n"
    color 32 "--host"           "\t"  "\t\t\t[ ] ??????????????????????????????????????? --app ??????????????????" "" "\n"
    color 32 "--top"            "\t"  "\t\t\t[ ] ?????????????????? [default:com]" "" "\n"
    color 32 "--db-user"        "\t"  "\t\t[ ] ???????????????????????????????????? docker ????????????"
    color 32 "--db-pwd"         "\t"  "\t\t[ ] ???????????????????????????????????? docker ????????????"
    color 32 "--db-host"        "\t"  "\t\t[ ] ???????????????????????????????????? docker ????????????"
    color 32 "--db-port"        "\t"  "\t\t[ ] ???????????????????????????????????? docker ????????????"
    color 32 "--db-name"        "\t"  "\t\t[ ] ???????????????????????????????????? --app ??????????????????"
    color 32 "--ir-admin-phone" "\t"  "\t[ ] ???????????????????????? [default:17011223344]" "" "\n\n"
    color 32 "--ir-admin-pwd"   "\t"  "\t\t[ ] ?????????????????????????????? [default:bsw@2020#BSW]" "" "\n"
    color 32 "-h|--help"        "\t"  "\t\t[-] ??????????????????, * ????????????, - ??????????????????" "" "\n"

    color 34 "Dependents And Configured" "\n\t"
    color 35 "git"              "\t1. " ""
    color 37 ""                 "\t   yum install -y git / apt install -y git" "\n"
    color 35 "docker"           "\t2. " ""
    color 37 ""                 "\t   yum install -y docker / apt install -y docker.io" ""
    color 37 ""                 "\t   systemctl start docker" ""
    color 37 ""                 "\t   systemctl enable docker" "\n"
    color 35 "docker-compose"   "\t3. " ""
    color 37 ""                 "\t   yum install -y docker-compose / apt install -y docker-compose" "\n"
    color 35 "/etc/sudoers"     "\t4. " ""
    color 37 ""                 "\t   ?????? visudo ??????, ??? env_reset => !env_reset" "\n"
    exit 0
fi

if [[ `git --version 2>/dev/null | grep 'git version' | wc -l | awk '{print $1}'` == 0 ]]; then
    color 31 'Command git is required' "\n\t"
    exit 101
fi

if [[ `docker --version 2>/dev/null | grep 'Docker version' | wc -l | awk '{print $1}'` == 0 ]]; then
    color 31 'Command docker is required' "\n\t"
    exit 101
fi

if [[ `docker-compose --version 2>/dev/null | grep 'docker-compose version' | wc -l | awk '{print $1}'` == 0 ]]; then
    color 31 'Command docker-compose is required' "\n\t"
    exit 101
fi

if [[ "${app}" == "" ]]; then
    color 31 "What's your application name?" "\n\t"
    exit 102
fi

if [[ ! "backend web api" =~ ${type} ]]; then
    color 31 "Application type should in options [backend|web|api]" "\n\t"
    exit 102
fi

if [[ ! "dev prod" =~ ${env} ]]; then
    color 31 "Application env should in options [dev|prod]" "\n\t"
    exit 102
fi

if [[ "${mode}" == "create" ]] && [[ -d "${app}" ]]; then
    color 31 "The directory already exists" "\n\t"
    exit 104
fi

if [[ "${mode}" == "create" ]]; then
    color 34 "Clone basic framework" "\n"
    git clone ${git} ${app}
fi

if [[ ! -d "${app}" ]]; then
    color 31 "Git clone failed or directory non-exists" "\n\t"
    exit 103
fi

cd ${app}
rm -rf .git

if [[ "${mode}" == "create" ]]; then

    color 34 'Replace keyword for application' "\n"
    nameFiles=(
        "docker/nginx/nginx.conf"
        "docker/nginx/conf.d/location/app.conf"
        "docker/nginx/conf.d/location/doc.conf"
        "docker/nginx/conf.d/location/file.conf"
        "docker/nginx/conf.d/htpasswd"
        "docker/script/library.sh"
        "docker/dev.yml"
        "docker/beta.yml"
        "docker/prod.yml"
        "docker/README.md"
        "install/crontab.sh"
        "install/online.upgrade.sh"
        ".env.dev"
        ".env.beta"
        ".env.prod"
        "README.md"
    )

    for item in ${nameFiles[*]};
    do
        sed -i "s/app.bsw-host.com/${www}.${host}.${top}/g" ${item}
        sed -i "s/www.bsw-host.com/www.${host}.${top}/g" ${item}
        sed -i "s/bsw-host/${host}/g" ${item}
        sed -i "s/bsw-app/${app}/g" ${item}
        sed -i "s/bsw-type/${type}/g" ${item}
        sed -i "s/bsw-db-user/${dbUser}/g" ${item}
        sed -i "s/bsw-db-pwd/${dbPwd}/g" ${item}
        sed -i "s/bsw-db-host/${dbHost}/g" ${item}
        sed -i "s/bsw-db-port/${dbPort}/g" ${item}
        sed -i "s/bsw-db-name/${dbName}/g" ${item}
        color 37 "${item}" "\t" ""

        for p in 3306 6379 80 443;
        do
            oldPort=$((50000+p))
            newPort=$((port+p))
            sed -i "s/${oldPort}/${newPort}/g" ${item}
        done
    done
fi

(
    cd docker/script
    sudo chmod a+x *.sh
    bash install-composer.sh
    bash install-front.sh
    bash install-mysql-client.sh
    bash install-redis-client.sh
    bash install-symfony-console.sh
)

shopt -s expand_aliases
source ~/.bash_profile

cd docker
eval "dc.${env} up --build -d"
httpPort=`eval "dc.${env} config | grep ':80/tcp'"`
httpPort=$(echo ${httpPort} | awk '{print $2}' | awk -F ':' '{print $1}')
httpsPort=`eval "dc.${env} config | grep ':443/tcp'"`
httpsPort=$(echo ${httpsPort} | awk '{print $2}' | awk -F ':' '{print $1}')
cd -

echo APP_ENV=${env} > .env

source ~/.bash_profile
eval "iload"
#eval "${app}-composer install --ignore-platform-reqs"
eval "${app}-sf-bin assets:install"
eval "${app}-sf-bin cache:clear"
sudo chown -R ${user}:${user} var
sudo chmod -R a+w var
sudo chown -R ${user}:${user} vendor

if [ "${type}" != "api" -a "${npm}" == "yes" ]; then
    cd public/bundles/leonbsw
    eval "${app}-npm install"
    eval "${app}-npm run all"
    cd -
    if [[ -f "public/package.json" ]]; then
        cd public
        eval "${app}-npm install"
        eval "${app}-npm run all"
        cd -
    fi
fi

if [[ "${dbHost}" == "mysql" ]]; then
    eval "${app}-sf-bin doctrine:database:create"
fi
eval "bin.${app}-bsw --scaffold-need=no --config-need=yes --document-need=no --app=${type} --project=${app}"
eval "bin.${app}-${type}"
if [[ "${type}" == "backend" ]]; then
    eval "${app}-sf-bin bsw:init-record --admin-phone=${irAdminPhone} --admin-password=${irAdminPwd}"
    eval "bin.${app}-${type} --acme=App\\Controller\\AcmeBackendController --scheme-reverse=* --comment-2-label=yes --comment-2-menu=yes"
fi

controller=(
    "src/Controller/BackendCover/"
    "src/Controller/AcmeBackendController.php"
    "src/Controller/AcmeApiController.php"
    "src/Controller/AcmeWebController.php"
    "src/Controller/HomeBackendController.php"
    "src/Controller/HomeWebController.php"
    "src/Controller/MixedBackendController.php"
    "src/Controller/MixedApiController.php"
    "src/Controller/MixedWebController.php"
    "src/Controller/SmsApiController.php"
    "templates/home-web/"
)

for item in ${controller[*]};
do
    if [[ `echo "${item}" | grep -i "${type}" | wc -l | awk '{print $1}'` == 0 ]]; then
        rm -rf ${item}
    fi
done

color 44 " You can access service as following " "\n\t"
if [[ "${httpPort}" != "" ]]; then
    color 34 "http://${www}.${host}.${top}:${httpPort}" "\t???? " ""
fi
if [[ "${httpsPort}" != "" ]]; then
    color 34 "https://${www}.${host}.${top}:${httpsPort}" "\t???? "
fi

# -- eof --
