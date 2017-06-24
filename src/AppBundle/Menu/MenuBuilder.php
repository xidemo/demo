<?php

namespace AppBundle\Menu;

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
        $categories = $this->em->getRepository('AppBundle:Category')->findAll();

        $menu = $this->factory->createItem('root');
        $menu->setChildrenAttribute('class', 'nav navbar-nav navbar-left');

        //Solutions
        $menu->addChild('Solutions', array('route' => 'solution_list'));

        //Products
        $menu->addChild('Products', array('uri' => '#'));
        $menu['Products']->setChildrenAttribute('class', 'dropdown-menu');
        $menu['Products']->setLinkAttributes(array(
            'href' => 'self',
            'class' => 'dropdown-toggle',
            'data-toggle' => 'dropdown'
        ));
        foreach ($categories as $category) {
            $menu['Products']->addChild($category->getName(), array(
                'route' => 'category_show',
                'routeParameters' => array('slug' => $category->getSlug()),
            ));
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

