<?php

namespace AppBundle\Menu;

use Doctrine\ORM\EntityManager;
use Knp\Menu\FactoryInterface;

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

    public function createTopMenu(array $options)
    {
        $categories = $this->em->getRepository('AppBundle:Category')->findAll();

        $menu = $this->factory->createItem('root');
        $menu->setChildrenAttribute('class', 'nav navbar-nav navbar-left');

        $menu->addChild('Solutions', array('route' => 'category_list'));

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

    public function createSideMenu(array $options)
    {
        $categories = $this->em->getRepository('AppBundle:Category')->findAll();

        $menu = $this->factory->createItem('root');

        $menu->addChild('Category', array('route' => 'category_list'));
        $menu['Category']->setChildrenAttribute('class', 'sidenav');

        foreach ($categories as $category) {
            $menu['Category']->addChild($category->getName(), array(
                'route' => 'category_show',
                'routeParameters' => array('slug' => $category->getSlug()),
            ));
        }

        return $menu;
    }
}

