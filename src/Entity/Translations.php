<?php

namespace App\Entity;

use Doctrine\ORM\Mapping as ORM;

/**
 * Translations
 *
 * @ORM\Table(name="translations", indexes={@ORM\Index(name="list_translations_content", columns={"list_content_id"}), @ORM\Index(name="list_translations_languages", columns={"list_language_id"})})
 * @ORM\Entity
 */
class Translations
{
    /**
     * @var int
     *
     * @ORM\Column(name="id", type="integer", nullable=false)
     * @ORM\Id
     * @ORM\GeneratedValue(strategy="IDENTITY")
     */
    private $id;

    /**
     * @var string
     *
     * @ORM\Column(name="translation", type="string", length=255, nullable=false)
     */
    private $translation;

    /**
     * @var \ListLanguages
     *
     * @ORM\ManyToOne(targetEntity="ListLanguages")
     * @ORM\JoinColumns({
     *   @ORM\JoinColumn(name="list_language_id", referencedColumnName="id")
     * })
     */
    private $listLanguage;

    /**
     * @var \ListContents
     *
     * @ORM\ManyToOne(targetEntity="ListContents")
     * @ORM\JoinColumns({
     *   @ORM\JoinColumn(name="list_content_id", referencedColumnName="id")
     * })
     */
    private $listContent;

    public function getId(): ?int
    {
        return $this->id;
    }

    public function getTranslation(): ?string
    {
        return $this->translation;
    }

    public function setTranslation(string $translation): self
    {
        $this->translation = $translation;

        return $this;
    }

    public function getListLanguage(): ?ListLanguages
    {
        return $this->listLanguage;
    }

    public function setListLanguage(?ListLanguages $listLanguage): self
    {
        $this->listLanguage = $listLanguage;

        return $this;
    }

    public function getListContent(): ?ListContents
    {
        return $this->listContent;
    }

    public function setListContent(?ListContents $listContent): self
    {
        $this->listContent = $listContent;

        return $this;
    }


}
