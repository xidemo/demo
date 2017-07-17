<?php

namespace AppBundle\Entity;

use Doctrine\ORM\Mapping as ORM;

/**
 * @ORM\Entity()
 * @ORM\Table(name="product_image")
 */
class ProductImage extends Image
{
    /**
     * @ORM\ManyToOne(targetEntity="Product", inversedBy="images", cascade={"all"})
     * @ORM\JoinColumn(name="product_id", referencedColumnName="id", onDelete="CASCADE")
     */
    private $product;

    /**
     * @return mixed
     */
    public function getProduct()
    {
        return $this->product;
    }

    /**
     * @param mixed $product
     */
    public function setProduct($product)
    {
        $this->product = $product;
    }

    public function __toString()
    {
        return $this->getFileName() ? $this->getFileName() : 'new' ;
    }
}