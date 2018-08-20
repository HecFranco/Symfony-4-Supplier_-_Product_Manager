<?php
/**
 * Created by PhpStorm.
 * User: Creativos6_
 * Date: 30/07/2018
 * Time: 12:02
 */

namespace App\Repository;



use Doctrine\Bundle\DoctrineBundle\Repository\ServiceEntityRepository;
use Symfony\Bridge\Doctrine\RegistryInterface;

use App\Entity\Translations;
use App\Entity\ListLanguages;
use App\Entity\ListSections;
use App\Entity\ListContents;

class TranslationsRepository extends ServiceEntityRepository
{
    public function __construct(RegistryInterface $registry)
    {
        parent::__construct($registry, Translations::class);
    }

    /**
     * @param $auth
     * @return translations[]
     */
    public function getTranslationsRefactored(): array
    {
        // we extract the complete list of settings
        $qb = $this->createQueryBuilder('t')
            ->select('t.translation', 'lTL.name as language', 'lTC.name as content', 'lTS.name as section')
            ->innerJoin('t.language', 'lTL', 'lTL.id = t.language')
            ->innerJoin('t.content', 'lTC', 'lTC.id = t.content')
            ->innerJoin('lTC.section', 'lTS', 'lTS.id = t.section')
            ->orderBy('t.language', 'ASC')
            ->getQuery();
        $query = $qb->execute();
        // $translationsData = $this->getStructureLanguages();
        foreach ( $query as $key => $value ){
            $translationsData[$value['language']][$value['section']][$value['content']] = $value['translation'];
        }
        return $translationsData;
    }

    public function getStructureLanguages(): array
    {
        $em = $this->getEntityManager();
        $languages_repo = $em->getRepository(ListLanguages::class);
        $allLanguages = $languages_repo->findAll();
        $sections_repo = $em->getRepository(ListSections::class);
        $allSections = $sections_repo->findAll();
        $contents_repo = $em->getRepository(ListContents::class);
        $allContents = $contents_repo->findAll();
        $translationsData = [];
        foreach ($allLanguages as $keyLanguage => $valueLanguage) {
            foreach ($allSections as $keySection => $valueSection) {
                foreach ($allContents as $keyContent => $valueContent) {
                    $translationsData[$valueLanguage->getName()][$valueSection->getName()][$valueContent->getName()] = null;
                }
            }
        }
        return $translationsData;
    }
}