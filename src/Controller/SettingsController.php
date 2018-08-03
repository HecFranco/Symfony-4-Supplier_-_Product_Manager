<?php
/**
 * Created by PhpStorm.
 * User: Creativos6_
 * Date: 26/07/2018
 * Time: 16:22
 */

namespace App\Controller;


use Symfony\Bundle\FrameworkBundle\Controller\Controller;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\HttpFoundation\JsonResponse;

use App\Entity\Settings;
use App\Entity\Translations;

class SettingsController extends Controller
{
    public function getSettings( Request $request )
    {
        // Load Entity Manager
        $em = $this->getDoctrine()->getManager();
        // Load User_repo
        $listSettings_repo = $em->getRepository(Settings::class);
        $settings = $listSettings_repo->getListSettingsRefactored();
        $result = [
            'result'=>$settings,
        ];
        return new JsonResponse($result);
    }

    public function getSettingsAuth( Request $request )
    {
        // Load Entity Manager
        $em = $this->getDoctrine()->getManager();
        // Load User_repo
        $listSettings_repo = $em->getRepository(Settings::class);
        $settings = $listSettings_repo->getListSettingsRefactored(true);
        $result = [
            'result'=>$settings,
        ];
        return new JsonResponse($result);
    }

    public function getTranslations ( Request $request )
    {
        // Load Entity Manager
        $em = $this->getDoctrine()->getManager();
        // Load User_repo
        $listSettings_repo = $em->getRepository(Translations::class);
        $settings = $listSettings_repo->getTranslationsRefactored();
        $result = [
            'result'=>$settings,
        ];
        return new JsonResponse($result);
    }
}