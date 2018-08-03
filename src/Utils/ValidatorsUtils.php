<?php

namespace App\Utils;

class ValidatorsUtils
{
    function isValidDataUser($user){
        // Validate data
        $validateData =
            $this->isValidEmail($user['email']) &&
            $this->isValidPassword($user['password']) &&
            $this->isValidName($user['firstname']) &&
            $this->isValidName($user['lastname']);
        return $validateData;
    }

    function isValidEmail($str)
    {
        /*
         * Is_email
         * Length <50
         */
        $matches = null;
        $maxLength = 50;
        // Is_email
        $isEmail = (1 === preg_match('/^[A-z0-9\._-]+@[A-z0-9][A-z0-9-]*(\.[A-z0-9_-]+)*\.([A-z]{2,6})$/', $str, $matches));
        // Length <50
        $isLength = ( strlen ( $str ) < $maxLength ) ? true : false;
        // Response Function
        return ( $isEmail && $isLength ) ? true : false;
    }

    function isValidPassword($str)
    {
        /*
         * 1 uppercase char
         * 4 > len(password)
         * 8 < len(password)
         * include one number
         */
        $matches = null;
        // Is_email
        $isPassword = (1 === preg_match('/^\S*(?=\S{4,8})(?=\S*[a-z])(?=\S*[A-Z])(?=\S*[\d])\S*$/', $str, $matches));
        // Response Function
        return $isPassword;
    }

    function isValidName($str)
    {
        /*
         * Length <50
         */
        $maxLength = 50;
        $isLength = ( strlen ( $str ) < $maxLength ) ? true : false;
        // Response Function
        return $isLength;
    }
}
