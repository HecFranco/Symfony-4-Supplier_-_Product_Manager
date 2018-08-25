<?php
/**
 * Created by PhpStorm.
 * User: usuario
 * Date: 16/08/2018
 * Time: 17:58
 */

namespace App\Repository;

use Doctrine\Bundle\DoctrineBundle\Repository\ServiceEntityRepository;
use Symfony\Bridge\Doctrine\RegistryInterface;
use Symfony\Component\Validator\Constraints\DateTime;
use App\Entity\Users;
use App\Entity\Business;
use App\Entity\UsersRoles;
use App\Entity\ListRoles;
use App\Entity\RolesPermissions;

class UsersRepository extends ServiceEntityRepository
{
    public function __construct(RegistryInterface $registry)
    {
        parent::__construct($registry, Users::class);
    }

    public function getDataUser($userId): array
    {
        // we extract the complete list of dataUser
        $result = $this->createQueryBuilder('u')
            ->select('u.email, u.image, u.firstname, u.lastname, u.birthdate' )
            ->where('u.id =:userId')
            ->setParameter('userId', $userId)
            ->getQuery()
            ->getSingleResult();
        return $result;
    }

    public function getPermissions($userId): array
    {
        $em = $this->getEntityManager();
        $users_repo = $em->getRepository(Users::class);
        $roles_repo = $em->getRepository(ListRoles::class);
        $rolesPermissions_repo = $em->getRepository(RolesPermissions::class);  
        $user = $users_repo->findOneById($userId);
        $roles = $user->getRoles();        
        $role = $roles_repo->findOneBy(array('role'=>$roles[0])); 
        $permissions = $role->getListPermissions();     
        foreach($permissions as $key => $value){
            $valuePermission = $value->getValue();
            $result[$value->getPermission()->getName()]= $valuePermission;
        }
        return $result;
    }    
    public function getDataBusiness($userId): array
    {
        // we extract the complete list of dataUser
        $result = $this->createQueryBuilder('u')
        ->select('b.image, b.brandName')
        ->innerJoin('u.business', 'b', 'b.id = u.business')
        ->where('u.id =:userId')
        ->setParameter('userId', $userId)
        ->getQuery()
        ->getSingleResult();
        return $result;
    }    
}