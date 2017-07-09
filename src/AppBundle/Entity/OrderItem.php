<?php
namespace AppBundle\Entity;

use Doctrine\Common\Collections\ArrayCollection;
use Doctrine\ORM\Mapping as ORM;

/**
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
     * @ORM\ManyToOne(targetEntity="AppBundle\Entity\Order", inversedBy="items", cascade={"persist", "remove"})
     */
    private $order;

    /**
     * @ORM\ManyToOne(targetEntity="AppBundle\Entity\Product")
     */
    private $product;

    /**
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
}