<?php

namespace AppBundle\Entity;

use AppBundle\SalableInterface;
use Doctrine\Common\Collections\ArrayCollection;
use Doctrine\ORM\Mapping as ORM;
use Symfony\Component\Validator\Constraints as Assert;

/**
 * @ORM\Table(name="app_product")
 * @ORM\Entity(repositoryClass="AppBundle\Repository\ProductRepository")
 */
class Product implements SalableInterface
{
    /**
     * @ORM\Column(type="integer")
     * @ORM\Id
     * @ORM\GeneratedValue(strategy="AUTO")
     */
    protected $id;

    /**
     * @ORM\Column(type="string", length=100)
     *
     * @Assert\NotBlank(message="Please specify product name.")
     * @Assert\Length(
     *     min=3,
     *     max=100,
     *     minMessage="The product name must have more than 3 characters.",
     *     maxMessage="The product name must not exceed 100 characters.",
     * )
     */
    protected $name;

    /**
     * @ORM\Column(type="string", length=255)
     */
    protected $slug;

    /**
     * @ORM\Column(type="text")
     *
     * @Assert\NotBlank(message="Please write something about the product.")
     * @Assert\Length(
     *     min=5,
     *     minMessage="You really should be more descriptive, please add more words!",
     * )
     */
    protected $description;

    /**
     * @ORM\Column(type="datetime")
     */
    protected $createdAt;

    /**
     * @ORM\ManyToOne(targetEntity="Category", inversedBy="products")
     * @ORM\JoinColumn(nullable=true, onDelete="SET NULL")
     */
    protected $category;

    /**
     * @ORM\ManyToMany(targetEntity="AppBundle\Entity\Solution", inversedBy="products")
     * @ORM\JoinTable(name="product_solution")
     */
    protected $solutions;

    /**
     * @ORM\OneToMany(targetEntity="ProductImage", mappedBy="product", cascade={"all"}, orphanRemoval=true)
     * @ORM\OrderBy({"id" = "ASC"})
     */
    protected $images;

    /**
     * @ORM\Column(type="decimal", scale=2)
     *
     * @Assert\NotBlank(message="Please specify the price.")
     * @Assert\Range(min="0", minMessage="Oops! Price can not be negative.")
     */
    protected $price;

    /**
     * @ORM\Column(type="integer")
     *
     * @Assert\NotBlank(message="Please specify the stock level.")
     * @Assert\Range(min="0", minMessage="Oops! Stock can not be negative.")
     */
    protected $stock;

    /**
     * @ORM\Column(type="string", nullable=true)
     */
    protected $dimension;

    /**
     * @ORM\Column(type="string", unique=true, nullable=true)
     */
    protected $upc;

    public function __construct()
    {
        $this->solutions = new ArrayCollection();
        $this->images = new ArrayCollection();
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
     * Set name
     *
     * @param string $name
     *
     * @return Product
     */
    public function setName($name)
    {
        $this->name = $name;
        return $this;
    }

    /**
     * Get name
     *
     * @return string
     */
    public function getName()
    {
        return $this->name;
    }

    /**
     * Set slug
     *
     * @param string $slug
     *
     * @return Product
     */
    public function setSlug($slug)
    {
        $this->slug = $slug;
        return $this;
    }

    /**
     * Get slug
     *
     * @return string
     */
    public function getSlug()
    {
        return $this->slug;
    }

    /**
     * Set description
     *
     * @param string $description
     *
     * @return Product
     */
    public function setDescription($description)
    {
        $this->description = $description;
        return $this;
    }

    /**
     * Get description
     *
     * @return string
     */
    public function getDescription()
    {
        return $this->description;
    }

    /**
     * Set createdAt
     *
     * @param \DateTime $createdAt
     *
     * @return Product
     */
    public function setCreatedAt($createdAt)
    {
        $this->createdAt = $createdAt;
        return $this;
    }

    /**
     * Get createdAt
     *
     * @return \DateTime
     */
    public function getCreatedAt()
    {
        return $this->createdAt;
    }

    /**
     * Get category
     *
     * @return \AppBundle\Entity\Category
     */
    public function getCategory()
    {
        return $this->category;
    }

    /**
     * Set category
     *
     * @param \AppBundle\Entity\Category $category
     *
     * @return Product
     */
    public function setCategory(Category $category = null)
    {
        $this->category = $category;
        return $this;
    }

    /**
     * @return ArrayCollection|Solution[]
     */
    public function getSolutions()
    {
        return $this->solutions;
    }

    /**
     * @param Solution $solution
     */
    public function addSolution(Solution $solution)
    {
        $this->solutions[] = $solution;
    }

    /**
     * Get images
     *
     * @return ArrayCollection|ProductImage[]
     */
    public function getImages()
    {
        return $this->images;
    }

    /**
     * Set images
     *
     * @param ArrayCollection|ProductImage[]
     *
     * @return Product
     */
    public function setImages($images)
    {
        if (count($images) > 0) {
            foreach ($images as $image) {
                $this->addImage($image);
            }
        }
        return $this;
    }

    public function addImage(ProductImage $image)
    {
        $image->setProduct($this);

        $this->images->add($image);
    }

    public function removeImage(ProductImage $image)
    {
        $this->images->removeElement($image);
    }

    /**
     * Get price
     *
     * @return string
     */
    public function getPrice()
    {
        return $this->price;
    }

    /**
     * Set price
     *
     * @param string $price
     *
     * @return Product
     */
    public function setPrice($price)
    {
        $this->price = $price;
        return $this;
    }

    /**
     * Get stock
     *
     * @return integer
     */
    public function getStock()
    {
        return $this->stock;
    }

    /**
     * Set stock
     *
     * @param integer $stock
     *
     * @return Product
     */
    public function setStock($stock)
    {
        $this->stock = $stock;
        return $this;
    }

    /**
     * @return string
     */
    public function getDimension()
    {
        return $this->dimension;
    }

    /**
     * @param string
     */
    public function setDimension($dimension)
    {
        $this->dimension = $dimension;
    }

    /**
     * @return integer
     */
    public function getUpc()
    {
        return $this->upc;
    }

    /**
     * @param integer
     */
    public function setUpc($upc)
    {
        $this->upc = $upc;
    }

    public function __toString()
    {
        return (string)$this->getName();
    }
}