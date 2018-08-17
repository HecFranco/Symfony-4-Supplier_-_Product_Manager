<?php

namespace App\Entity;

use Doctrine\ORM\Mapping as ORM;

use Symfony\Component\Validator\Constraints as Assert;
use Doctrine\Common\Collections\ArrayCollection;
use Doctrine\Common\Collections\Collection;

use Symfony\Component\Security\Core\User\UserInterface;
use JMS\Serializer\Annotation as Serializer;

use DateTime;
/**
 * Users
 *
 * @ORM\Table(name="users", uniqueConstraints={@ORM\UniqueConstraint(name="users_uniques_fields", columns={"email", "username"})}, indexes={@ORM\Index(name="gender", columns={"gender"}), @ORM\Index(name="business_id", columns={"business_id"})})
 * @ORM\Entity
 */
class Users implements UserInterface
{
    /**
     * @var int
     *
     * @ORM\Column(name="id", type="bigint", nullable=false)
     * @ORM\Id
     * @ORM\GeneratedValue(strategy="IDENTITY")
     */
    private $id;

    /**
     * @var string|null
     *
     * @ORM\Column(name="image", type="string", length=255, nullable=true)
     */
    private $image;

    /**
     * @var string
     *
     * @ORM\Column(name="username", type="string", length=250, nullable=false)
     */
    private $username;

    /**
     * @var string
     *
     * @ORM\Column(name="email", type="string", length=250, nullable=false)
     */
    private $email;

    /**
     * @var string
     *
     * @ORM\Column(name="password", type="string", length=250, nullable=false)
     */
    private $password;

    /**
     * @var string
     *
     * @ORM\Column(name="plain_password", type="text", length=65535, nullable=false)
     */
    private $plainPassword;

    /**
     * @var string
     *
     * @ORM\Column(name="first_name", type="string", length=250, nullable=false)
     */
    private $firstName;

    /**
     * @var string
     *
     * @ORM\Column(name="last_name", type="string", length=250, nullable=false)
     */
    private $lastName;

    /**
     * @var string|null
     *
     * @ORM\Column(name="address", type="string", length=250, nullable=true)
     */
    private $address;

    /**
     * @var string|null
     *
     * @ORM\Column(name="postal_code", type="string", length=25, nullable=true)
     */
    private $postalCode;

    /**
     * @var string|null
     *
     * @ORM\Column(name="phone", type="string", length=25, nullable=true)
     */
    private $phone;

    /**
     * @var string|null
     *
     * @ORM\Column(name="phone2", type="string", length=25, nullable=true)
     */
    private $phone2;

    /**
     * @var \DateTime|null
     *
     * @ORM\Column(name="birthdate", type="date", nullable=true)
     */
    private $birthdate;

    /**
     * @var int|null
     *
     * @ORM\Column(name="year_of_birth", type="integer", nullable=true)
     */
    private $yearOfBirth;

    /**
     * @var string|null
     *
     * @ORM\Column(name="timezone", type="string", length=50, nullable=true)
     */
    private $timezone;

    /**
     * @var bool
     *
     * @ORM\Column(name="is_active", type="boolean", nullable=false)
     */
    private $isActive;

    /**
     * @var \DateTime|null
     *
     * @ORM\Column(name="disabled_on", type="datetime", nullable=true)
     */
    private $disabledOn;

    /**
     * @var \DateTime
     *
     * @ORM\Column(name="last_modified_on", type="datetime", nullable=false)
     */
    private $lastModifiedOn;

    /**
     * @var \DateTime
     *
     * @ORM\Column(name="created_on", type="datetime", nullable=false)
     */
    private $createdOn;

    /**
     * @var \ListGenders
     *
     * @ORM\ManyToOne(targetEntity="ListGenders")
     * @ORM\JoinColumns({
     *   @ORM\JoinColumn(name="gender", referencedColumnName="id")
     * })
     */
    private $gender;

    /**
     * @var \Business
     *
     * @ORM\ManyToOne(targetEntity="Business")
     * @ORM\JoinColumns({
     *   @ORM\JoinColumn(name="business_id", referencedColumnName="id")
     * })
     */
    private $business;

    private $userRoles;

    public function __construct()
    {
        $this->isActive = true;
        // may not be needed, see section on salt below
        // $this->salt = md5(uniqid('', true));
        $this->userRoles = new \Doctrine\Common\Collections\ArrayCollection();
    }

