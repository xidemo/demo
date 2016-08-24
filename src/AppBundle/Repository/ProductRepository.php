<?php

namespace AppBundle\Repository;

use Doctrine\ORM\EntityRepository;

class ProductRepository extends EntityRepository
{
    public function findAllProductsByCategory()
    {
        $qb = $this->createQueryBuilder('p')
            ->addOrderBy('p.name', 'ASC');
        $query = $qb->getQuery();

        return $query->execute();
    }
}
