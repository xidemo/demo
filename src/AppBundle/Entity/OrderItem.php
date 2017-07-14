<?php

namespace AppBundle\Entity;

use Doctrine\Common\Collections\ArrayCollection;
use Doctrine\ORM\Mapping as ORM;
use JMS\Serializer\Annotation as Serializer;
use Symfony\Component\Validator\Constraints as Assert;

/**
 * @Serializer\ExclusionPolicy("all")
 *
 * @ORM\Table(name="app_order_item")
 * @ORM\Entity(repositoryClass="AppBundle\Repository\OrderItemRepository")
 */
class OrderItem
{
    /**
     * @ORM\Column(name="id", type="integer")
     * @ORM\Id
     * @ORM\GeneratedValue
     */
    private $id;

    /**
     * @ORM\ManyToOne(targetEntity="AppBundle\Entity\Order", inversedBy="items", cascade={"persist"})
     */
    private $order;

    /**
     * @Assert\NotBlank(message="Product needed")
     *
     * @ORM\ManyToOne(targetEntity="AppBundle\Entity\Product", fetch="EXTRA_LAZY")
     */
    private $product;

    /**
     * @Serializer\Expose()
     *
     * @Assert\GreaterThanOrEqual(0, message="Quantity can not be negative")
     *
     * @ORM\Column(type="integer")
     */
    private $quantity;

    public function __construct($order = null, $product = null, $quantity = 0)
    {
        $this->order = $order;
        $this->product = $product;
        $this->quantity = $quantity;
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
     * @return Order
     */
    public function getOrder()
    {
        return $this->order;
    }

    /**
     * @param Order $order
     */
    public function setOrder(Order $order)
    {
        $this->order = $order;
    }

    /**
     * @return Product
     */
    public function getProduct()
    {
        return $this->product;
    }

    /**
     * @param Product $product
     */
    public function setProduct(Product $product)
    {
        $this->product = $product;
    }

    /**
     * @return integer
     */
    public function getQuantity()
    {
        return $this->quantity;
    }

    /**
     * @param integer $quantity
     */
    public function setQuantity($quantity = 0)
    {
        $this->quantity = $quantity;
    }

    /**
     * @Serializer\VirtualProperty()
     * @Serializer\SerializedName("order")
     */
    public function getSerializedOrderId()
    {
        return $this->getOrder()->getId();
    }

    /**
     * @Serializer\VirtualProperty()
     * @Serializer\SerializedName("product")
     */
    public function getSerializedProductId()
    {
        return $this->getProduct()->getId();
    }
}