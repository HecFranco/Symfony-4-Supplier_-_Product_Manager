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
     * @var \ListContents
     *
     * @ORM\ManyToOne(targetEntity="ListContents")
     * @ORM\JoinColumns({
     *   @ORM\JoinColumn(name="content", referencedColumnName="id")
     * })
     */
    private $content;

    /**
     * @var \ListLanguages
     *
     * @ORM\ManyToOne(targetEntity="ListLanguages")
     * @ORM\JoinColumns({
     *   @ORM\JoinColumn(name="language", referencedColumnName="id")
     * })
     */
    private $language;

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

    public function getContent(): ?ListContents
    {
        return $this->content;
    }

    public function setContent(?ListContents $content): self
    {
        $this->content = $content;

        return $this;
    }

    public function getLanguage(): ?ListLanguages
    {
        return $this->language;
    }

    public function setLanguage(?ListLanguages $language): self
    {
        $this->language = $language;

        return $this;
    }


}
