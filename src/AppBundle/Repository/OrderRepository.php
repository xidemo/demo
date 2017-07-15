<?php

namespace AppBundle\Repository;

use Doctrine\ORM\EntityRepository;
use FOS\UserBundle\Model\UserInterface;

class OrderRepository extends EntityRepository
{
    public function findAllWithFilterQueryBuilder(UserInterface $user)
    {
        return $this->createQueryBuilder('order')
            ->andWhere('order.user = :user')
            ->setParameter('user', $user);
    }
}
