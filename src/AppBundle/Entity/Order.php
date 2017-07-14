<?php

namespace AppBundle\Entity;

use JMS\Serializer\Annotation as Serializer;
use Doctrine\Common\Collections\ArrayCollection;
use Doctrine\ORM\Mapping as ORM;

/**
 * @Serializer\ExclusionPolicy("all")
 *
 * @ORM\Table(name="app_order")
 * @ORM\Entity(repositoryClass="AppBundle\Repository\OrderRepository")
 */
class Order implements OrderInterface
{
    /**
     * @ORM\Column(name="id", type="integer")
     * @ORM\Id
     * @ORM\GeneratedValue
     */
    private $id;

    /**
     * @Serializer\Expose()
     *
     * @ORM\Column(type="string", unique=true)
     */
    private $orderNumber;

    /**
     * @ORM\Column(type="string")
     */
    private $session;

    /**
     * @ORM\ManyToOne(targetEntity="Application\Sonata\UserBundle\Entity\User")
     */
    private $user;

    /**
     * @ORM\OneToMany(targetEntity="AppBundle\Entity\OrderItem", mappedBy="order")
     */
    private $items;

    /**
     * @Serializer\Expose()
     *
     * @ORM\Column(type="datetime")
     */
    private $placedAt;

    /**
     * @Serializer\Expose()
     *
     * @ORM\Column(type="text", nullable=true)
     */
    private $note;

    /**
     * @Serializer\Expose()
     *
     * @ORM\Column(type="string")
     */
    private $state = self::STATE_CART;

    public function __construct()
    {
        $this->items = new ArrayCollection();
    }

    /**
     * Get id
     *
     * @return integer
     */
    public function getId()
    {
        return $this->id;
    }

    /**
     * @return string
     */
    public function getOrderNumber()
    {
        return $this->orderNumber;
    }

    /**
     * @param string $orderNumber
     */
    public function setOrderNumber($orderNumber)
    {
        $this->orderNumber = $orderNumber;
    }

    /**
     * @return string
     */
    public function getSession()
    {
        return $this->session;
    }

    /**
     * @param string $session
     */
    public function setSession($session)
    {
        $this->session = $session;
    }

    /**
     * @return mixed
     */
    public function getUser()
    {
        return $this->user;
    }

    /**
     * @param mixed $user
     */
    public function setUser($user)
    {
        $this->user = $user;
    }

    /**
     * @return mixed
     */
    public function getItems()
    {
        return $this->items;
    }

    public function addItem(OrderItem $item)
    {
        if (!$this->items->contains($item)) {
            $this->items->add($item);
        }
    }

    public function removeItem(OrderItem $item)
    {
        if ($this->items->contains($item)) {
            $this->items->remove($item->getId());
        }
    }

    public function clearItems()
    {
        $this->items->clear();
    }

    public function countItems()
    {
        $this->items->count();
    }

    public function hasItem(OrderItem $item)
    {
        return $this->items->contains($this->items);
    }


    /**
     * @return mixed
     */
    public function getPlacedAt()
    {
        return $this->placedAt;
    }

    /**
     * @param \DateTime $placedAt
     */
    public function setPlacedAt(\DateTime $placedAt = null)
    {
        $this->placedAt = $placedAt;
    }

    /**
     * @return mixed
     */
    public function getNote()
    {
        return $this->note;
    }

    /**
     * @param mixed $note
     */
    public function setNote($note)
    {
        $this->note = $note;
    }

    /**
     * @return mixed
     */
    public function getState()
    {
        return $this->state;
    }

    /**
     * @param mixed $state
     */
    public function setState($state = self::STATE_CART)
    {
        $this->state = $state;
    }

    public function getTotalPrice()
    {
        // TODO: Implement getTotalPrice() method.
    }

    public function getTotalQuantity()
    {
        // TODO: Implement getTotalQuantity() method.
    }

    public function isEmpty()
    {
        // TODO: Implement isEmpty() method.
    }

    public function calculateAdjustments($type = null)
    {
        // TODO: Implement calculateAdjustments() method.
    }

    public function __toString()
    {
        return (string)$this->orderNumber;
    }

    /**
     * @Serializer\VirtualProperty()
     * @Serializer\SerializedName("user")
     */
    public function getSerializedOrder()
    {
        return $this->getUser()->getId();
    }

    /**
     * @Serializer\VirtualProperty()
     * @Serializer\SerializedName("items")
     */
    public function getSerializedItems()
    {
        return $this->getItems();
    }
}