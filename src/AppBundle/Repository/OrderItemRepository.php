<?php

namespace AppBundle\Repository;

use Doctrine\ORM\EntityRepository;

class OrderItemRepository extends EntityRepository
{
    public function findAllWithFilterQueryBuilder($filter = '')
    {
        $qb = $this->createQueryBuilder('order_item');

        if ($filter) {
            //stock level check
            $qb->andWhere('order_item.quantity <= :quantity')
                ->setParameter('quantity', $filter);
        }

        return $qb;
    }
}
