<?php
namespace AppBundle\Entity;
use Doctrine\ORM\Event\LifecycleEventArgs;
use Doctrine\ORM\Event\PreUpdateEventArgs;
use Doctrine\ORM\Mapping as ORM;
use Symfony\Component\Validator\Constraints as Assert;
/**
 * @ORM\Table(name="app_product")
 * @ORM\Entity()
 *
 * @ORM\HasLifecycleCallbacks()
 */
class Product
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
     *     minMessage="The name must have more than 3 characters.",
     *     maxMessage="The name must not exceed 100 characters.",
     * )
     */
    protected $name;
    /**
     * @ORM\Column(type="string", length=255)
     */
    protected $slug;
    /**
     * @ORM\ManyToOne(targetEntity="AppBundle\Entity\Category")
     */
    protected $category;
    /**
     * @ORM\Column(type="decimal", scale=2)
     */
    protected $price;
    /**
     * @ORM\Column(type="text")
     */
    protected $description;
    /**
     * @ORM\Column(type="string")
     */
    protected $image;
    /**
     * @ORM\Column(type="datetime")
     */
    protected $createdAt;
    /**
     * @ORM\Column(type="integer")
     */
    protected $stock;
    /**
     * @ORM\PrePersist
     */
    public function setCreatedAtValue()
    {
        $this->createdAt = new \DateTime();
    }
    /**
     * Create the slug automatically
     *
     * @ORM\PrePersist
     */
    public function setSlugValue()
    {
        if (!isset($this->slug)) {
            $this->slug = str_replace(' ', '-', $this->name);
        }
    }
    /**
     * Update the slug automatically
     *
     * @ORM\PreUpdate
     * @param PreUpdateEventArgs $event
     */
    public function updateSlugValue(PreUpdateEventArgs $event){
        if ($event->hasChangedField('name')){
            $this->slug = str_replace(' ', '-', $this->name);
        }
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
     * Get price
     *
     * @return string
     */
    public function getPrice()
    {
        return $this->price;
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
     * Set image
     *
     * @param string $image
     *
     * @return Product
     */
    public function setImage($image)
    {
        $this->image = $image;
        return $this;
    }
    /**
     * Get image
     *
     * @return string
     */
    public function getImage()
    {
        return $this->image;
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
     * Get stock
     *
     * @return integer
     */
    public function getStock()
    {
        return $this->stock;
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
     * Get category
     *
     * @return \AppBundle\Entity\Category
     */
    public function getCategory()
    {
        return $this->category;
    }
}