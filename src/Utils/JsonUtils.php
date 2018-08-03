<?php
/**
 * Created by PhpStorm.
 * User: usuario
 * Date: 29/07/2018
 * Time: 20:20
 */

namespace App\Utils;


class JsonUtils
{
    /**
     * @param array $array
     * @param bool $recursive
     * @return \stdClass
     */
    public function arrayToObject(array $array, $recursive = false) : \stdClass {
        $object = new \stdClass();
        foreach ($array as $key => $value)
        {
            if($recursive && \is_array($value)){
                $object->$key = $this->arrayToObject($value, true);
            } else {
                $object->key = $value;
            }
        }
        return $object;
    }
}