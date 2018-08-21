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
use Symfony\Component\Security\Core\Encoder\UserPasswordEncoderInterface;

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
    $user = $user_repo->getDataUser($userId);
    // $user = $user_repo->findOneBy(array('id'=>$userId));
    $result = [
      'result'=>$user,
    ];
    // return new Response($serializer->serialize($result, "json"));
    return new JsonResponse($result);
  }
  public function updateDataUser( 
    Request $request,
    UserPasswordEncoderInterface $encoder
   )
  {
    // Load Entity Manager
    $em = $this->getDoctrine()->getManager();
    // Get User
    $userId = $this->getUser()->getId();
    // Load data input
    // Form System 
    // Create variables with input data
    $firstname = $request->get('firstname');
    $lastname = $request->get('lastname');
    $email =$request->get('email');
    $password = $request->get('password');
    // php > var_export(DateTimeZone::listIdentifiers());
    // $timeZone = $request->get('time_zone');
    try {    
      $user_repo = $em->getRepository(Users::class);  
      $user = $user_repo->findOneById($userId);
      $user->setFirstname($firstname);
      $user->setLastname($lastname);
      $user->setEmail($email);
      $user->setPassword($encoder->encodePassword($user, $password));
      $user->setPlainPassword($password);                  
      $em->persist($user);
      $em->flush();
      $message = 'ok';
    } catch (Exception $ex) {
      $code = 500;
      $error = true;
      $message = "An error has occurred trying to save the data - Error: {$ex->getMessage()}";
    }
    $response = [
      'result'=>[
        'message'=>$message
      ]
    ];
    return new JsonResponse($response);
  }    
}