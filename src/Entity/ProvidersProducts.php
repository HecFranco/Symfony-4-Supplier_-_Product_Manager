<?php

namespace App\Entity;

use Doctrine\ORM\Mapping as ORM;

/**
 * ProvidersProducts
 *
 * @ORM\Table(name="providers_products", indexes={@ORM\Index(name="products_id", columns={"product_id"}), @ORM\Index(name="provider_id", columns={"provider_id"}), @ORM\Index(name="user_id", columns={"user_id"})})
 * @ORM\Entity
 */
class ProvidersProducts
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
     * @ORM\Column(name="description", type="string", length=255, nullable=false)
     */
    private $description;

    /**
     * @var int|null
     *
     * @ORM\Column(name="units", type="integer", nullable=true)
     */
    private $units;

    /**
     * @var string|null
     *
     * @ORM\Column(name="surface_area", type="string", length=15, nullable=true)
     */
    private $surfaceArea;

    /**
     * @var string|null
     *
     * @ORM\Column(name="length", type="string", length=10, nullable=true)
     */
    private $length;

    /**
     * @var string|null
     *
     * @ORM\Column(name="size", type="string", length=10, nullable=true)
     */
    private $size;

    /**
     * @var string|null
     *
     * @ORM\Column(name="code", type="string", length=30, nullable=true)
     */
    private $code;

    /**
     * @var float|null
     *
     * @ORM\Column(name="price", type="float", precision=10, scale=0, nullable=true)
     */
    private $price;

    /**
     * @var string
     *
     * @ORM\Column(name="note", type="text", length=65535, nullable=false)
     */
    private $note;

    /**
     * @var \DateTime
     *
     * @ORM\Column(name="created_on", type="datetime", nullable=false, options={"default"="CURRENT_TIMESTAMP"})
     */
    private $createdOn = 'CURRENT_TIMESTAMP';

    /**
     * @var \Products
     *
     * @ORM\ManyToOne(targetEntity="Products")
     * @ORM\JoinColumns({
     *   @ORM\JoinColumn(name="product_id", referencedColumnName="id")
     * })
     */
    private $product;

    /**
     * @var \Providers
     *
     * @ORM\ManyToOne(targetEntity="Providers")
     * @ORM\JoinColumns({
     *   @ORM\JoinColumn(name="provider_id", referencedColumnName="id")
     * })
     */
    private $provider;

    /**
     * @var \Users
     *
     * @ORM\ManyToOne(targetEntity="Users")
     * @ORM\JoinColumns({
     *   @ORM\JoinColumn(name="user_id", referencedColumnName="id")
     * })
     */
    private $user;

    public function getId(): ?int
    {
        return $this->id;
    }

    public function getDescription(): ?string
    {
        return $this->description;
    }

    public function setDescription(string $description): self
    {
        $this->description = $description;

        return $this;
    }

    public function getUnits(): ?int
    {
        return $this->units;
    }

    public function setUnits(?int $units): self
    {
        $this->units = $units;

        return $this;
    }

    public function getSurfaceArea(): ?string
    {
        return $this->surfaceArea;
    }

    public function setSurfaceArea(?string $surfaceArea): self
    {
        $this->surfaceArea = $surfaceArea;

        return $this;
    }

    public function getLength(): ?string
    {
        return $this->length;
    }

    public function setLength(?string $length): self
    {
        $this->length = $length;

        return $this;
    }

    public function getSize(): ?string
    {
        return $this->size;
    }

    public function setSize(?string $size): self
    {
        $this->size = $size;

        return $this;
    }

    public function getCode(): ?string
    {
        return $this->code;
    }

    public function setCode(?string $code): self
    {
        $this->code = $code;

        return $this;
    }

    public function getPrice(): ?float
    {
        return $this->price;
    }

    public function setPrice(?float $price): self
    {
        $this->price = $price;

        return $this;
    }

    public function getNote(): ?string
    {
        return $this->note;
    }

    public function setNote(string $note): self
    {
        $this->note = $note;

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

    public function getProduct(): ?Products
    {
        return $this->product;
    }

    public function setProduct(?Products $product): self
    {
        $this->product = $product;

        return $this;
    }

    public function getProvider(): ?Providers
    {
        return $this->provider;
    }

    public function setProvider(?Providers $provider): self
    {
        $this->provider = $provider;

        return $this;
    }

    public function getUser(): ?Users
    {
        return $this->user;
    }

    public function setUser(?Users $user): self
    {
        $this->user = $user;

        return $this;
    }


}
