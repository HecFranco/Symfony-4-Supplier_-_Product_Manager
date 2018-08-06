<?php
/**
 * Created by PhpStorm.
 * User: usuario
 * Date: 03/08/2018
 * Time: 21:15
 */

namespace App\Controller;

use Symfony\Bundle\FrameworkBundle\Controller\Controller;
use Symfony\Component\HttpFoundation\JsonResponse;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\HttpFoundation\Request;

use App\Entity\Users;

class UserController extends Controller
{

    public function getDataUser( Request $request )
    {
        $serializer = $this->get('jms_serializer');
        // Load Entity Manager
        $em = $this->getDoctrine()->getManager();
        // Get User
        $userId = $this->getUser()->getId();
        // Load User_repo
        $user_repo = $em->getRepository(Users::class);
        $user = $user_repo->findOneBy(array('id'=>$userId));
        $result = [
            'result'=>$user,
        ];
        return new Response($serializer->serialize($result, "json"));
        // return new JsonResponse($result);
    }

}