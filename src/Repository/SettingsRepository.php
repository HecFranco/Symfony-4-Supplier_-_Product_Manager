<?php
/**
 * Created by PhpStorm.
 * User: Creativos6_
 * Date: 30/07/2018
 * Time: 11:05
 */

namespace App\Repository;

use Doctrine\Bundle\DoctrineBundle\Repository\ServiceEntityRepository;
use Symfony\Bridge\Doctrine\RegistryInterface;

use App\Entity\Settings;

class SettingsRepository extends ServiceEntityRepository
{
    public function __construct(RegistryInterface $registry)
    {
        parent::__construct($registry, Settings::class);
    }
    /**
     * @param $auth
     * @return settings[]
     */
    public function getListSettingsRefactored( $auth = false ): array
    {
        // we extract the complete list of settings
        $qb = $this->createQueryBuilder('lS');
        // If $auth is false, we extract only those, but all of them.
        if(!$auth){
            $qb->andWhere('lS.auth = :auth')
                ->setParameter('auth', $auth);
        }
        $listSettings =
            $qb->orderBy('lS.name', 'ASC')
                ->getQuery()
                ->execute();
        $settings = [];
        foreach ($listSettings as $key => $value){
            $data['description']= $value->getDescription();
            $data['value']= $value->getValue();
            $settings[$value->getName()] = $data;
        };
        return $settings;
    }
}