    public function getId(): ?int
    {
        return $this->id;
    }

    public function getImage(): ?string
    {
        return $this->image;
    }

    public function setImage(?string $image): self
    {
        $this->image = $image;

        return $this;
    }

    public function getUsername(): ?string
    {
        return $this->username;
    }

    public function setUsername(string $username): self
    {
        $this->username = $username;

        return $this;
    }

    public function getEmail(): ?string
    {
        return $this->email;
    }

    public function setEmail(string $email): self
    {
        $this->email = $email;

        return $this;
    }

    public function getPassword(): ?string
    {
        return $this->password;
    }

    public function setPassword(string $password): self
    {
        $this->password = $password;

        return $this;
    }

    public function getPlainPassword(): ?string
    {
        return $this->plainPassword;
    }

    public function setPlainPassword(string $plainPassword): self
    {
        $this->plainPassword = $plainPassword;

        return $this;
    }
    
    public function getRoles() {
        $user_roles_array = $this->userRoles->toArray();
        $roles = [];
        foreach($user_roles_array as $user_role){
            /* @var UserRole $user_role */
            $roles[] = $user_role->getRole()->getRole();
        }
        return $roles;
    }

    public function addUserRole(UsersRoles $userRole)
    {
        $this->userRoles[] = $userRole;

        return $this;
    }

    public function removeUserRole(UsersRoles $userRole)
    {
        $this->userRoles->removeElement($userRole);
    }

    public function getUserRoles()
    {
        return $this->userRoles;
    }

    public function getFirstName(): ?string
    {
        return $this->firstName;
    }

    public function setFirstName(string $firstName): self
    {
        $this->firstName = $firstName;

        return $this;
    }

    public function getLastName(): ?string
    {
        return $this->lastName;
    }

    public function setLastName(string $lastName): self
    {
        $this->lastName = $lastName;

        return $this;
    }

    public function getAddress(): ?string
    {
        return $this->address;
    }

    public function setAddress(?string $address): self
    {
        $this->address = $address;

        return $this;
    }

    public function getPostalCode(): ?string
    {
        return $this->postalCode;
    }

    public function setPostalCode(?string $postalCode): self
    {
        $this->postalCode = $postalCode;

        return $this;
    }

    public function getPhone(): ?string
    {
        return $this->phone;
    }

    public function setPhone(?string $phone): self
    {
        $this->phone = $phone;

        return $this;
    }

    public function getPhone2(): ?string
    {
        return $this->phone2;
    }

    public function setPhone2(?string $phone2): self
    {
        $this->phone2 = $phone2;

        return $this;
    }

    public function getBirthdate(): ?\DateTimeInterface
    {
        return $this->birthdate;
    }

    public function setBirthdate(?\DateTimeInterface $birthdate): self
    {
        $this->birthdate = $birthdate;

        return $this;
    }

    public function getYearOfBirth(): ?int
    {
        return $this->yearOfBirth;
    }

    public function setYearOfBirth(?int $yearOfBirth): self
    {
        $this->yearOfBirth = $yearOfBirth;

        return $this;
    }

    public function getTimezone(): ?string
    {
        return $this->timezone;
    }

    public function setTimezone(?string $timezone): self
    {
        $this->timezone = $timezone;

        return $this;
    }

    public function getIsActive(): ?bool
    {
        return $this->isActive;
    }

    public function setIsActive(bool $isActive): self
    {
        $this->isActive = $isActive;

        return $this;
    }

    public function getDisabledOn(): ?\DateTimeInterface
    {
        return $this->disabledOn;
    }

    public function setDisabledOn(?\DateTimeInterface $disabledOn): self
    {
        $this->disabledOn = $disabledOn;

        return $this;
    }

    public function getLastModifiedOn(): ?\DateTimeInterface
    {
        return $this->lastModifiedOn;
    }

    public function setLastModifiedOn(\DateTimeInterface $lastModifiedOn): self
    {
        $this->lastModifiedOn = $lastModifiedOn;

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

    public function getGender(): ?ListGenders
    {
        return $this->gender;
    }

    public function setGender(?ListGenders $gender): self
    {
        $this->gender = $gender;

        return $this;
    }

    public function getBusiness(): ?Business
    {
        return $this->business;
    }

    public function setBusiness(?Business $business): self
    {
        $this->business = $business;

        return $this;
    }

    public function getSalt()
    {
        return null;
    }

    public function eraseCredentials()
    {
    }
}
