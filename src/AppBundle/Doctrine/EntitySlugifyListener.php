<?php

namespace AppBundle\Doctrine;

use AppBundle\Entity\Category;
use AppBundle\Entity\Product;
use AppBundle\Utils\Utils;
use Doctrine\Common\EventSubscriber;
use Doctrine\ORM\Event\LifecycleEventArgs;
use Symfony\Component\Validator\Constraints\DateTime;

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
        if (!$entity instanceof Category && !$entity instanceof Product) {
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
        if (!$entity instanceof Category && !$entity instanceof Product) {
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