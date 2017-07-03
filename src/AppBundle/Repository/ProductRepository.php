<?php

namespace AppBundle\Repository;

use AppBundle\Entity\Category;
use Doctrine\ORM\EntityRepository;

class ProductRepository extends EntityRepository
{
    public function findAllProductsQuery()
    {
        return $this->createQueryBuilder('product')->getQuery();
    }

    public function findAllProductsByCategory(Category $category)
    {
        $query = $this->findAllProductsByCategoryQuery($category);

        return $query->execute();
    }

    public function findAllProductsByCategoryQuery(Category $category)
    {
        return $this->createQueryBuilder('product')
            ->andWhere('product.category = :category')
            ->addOrderBy('product.name', 'ASC')
            ->setParameter('category', $category)
            ->getQuery();
    }

    public function findProductsByKeywordQuery($keyword)
    {
        return $this->createQueryBuilder('product')
            ->andWhere('product.name LIKE :keyword')
            ->setParameter('keyword', '%'.$keyword.'%')
            ->getQuery();
    }


}
