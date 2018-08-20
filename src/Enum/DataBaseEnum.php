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
    public const LISTTRANSLATIONS = [
        'es-ES' => [
            'authentication' => [
                'sign_in_to_admin' => 'Iniciar sesión en el Administrador',
                'remember_me' => 'Recuérdame',
                'forget_password' => '¿Olvidáste tu Password?',
                'sign_in' => 'Iniciar sesión',
                'dont_have_an_account_yet' => '¿No tienes cuenta todavía?',
                'sign_up' => 'Regístrate',
                'enter_your_details_to_create_your_account' => 'Introduzca los datos para crear su cuenta:',
                'i_agree_the' => 'Estoy de acuerdo con los',
                'terms_and_conditions' => 'términos y condiciones',
                'cancel' => 'Cancelar',
                'enter_your_email_to_reset_your_password' => 'Introduzca su email para restaurar su password:',
                'request' => 'Solicitar',
                'app_manager' => 'Administrador de aplicaciones',
                'supplier_and_product_manager' => 'Proveedor y Gerente de Productos - %{controller}'
            ],
            'navigation'=>[
                'logout' => 'Salir',
                'my_profile' => 'Mi Perfil'
            ],
            'my_profile'=>[
                'title' => 'Mi Perfil',
                'update_profile' => 'Actualizar Perfil',
                'settings' => 'Configuración',
                'personal_details' => 'Detalles Personales',
                'first_name' => 'Nombe',
                'last_name' => 'Apellidos',
                'email' => 'Email',
                'password' => 'Password',
                'save_changes' => 'Guadar cambios',
                'cancel' => 'Cancelar',                
            ],
            'errors_form'=>[
                'string_required' => 'Campo de texto requerido',
                'email_required' => 'Campo de email requerido',
                'password_required' => 'Campo password requerido',
                'password_confirmation_confirmed' => 'El password no coincide',
            ],
            'messages'=>[
                'processing' => 'Procesando datos...',
            ],
        ],
        'en'=>[
            'authentication'=>[
                'sign_in_to_admin' => 'Sign In To Admin',
                'remember_me' => 'Remember me',
                'forget_password' => 'Forget Password?',
                'sign_in' => 'Sign In',
                'dont_have_an_account_yet' => 'Don\'t have an account yet ?',
                'sign_up' => 'Sign Up',
                'enter_your_details_to_create_your_account' => 'Enter your details to create your account:',
                'i_agree_the' => 'I Agree the',
                'terms_and_conditions' => 'terms and conditions',
                'cancel' => 'Cancel',
                'enter_your_email_to_reset_your_password' => 'Enter your email to reset your password:',
                'request' => 'Request',
                'app_manager' => 'App Manager',
                'supplier_and_product_manager' => 'Supplier & Product Manager'
            ],
            'navigation'=>[
                'logout' => 'Logout',
                'my_profile' => 'My Profile'
            ],
            'my_profile'=>[
                'title' => 'My Profile',
                'update_profile' => 'Update Profile',
                'settings' => 'Settings',
                'personal_details' => 'Personal Details',
                'first_name' => 'First Name',
                'last_name' => 'Last Name',
                'email' => 'Email',
                'password' => 'Password',  
                'save_changes' => 'Save changes',
                'cancel' => 'Cancel',        
            ],
            'errors_form'=>[
                'string_required' => 'Text field required',
                'email_required' => 'Email field required',
                'password_required' => 'Password field required',
                'password_confirmation_confirmed' => 'The password does not match',
            ],
            'messages'=>[
                'processing' => 'Processing data...',
            ],        
        ]     
    ];  
    public const LISTPERMISSIONS = [
        [
            'name'=>'see_complete_company_information',
            'description'=>'ver información completa de empresa'
        ],[
            'name'=>'edit_company_information',
            'description'=>'editar información completa de empresa'
        ],[
            'name'=>'edit_company_see_complete_user_informationinformation',
            'description'=>'ver información completa de usuario'
        ],[
            'name'=>'edit_user_information',
            'description'=>'editar información completa de usuario'
        ]              
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
    public static function getListTranslations()
    {
        return self::LISTTRANSLATIONS;
    } 
    public static function getListPermissions()
    {
        return self::LISTPERMISSIONS;
    }        
}