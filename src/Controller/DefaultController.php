<?php
namespace App\Controller;

use Symfony\Bundle\FrameworkBundle\Controller\Controller;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;

use App\Entity\Users;
use App\Entity\UsersRoles;

class DefaultController extends Controller
{
    public function index(Request $request): Response
    {
      $userId = 3;
      $em = $this->getDoctrine()->getManager();
      $users_repo = $em->getRepository(Users::class);
      $usersRoles_repo = $em->getRepository(UsersRoles::class);               
      $user = $users_repo->findOneBy(array('id'=>$userId));
      $role = $usersRoles_repo->findOneBy(array('user'=>$user));
      return new Response('Hello!');     
    }
}