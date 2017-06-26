<?php

namespace AppBundle\Menu;

use AppBundle\Entity\Product;
use AppBundle\Repository\ProductRepository;
use Doctrine\ORM\EntityManager;
use Knp\Menu\FactoryInterface;
use Symfony\Component\HttpFoundation\RequestStack;

class MenuBuilder
{
    private $factory;

    private $em;

    /**
     * @param FactoryInterface $factory
     *
     * Add any other dependency you need
     * @param EntityManager $em
     */
    public function __construct(FactoryInterface $factory, EntityManager $em)
    {
        $this->factory = $factory;
        $this->em = $em;
    }

    public function createMainMenu(array $options)
    {
        $menu = $this->factory->createItem('Home');
        $menu->setUri('/');
        $menu->setChildrenAttribute('class', 'nav navbar-nav navbar-left');

        //Solution
        $menu->addChild('Solution', array('route' => 'solution_list'));
        $menu['Solution']->setChildrenAttribute('class', 'dropdown-menu');
        $menu['Solution']->setLinkAttributes(array(
            'href' => 'self',
            'class' => 'dropdown-toggle',
            'data-toggle' => 'dropdown'
        ));
        $solutions = $this->em->getRepository('AppBundle:Solution')->findAll();
        foreach ($solutions as $solution) {
            $menu['Solution']->addChild($solution->getName(), array(
                'route' => 'solution_show',
                'routeParameters' => array('slug' => $solution->getSlug()),
            ));
        }

        //Products
        $menu->addChild('Product', array('route' => 'category_list'));
        $menu['Product']->setChildrenAttribute('class', 'dropdown-menu');
        $menu['Product']->setLinkAttributes(array(
            'href' => 'self',
            'class' => 'dropdown-toggle',
            'data-toggle' => 'dropdown'
        ));
        $categories = $this->em->getRepository('AppBundle:Category')->findAll();
        foreach ($categories as $category) {
            $menu['Product']->addChild($category->getName(), array(
                'route' => 'category_show',
                'routeParameters' => array('slug' => $category->getSlug()),
            ));
            //Prepare products only for breadcrumb
            /** @var Product[] $products */
            $products = $this->em->getRepository('AppBundle:Product')->findAllProductsByCategory($category->getId());
            foreach ($products as $product) {
                $menu['Product'][$category->getName()]
                    ->addChild($product->getName(), array(
                        'route' => 'product_show',
                        'routeParameters' => array('slug' => $product->getSlug()),
                    ))
                    ->setDisplay(false);
            }
        }

        //How to Buy
        $menu->addChild('Buy', array('uri' => '#', 'label' => 'How to Buy'));
        $menu['Buy']->setChildrenAttribute('class', 'dropdown-menu');
        $menu['Buy']->setLinkAttributes(array(
            'href' => 'self',
            'class' => 'dropdown-toggle',
            'data-toggle' => 'dropdown'
        ));
        $menu['Buy']->addChild('Individual', array('route' => 'admin_category_list',));
        $menu['Buy']->addChild('Corporate', array('route' => 'fos_user_profile_show',));


        $menu->addChild('Media', array('uri' => '#'));
        $menu->addChild('Contact', array('uri' => '#'));

        return $menu;
    }

    public function createSubMenuFromEntity(array $options)
    {
        $menu = $this->factory->createItem('entity_sub_menu')
            ->setChildrenAttribute(
                'class',
                'nav nav-pills .nav-stacked'
            );

        if (isset($options['entity']) && $options['entity']) {
            $entityName = $options['entity'];
        } else {
            throw new \Exception('entity not found for creating sub menu');
        }

        $items = $this->em->getRepository('AppBundle:' . $entityName)->findAll();

//        $menu->addChild($entity)
//             ->setAttribute('class', 'panel-head');//, array('route' => $entity . '_list'));
//        $menu[$entity]->setChildrenAttribute('class', 'list-group');
        foreach ($items as $item) {
            $menu
                ->addChild($item->getName(), array(
                    'route' => $entityName . '_show',
                    'routeParameters' => array('slug' => $item->getSlug()),
                ));
//                ->setAttribute(
//                    'class', 'list-group-item'
//                );
        }

        return $menu;
    }

}

