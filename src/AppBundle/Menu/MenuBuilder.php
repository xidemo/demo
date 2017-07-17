<?php

namespace AppBundle\Menu;

use AppBundle\Entity\Product;
use AppBundle\Repository\ProductRepository;
use Doctrine\ORM\EntityManager;
use Knp\Menu\FactoryInterface;
use Symfony\Component\HttpFoundation\RequestStack;
use Symfony\Component\HttpKernel\Exception\NotFoundHttpException;

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
        $menu = $this->factory->createItem('Home')->setExtra('translation_domain', false);
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
        $menu->addChild('Product', array('route' => 'product_list'));
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
            $products = $this->em->getRepository('AppBundle:Product')->findAllProductsByCategory($category);
            foreach ($products as $product) {
                $menu['Product'][$category->getName()]
                    ->addChild($product->getName(), array(
                        'route' => 'product_show',
                        'routeParameters' => array('slug' => $product->getSlug()),
                    ))
                    ->setDisplay(false)
                ;
            }
        }

        //How to Buy
        $menu->addChild('Buy', array('uri' => '#', 'label' => 'Distributor'));
        $menu['Buy']->setChildrenAttribute('class', 'dropdown-menu');
        $menu['Buy']->setLinkAttributes(array(
            'href' => 'self',
            'class' => 'dropdown-toggle',
            'data-toggle' => 'dropdown'
        ));
        $menu['Buy']->addChild('Individual', array('route' =>'sonata_user_registration_register'));
        $menu['Buy']->addChild('Corporate', array('route' =>'sonata_admin_redirect'));


        $menu->addChild('Api', array('route' => 'nelmio_api_doc_index'));
        $menu->addChild('Repo', array('uri' => 'https://github.com/xidemo/demo'));

        return $menu;
    }

    public function createSideSubMenuForEntity(array $options)
    {
        $menu = $this->factory->createItem('side_sub_entity')
            ->setChildrenAttribute('class', 'list-group');

        if (isset($options['entity']) && $options['entity']) {
            $entityName = $options['entity'];
        } else {
            throw new \Exception('entity not found for creating sub menu');
        }

        $items = $this->em->getRepository('AppBundle:' . $entityName)->findAll();

        if (!$items) {
            throw new NotFoundHttpException('entity not found in DB');
        }

        foreach ($items as $item) {
            $menu
                ->addChild($item->getName(), array(
                    'route' => $entityName . '_show',
                    'routeParameters' => array(
                        'slug' => $item->getSlug()
                    ),
                    'label' => "<i class='fa fa-angle-right'></i> " . $item->getName(),
                    'extras' => array(
                        'safe_label' => true
                    ),
                ))
                ->setAttribute('class', 'list-group-item side-sub-item')
                ->setExtra('translation_domain', false)
            ;
        }

        return $menu;
    }

    public function createSideSubMenuForCriteria(array $options)
    {
        $menu = $this->factory->createItem('side_sub_criteria')
            ->setChildrenAttribute('class', 'list-group');

        foreach ($options as $option) {
            $menu->addChild(ucfirst($option), array(
                'route' => 'product_' . $option
            ));
        }
    }

}

