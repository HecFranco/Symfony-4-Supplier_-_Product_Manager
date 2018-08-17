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
            $permissionsName = 'permissions_';
            $businessField = str_replace($businessName, '', $key);
            if (strpos($key, $businessName) !== false){
                $result['business'][$businessField] = $value;
            }elseif(strpos($key, $permissionsName) !== false){
                // Todo
            }else{
                $result[$key] = $value;
            }
        }
        return $result;
    }
}