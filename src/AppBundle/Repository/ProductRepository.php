<?php

namespace AppBundle\Repository;

use Doctrine\ORM\EntityRepository;

class ProductRepository extends EntityRepository
{
    public function findAllProductsByCategory($productId)
    {
        $qb = $this->createQueryBuilder('p')
            ->andWhere('p.category = :pid')
            ->addOrderBy('p.name', 'ASC')
            ->setParameter('pid', $productId);
        $query = $qb->getQuery();

        return $query->execute();
    }
}
