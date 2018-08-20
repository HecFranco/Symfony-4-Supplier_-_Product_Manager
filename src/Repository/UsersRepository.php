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

use App\Entity\Users;
use App\Entity\Business;
use App\Entity\UsersRoles;
use App\Entity\RolesPermissions;

class UsersRepository extends ServiceEntityRepository
{
    public function __construct(RegistryInterface $registry)
    {
        parent::__construct($registry, Users::class);
    }
    /**
     * @param $auth
     * @return settings[]
     */
    public function getDataUser($userId): array
    {
        // we extract the complete list of settings
        $qb = $this->createQueryBuilder('u')
            ->select('u.email, u.image, u.firstName, u.lastName, b.image as business_image, b.brandName as business_brandName')
            ->innerJoin('u.business', 'b', 'b.id = u.business')
            ->where('u.id =:userId')
            ->setParameter('userId', $userId)
            ->getQuery()
            ->execute();
        foreach($qb[0] as $key=>$value){
            $businessName = 'business_';
            $businessField = str_replace($businessName, '', $key);
            if (strpos($key, $businessName) !== false){
                $result['business'][$businessField] = $value;
            }else{
                $result[$key] = $value;
            }
        }
        $em = $this->getEntityManager();
        $users_repo = $em->getRepository(Users::class);
        $usersRoles_repo = $em->getRepository(UsersRoles::class);  
        $rolesPermissions_repo = $em->getRepository(RolesPermissions::class);             
        $user = $users_repo->findOneById($userId);
        $userRole = $usersRoles_repo->findOneBy(array('user'=>$user));
        $role = $userRole->getRole();
                
        $roleName = $role->getRole();
        $permissions = $role->getListPermissions();     
        foreach($permissions as $key => $value){
            $permission = $rolesPermissions_repo->findOneBy(array('role'=>$role, 'permission'=>$value->getPermission()));
            $valuePermission = $permission->getValue();
            $result['permissions'][$value->getPermission()->getName()]= $valuePermission;
        }
        return $result;
    }
}