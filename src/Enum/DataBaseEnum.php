<?php
/**
 * Created by PhpStorm.
 * User: usuario
 * Date: 25/07/2018
 * Time: 23:18
 */

namespace App\Enum;

abstract class DataBaseEnum
{
    public const LISTGENDERS = [
        'male',
        'femme'
    ];
    public const LISTROLES = [
        'ROLE_ADMIN',
        'ROLE_USER'
    ];
    public const LISTSETTINGS = [
        [   'name'=>'name_app',
            'description'=> NULL ,
            'value'=>'unnamed',
            'auth'=> false
        ],
        [
            'name'=>'url_img_logo_vertical',
            'description'=> NULL ,
            'value'=>'/assets/images/logo_default_dark.png',
            'auth'=> false
        ],
        [
            'name'=>'url_img_logo_horizontal',
            'description'=> NULL ,
            'value'=>'/assets/images/logo_default_dark.png',
            'auth'=> false
        ],
        [
            'name'=>'dismiss_secs_alerts',
            'description'=> NULL ,
            'value'=>'10',
            'auth'=> false
        ],        
    ];
    public static function getListGenders()
    {
        return self::LISTGENDERS;
    }
    public static function getListRoles()
    {
        return self::LISTROLES;
    }
    public static function getListSettings()
    {
        return self::LISTSETTINGS;
    }
}