<?php

namespace AppBundle\Doctrine;

use AppBundle\Entity\Order;
use Doctrine\Common\EventSubscriber;
use Doctrine\DBAL\Exception\InvalidArgumentException;
use Doctrine\ORM\Event\LifecycleEventArgs;

class OrderEntityListener implements EventSubscriber
{
    public function prePersist(LifecycleEventArgs $args)
    {
        /** @var Order $order */
        $order = $args->getEntity();
        if (!$order instanceof Order) {
            return;
        } elseif (!$order->getSession()) {
            throw new InvalidArgumentException('required session missing');
        }

        $order->setOrderNumber(strtoupper(substr($order->getSession(), 0, 8)));
        $order->setPlacedAt(new \DateTime());
    }

    public function getSubscribedEvents()
    {
        return ['prePersist'];
    }
}