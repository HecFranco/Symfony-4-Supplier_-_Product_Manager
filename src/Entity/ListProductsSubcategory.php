<?php

namespace App\Entity;

use Doctrine\ORM\Mapping as ORM;

/**
 * ListProductsSubcategory
 *
 * @ORM\Table(name="list_products_subcategory", indexes={@ORM\Index(name="user_id", columns={"user_id"}), @ORM\Index(name="products_categories", columns={"products_categories_id"})})
 * @ORM\Entity
 */
class ListProductsSubcategory
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
     * @ORM\Column(name="name", type="string", length=100, nullable=false)
     */
    private $name;

    /**
     * @var int
     *
     * @ORM\Column(name="order_weight", type="smallint", nullable=false)
     */
    private $orderWeight;

    /**
     * @var \DateTime
     *
     * @ORM\Column(name="created_on", type="datetime", nullable=false, options={"default"="CURRENT_TIMESTAMP"})
     */
    private $createdOn = 'CURRENT_TIMESTAMP';

    /**
     * @var \ListProductsCategories
     *
     * @ORM\ManyToOne(targetEntity="ListProductsCategories")
     * @ORM\JoinColumns({
     *   @ORM\JoinColumn(name="products_categories_id", referencedColumnName="id")
     * })
     */
    private $productsCategories;

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

    public function getName(): ?string
    {
        return $this->name;
    }

    public function setName(string $name): self
    {
        $this->name = $name;

        return $this;
    }

    public function getOrderWeight(): ?int
    {
        return $this->orderWeight;
    }

    public function setOrderWeight(int $orderWeight): self
    {
        $this->orderWeight = $orderWeight;

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

    public function getProductsCategories(): ?ListProductsCategories
    {
        return $this->productsCategories;
    }

    public function setProductsCategories(?ListProductsCategories $productsCategories): self
    {
        $this->productsCategories = $productsCategories;

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
