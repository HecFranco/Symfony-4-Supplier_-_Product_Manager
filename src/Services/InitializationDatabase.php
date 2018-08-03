<?php
/**
 * Created by PhpStorm.
 * User: usuario
 * Date: 25/07/2018
 * Time: 23:13
 */

namespace App\Services;

use Doctrine\ORM\EntityManagerInterface;

use App\Enum\DataBaseEnum;

use App\Entity\ListGender;
use App\Entity\ListRole;
use App\Entity\ListSettings;

class InitializationDatabase
{
    private $em;

    public function __construct(EntityManagerInterface $em) {
        $this->em = $em;
    }
    public function uploadDataInitial ()
    {
        $this->uploadDataListGender();
        $this->uploadDataListRole();
        $this->uploadDataListSettings();
        return 'Initialized database';
    }

    public function uploadDataListGender()
    {
        $listGenders = DataBaseEnum::getListGenders();
        $listGender_repo = $this->em->getRepository(ListGender::class);
        foreach ( $listGenders as $item) {
            $gender = $listGender_repo->findOneBy(array('name'=>$item));
            $exist_gender = ( $gender === NULL )? false : true ;
            if ( !$exist_gender ) {
                $newGender = new ListGender();
                $newGender->setName($item);
                $newGender->setCreatedOn(new \DateTime());
                $this->em->persist($newGender);
                $this->em->flush();
            }
        }
    }

    public function uploadDataListRole()
    {
        $listRoles = DataBaseEnum::getListRoles();
        $listRole_repo = $this->em->getRepository(ListRole::class);
        foreach ( $listRoles as $item) {
            $role = $listRole_repo->findOneBy(array('role'=>$item));
            $exist_role = ( $role === NULL )? false : true ;
            if ( !$exist_role ) {
                $newRole = new ListRole();
                $newRole->setRole($item);
                $newRole->setCreatedOn(new \DateTime());
                $this->em->persist($newRole);
                $this->em->flush();
            }
        }
    }

    public function uploadDataListSettings()
    {
        $settings = DataBaseEnum::getListSettings();
        $settings_repo = $this->em->getRepository(ListSettings::class);
        foreach ( $settings as $key => $value) {
            $setting = $settings_repo->findOneBy(array('name'=>$key));
            $exist_setting = ( $setting === NULL )? false : true ;
            if ( !$exist_setting ) {
                $newSetting = new ListSettings();
                $newSetting->setName($value['name']);
                $newSetting->setDescription($value['description']);
                $newSetting->setValue($value['value']);
                $newSetting->setAuth($value['auth']);
                $newSetting->setCreatedOn(new \DateTime());
                $newSetting->setModifiedOn( $newSetting->getCreatedOn() );
                $this->em->persist($newSetting);
                $this->em->flush();
            }
        }
    }
}