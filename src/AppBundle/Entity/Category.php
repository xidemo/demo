<?php
namespace AppBundle\Entity;

use Doctrine\Common\Collections\ArrayCollection;
use Doctrine\ORM\Event\PreUpdateEventArgs;
use Doctrine\ORM\Mapping as ORM;

/**
 * @ORM\Table(name="app_category")
 * @ORM\Entity()
 *
 * @ORM\HasLifecycleCallbacks()
 */
class Category
{
    /**
     * @ORM\Column(name="id", type="integer")
     * @ORM\Id
     * @ORM\GeneratedValue
     */
    private $id;
    /**
     * @ORM\Column(name="title", type="string", length=64)
     */
    private $name;
    /**
     * @ORM\Column(type="string")
     */
    private $slug;
    /**
     * @ORM\OneToMany(targetEntity="AppBundle\Entity\Product", mappedBy="category")
     * @ORM\OrderBy({"createdAt"="DESC"})
     */
    private $products;

    public function __construct()
    {
        $this->products = new ArrayCollection();
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
     * Set title
     *
     * @param string $name
     *
     * @return Category
     */
    public function setName($name)
    {
        $this->name = $name;
        return $this;
    }

    /**
     * Get title
     *
     * @return string
     */
    public function getName()
    {
        return $this->name;
    }

    /**
     * @return mixed
     */
    public function getSlug()
    {
        return $this->slug;
    }

    /**
     * @param mixed $slug
     */
    public function setSlug($slug)
    {
        $this->slug = $slug;
    }

    /**
     * @return ArrayCollection|Product[]
     */
    public function getProducts()
    {
        return $this->products;
    }

    public function __toString()
    {
        return $this->name;
    }

    /**
     * Create the slug automatically
     *
     * @ORM\PrePersist
     */
    public function setSlugValue()
    {
        if (!isset($this->slug)) {
            $this->slug =  $this->slugify($this->name);
        }
    }

    /**
     * Update the slug automatically
     *
     * @ORM\PreUpdate
     * @param PreUpdateEventArgs $event
     */
    public function updateSlugValue(PreUpdateEventArgs $event)
    {
        if ($event->hasChangedField('name')) {
            $this->slug = $this->slugify($this->name);
        }
    }

   //TODO pull out to explicit doctrine entity listener
    private function slugify($text)
    {
        // replace non letter or digits by -
        $text = preg_replace('~[^\pL\d]+~u', '-', $text);
        // transliterate
        $text = iconv('utf-8', 'us-ascii//TRANSLIT', $text);
        // remove unwanted characters
        $text = preg_replace('~[^-\w]+~', '', $text);
        // trim
        $text = trim($text, '-');
        // remove duplicate -
        $text = preg_replace('~-+~', '-', $text);
        // lowercase
        $text = strtolower($text);
        if (empty($text)) {
            return 'n-a';
        }

        return $text;
    }
}