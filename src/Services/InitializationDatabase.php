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

use App\Entity\ListGenders;
use App\Entity\ListRoles;
use App\Entity\Settings;
use App\Entity\ListLanguages;
use App\Entity\ListSections;
use App\Entity\ListContents;
use App\Entity\Translations;


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
        $this->uploadTranslations();
        return 'Initialized database';
    }

    public function uploadDataListGender()
    {
        $listGenders = DataBaseEnum::getListGenders();
        $listGender_repo = $this->em->getRepository(ListGenders::class);
        foreach ( $listGenders as $item) {
            $gender = $listGender_repo->findOneBy(array('name'=>$item));
            $existGender = ( $gender === NULL )? false : true ;
            if ( !$existGender ) {
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
        $listRole_repo = $this->em->getRepository(ListRoles::class);
        foreach ( $listRoles as $item) {
            $role = $listRole_repo->findOneBy(array('role'=>$item));
            $existRole = ( $role === NULL )? false : true ;
            if ( !$existRole ) {
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
        $settings_repo = $this->em->getRepository(Settings::class);
        foreach ( $settings as $key => $value) {
            $setting = $settings_repo->findOneBy(array('name'=>$key));
            $existSetting = ( $setting === NULL )? false : true ;
            if ( !$existSetting ) {
                $newSetting = new Settings();
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
    public function uploadTranslations()
    {
        $translations = DataBaseEnum::getListTranslations();
        $listLanguages_repo = $this->em->getRepository(ListLanguages::class);
        $listSections_repo = $this->em->getRepository(ListSections::class);
        $listContents_repo = $this->em->getRepository(ListContents::class);
        $translations_repo = $this->em->getRepository(Translations::class);       
        foreach ( $translations as $keyLanguage => $valueLanguage) {
            $language = $listLanguages_repo->findOneBy(array('name'=>$keyLanguage));
            $existLanguage = ( $language === NULL )? false : true ;
            if ( !$existLanguage ) {
                $newLanguage = new ListLanguages();
                $newLanguage->setName($keyLanguage);
                $newLanguage->setCreatedOn(new \DateTime());
                $this->em->persist($newLanguage);
                $this->em->flush();
                $language = $newLanguage;
            }
            foreach ( $valueLanguage as $keySection => $valueSection) {
                $section = $listSections_repo->findOneBy(array('name'=>$keySection));
                $existSection = ( $section === NULL )? false : true ;
                if ( !$existSection ) {
                    $newSection = new ListSections();
                    $newSection->setName($keySection);
                    $newSection->setCreatedOn(new \DateTime());
                    $this->em->persist($newSection);
                    $this->em->flush();
                    $section = $newSection;
                }
                foreach ( $valueSection as $keyContent => $valueContent) {
                    $content = $listContents_repo->findOneBy(array('name'=>$keyContent, 'section'=>$keySection));
                    $existContent = ( $content === NULL )? false : true ;
                    if ( !$existContent ) {
                        $newContent = new ListContents();
                        $newContent->setName($keyContent);
                        $newContent->setSection($section);                        
                        $newContent->setCreatedOn(new \DateTime());
                        $this->em->persist($newContent);
                        $this->em->flush();
                        $content = $newContent;
                    }
                    $translation = $translations_repo->findOneBy(array('language'=>$language, 'content'=>$content));
                    $existTranslation = ( $translation === NULL )? false : true ;
                    if ( !$existTranslation ) {
                        $newTranslation = new Translations();
                        $newTranslation->setTranslation($valueContent);
                        $newTranslation->setContent($content); 
                        $newTranslation->setLanguage($language);                                               
                        $this->em->persist($newTranslation);
                        $this->em->flush();
                    }                    
                }
            }
        }
    }
}