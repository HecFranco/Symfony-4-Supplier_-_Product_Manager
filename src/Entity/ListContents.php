<?php

namespace App\Entity;

use Doctrine\ORM\Mapping as ORM;

/**
 * ListContents
 *
 * @ORM\Table(name="list_contents", indexes={@ORM\Index(name="list_translations_sections_id", columns={"list_sections_id"})})
 * @ORM\Entity
 */
class ListContents
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
     * @ORM\Column(name="name", type="string", length=255, nullable=false)
     */
    private $name;

    /**
     * @var \DateTime
     *
     * @ORM\Column(name="created_on", type="datetime", nullable=false, options={"default"="CURRENT_TIMESTAMP"})
     */
    private $createdOn = 'CURRENT_TIMESTAMP';

    /**
     * @var \ListSections
     *
     * @ORM\ManyToOne(targetEntity="ListSections")
     * @ORM\JoinColumns({
     *   @ORM\JoinColumn(name="list_sections_id", referencedColumnName="id")
     * })
     */
    private $listSections;

    public function getId(): ?int
    {
        return $this->id;
    }

    public function getName(): ?string
    {
        return $this->name;
    }

    public function setName(string $name): self
    {
        $this->name = $name;

        return $this;
    }

    public function getCreatedOn(): ?\DateTimeInterface
    {
        return $this->createdOn;
    }

    public function setCreatedOn(\DateTimeInterface $createdOn): self
    {
        $this->createdOn = $createdOn;

        return $this;
    }

    public function getListSections(): ?ListSections
    {
        return $this->listSections;
    }

    public function setListSections(?ListSections $listSections): self
    {
        $this->listSections = $listSections;

        return $this;
    }


}
