<?php
/**
 * this listener is for demonstration purpose
 * use stofDoctrineExtension Sluggable annotation instead for a more scalable project
 */

namespace AppBundle\Doctrine;

use AppBundle\Entity\Category;
use AppBundle\Entity\Product;
use AppBundle\Entity\Solution;
use AppBundle\Utils\Utils;
use Doctrine\Common\EventSubscriber;
use Doctrine\ORM\Event\LifecycleEventArgs;

class EntitySlugifyListener implements EventSubscriber
{
    private $utils;

    public function __construct(Utils $utils)
    {
        $this->utils = $utils;
    }

    public function prePersist(LifecycleEventArgs $args)
    {
        $entity = $args->getEntity();
        if (!$entity instanceof Category
            && !$entity instanceof Product
            && !$entity instanceof Solution
        ) {
            return;
        }

        if ($entity instanceof Product) {
            $entity->setCreatedAt(new \DateTime());
        }
        $slug = $this->utils->slugify($entity->getName());
        $entity->setSlug($slug);
    }

    public function preUpdate(LifecycleEventArgs $args)
    {
        $entity = $args->getEntity();
        if (!$entity instanceof Category
            && !$entity instanceof Product
            && !$entity instanceof Solution
        ) {
            return;
        }

        $slug = $this->utils->slugify($entity->getName());
        $entity->setSlug($slug);
    }

    public function getSubscribedEvents()
    {
        return ['prePersist', 'preUpdate'];
    }
}