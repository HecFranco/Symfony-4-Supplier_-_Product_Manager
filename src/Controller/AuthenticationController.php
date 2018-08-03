<?php

namespace App\Controller;

use FOS\RestBundle\Controller\FOSRestController;

use Symfony\Component\HttpFoundation\JsonResponse;
use Symfony\Component\HttpFoundation\Request;

use App\Services\AuthenticationService;

class AuthenticationController extends FOSRestController
{
    public function getLoginCheck()
    {
    }
    public function signup(
        Request $request,
        AuthenticationService $AuthenticationService
    )
    {
        return new JsonResponse( $AuthenticationService->createNewUser($request) );
    }

    public function forgetPassword(
        Request $request,
        AuthenticationService $AuthenticationService
    )
    {
        return new JsonResponse( $AuthenticationService->sendEmailPassword($request) );
    }

}