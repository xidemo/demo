<?php

namespace AppBundle\Menu;

use Knp\Menu\FactoryInterface;

class MenuBuilder
{
    private $factory;

    /**
     * @param FactoryInterface $factory
     *
     * Add any other dependency you need
     */
    public function __construct(FactoryInterface $factory)
    {
        $this->factory = $factory;
    }

    public function createTopMenu(array $options)
    {
        $menu = $this->factory->createItem('root');
        $menu->setChildrenAttribute('class','nav navbar-nav navbar-left');

        $menu->addChild('Solutions', array('route' => 'category_list'));
        $menu->addChild('Products', array('route' => 'product_list'));
        $menu->addChild('Buy', array('route'=>'fos_user_security_login', 'label' => 'How to Buy'));
        $menu['Buy']->setChildrenAttribute('class','dropdown-menu');
        $menu['Buy']->setLinkAttributes(array(
            'href' => 'self',
            'class' => 'dropdown-toggle',
            'data-toggle' => 'dropdown'
        ));
        $menu['Buy']->addChild('Individual', array('route' => 'admin_category_list', ));
        $menu['Buy']->addChild('Corporate', array('route' => 'fos_user_profile_show', ));


        $menu->addChild('Media', array('route' => 'product_new'));
        $menu->addChild('Contact', array('route' => 'sonata_admin_dashboard'));

        return $menu;
    }
}

