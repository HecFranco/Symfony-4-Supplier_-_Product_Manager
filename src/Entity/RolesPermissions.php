<?php

namespace App\Entity;

use Doctrine\ORM\Mapping as ORM;

/**
 * RolesPermissions
 *
 * @ORM\Table(name="roles_permissions", indexes={@ORM\Index(name="permission", columns={"permission"}), @ORM\Index(name="role", columns={"role"})})
 * @ORM\Entity
 */
class RolesPermissions
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
     * @var \ListPermissions
     *
     * @ORM\ManyToOne(targetEntity="ListPermissions")
     * @ORM\JoinColumns({
     *   @ORM\JoinColumn(name="permission", referencedColumnName="id")
     * })
     */
    private $permission;

    /**
     * @var \ListRoles
     *
     * @ORM\ManyToOne(targetEntity="ListRoles")
     * @ORM\JoinColumns({
     *   @ORM\JoinColumn(name="role", referencedColumnName="id")
     * })
     */
      
    private $role;

    /**
     * @var bool
     *
     * @ORM\Column(name="value", type="boolean", nullable=false)
     */
    private $value;

    /**
     * @var \DateTime
     *
     * @ORM\Column(name="created_on", type="datetime", nullable=false)
     */

    private $createdOn;  

    public function getId(): ?int
    {
        return $this->id;
    }

    public function getPermission(): ?ListPermissions
    {
        return $this->permission;
    }

    public function setPermission(?ListPermissions $permission): self
    {
        $this->permission = $permission;

        return $this;
    }

    public function getRole(): ?ListRoles
    {
        return $this->role;
    }

    public function setRole(?ListRoles $role): self
    {
        $this->role = $role;

        return $this;
    }

    public function getValue(): ?bool
    {
        return $this->value;
    }

    public function setValue(bool $value): self
    {
        $this->value = $value;

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

}
