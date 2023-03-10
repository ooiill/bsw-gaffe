<?php
/*
 * Copyright (c) 2017-2018 THL A29 Limited, a Tencent company. All Rights Reserved.
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *    http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
namespace TencentCloud\Market\V20191010\Models;
use TencentCloud\Common\AbstractModel;

/**
 * Error结构
 *
 * @method string getCode() 获取一级错误描述
 * @method void setCode(string $Code) 设置一级错误描述
 * @method string getMessage() 获取二级错误描述
 * @method void setMessage(string $Message) 设置二级错误描述
 */
class Error extends AbstractModel
{
    /**
     * @var string 一级错误描述
     */
    public $Code;

    /**
     * @var string 二级错误描述
     */
    public $Message;

    /**
     * @param string $Code 一级错误描述
     * @param string $Message 二级错误描述
     */
    function __construct()
    {

    }

    /**
     * For internal only. DO NOT USE IT.
     */
    public function deserialize($param)
    {
        if ($param === null) {
            return;
        }
        if (array_key_exists("Code",$param) and $param["Code"] !== null) {
            $this->Code = $param["Code"];
        }

        if (array_key_exists("Message",$param) and $param["Message"] !== null) {
            $this->Message = $param["Message"];
        }
    }
}
