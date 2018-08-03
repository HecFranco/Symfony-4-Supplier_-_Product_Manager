<?php

namespace App\Services;

use Symfony\Component\HttpFoundation\Request;
// use Symfony\Component\HttpKernel\Exception\BadRequestHttpException;
use Symfony\Component\Security\Core\Encoder\UserPasswordEncoderInterface;

use Doctrine\ORM\EntityManagerInterface;

use Gesdinet\JWTRefreshTokenBundle\Entity\RefreshToken;
use Lexik\Bundle\JWTAuthenticationBundle\Services\JWTTokenManagerInterface;

use App\Entity\ListRoles;
use App\Entity\Users;
use App\Entity\UsersRoles;
use App\Utils\ValidatorsUtils;

class AuthenticationService
{
    private $em;
    private $tokenManager;
    private $encoder;
    private $validatorUtils;

    public function __construct(EntityManagerInterface $em, JWTTokenManagerInterface $tokenManager,
                                UserPasswordEncoderInterface $encoder,
                                ValidatorsUtils $validatorUtils)
    {
        $this->em = $em;
        $this->tokenManager = $tokenManager;
        $this->encoder = $encoder;
        $this->validatorUtils = $validatorUtils;
    }

    public function sendEmailPassword(Request $request)
    {
        return [
            'result'=>[
                'message'=>'ok'
            ]
        ];
    }
    public function createNewUser(Request $request)
    {
        // Clean Data
        $dataUser = $this->buildUser($request);
        $dataUser = $this->cleanDataUser($dataUser);
        // Exist user in database & valid data user
        $existUser = $this->existUser($dataUser['email']);
        $validateData = $this->validatorUtils->isValidDataUser($dataUser);
        // Condition validate_data
        if (!$existUser && $validateData) {
            $newUser = $this->persistNewUser($dataUser);
            $this->persistNewRoleUser($newUser,'ROLE_USER');
        } else {
            if ($existUser) {
                $message = "User already registered.";
            } else {
                $message = "Error: Data no valid";
            }
            // Change the status to 500
            // throw new BadRequestHttpException($message);
            return [
                'result'=>[
                    'message'=>$message
                ]
            ];
        }
        return $this->generateJWT($newUser);
    }
    public function generateJWT($user)
    {
        // Generate Token
        /** @var JWTTokenManagerInterface $jwtManager */
        $jwtManager = $this->tokenManager;
        // Generate Refresh Token
        $refreshToken = new RefreshToken();
        $refreshToken->setRefreshToken();
        $refreshToken->setUsername($user->getUsername());
        $nextJWT = new \DateTime('+1 week');
        $refreshToken->setValid($nextJWT);
        $this->em->persist($refreshToken);
        $this->em->flush();
        $refreshToken_user = $refreshToken->getRefreshToken();
        // Response Function
        return [
            'token' => $jwtManager->create($user),
            'refresh_token' => $refreshToken_user
        ];
    }
    public function persistNewRoleUser($newUser, $role = null)
    {
        // Find Role
        $role_repo = $this->em->getRepository(ListRoles::class);
        $role = $role_repo->findOneBy(['role' => $role]);
        $userRole = new usersRoles();
        $userRole->setRole($role);
        $userRole->setUser($newUser);
        $this->em->persist($userRole);
        $this->em->flush();
        // Response Function
        return $newUser;
    }
    public function persistNewUser($user)
    {
        $newUser = new Users();
        $newUser->setFirstName($user['firstname']);
        $newUser->setLastName($user['lastname']);
        $newUser->setEmail($user['email']);
        $newUser->setUsername($newUser->getEmail());
        $newUser->setPlainPassword($user['password']);
        $newUser->setPassword($this->encoder->encodePassword($newUser, $user['password']));
        $newUser->setTimezone($user['time_zone']);
        $newUser->setLastModifiedOn(new \DateTime());
        $newUser->setCreatedOn($newUser->getLastModifiedOn());
        $this->em->persist($newUser);
        $this->em->flush();
        // Response Function
        return $newUser;
    }
    public function buildUser(Request $request)
    {
        /*
         * Form System
         */
        // Create variables with input data
        $firstname = $request->get('firstname');
        $lastname = $request->get('lastname');
        $email =$request->get('email');
        $password = $request->get('password');
        $timeZone = $request->get('time_zone');
        // new array with data user
        $dataUser = [
            'firstname' => $firstname,
            'lastname' => $lastname,
            'email' => $email,
            'password' => $password,
            'time_zone' => $timeZone
        ];
        // Response Function
        return $dataUser;
    }
    public function cleanDataUser($dataUser)
    {
        // clean data
        $dataUser['email'] = filter_var(trim($dataUser['email']), FILTER_SANITIZE_EMAIL);
        $dataUser['password'] = filter_var(trim($dataUser['password']), FILTER_SANITIZE_STRING);
        $dataUser['firstname'] = filter_var(trim($dataUser['firstname']), FILTER_SANITIZE_STRING);
        $dataUser['lastname'] = filter_var(trim($dataUser['lastname']), FILTER_SANITIZE_STRING);
        // Response Function
        return $dataUser;
    }
    public function existUser($email)
    {
        // Clean Data
        $email = filter_var(trim($email), FILTER_SANITIZE_EMAIL);
        // Load User_repo
        $user_repo = $this->em->getRepository(Users::class);
        $issetUserEmail = $user_repo->findOneBy(array("email" => $email));
        // Exist user ?
        $existUser = $issetUserEmail !== null;
        // Response Function
        return $existUser;
    }
}