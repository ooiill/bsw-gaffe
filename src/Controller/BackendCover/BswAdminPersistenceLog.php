<?php

namespace App\Controller\BackendCover;

use App\Controller\AcmeBackendController;
use Leon\BswBundle\Controller as Bsw;
use Leon\BswBundle\Annotation\Entity\Input as I;
use Leon\BswBundle\Annotation\Entity\Output as O;
use Leon\BswBundle\Annotation\Entity\AccessControl as Access;
use Symfony\Component\Routing\Annotation\Route;

class BswAdminPersistenceLog extends AcmeBackendController
{
    use Bsw\BswAdminPersistenceLog\Common;
    use Bsw\BswAdminPersistenceLog\Preview;
    use Bsw\BswAdminPersistenceLog\Persistence;
}