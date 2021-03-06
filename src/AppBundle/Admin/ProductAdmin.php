<?php namespace AppBundle\Admin;

use AppBundle\Entity\Product;
use Sonata\AdminBundle\Admin\AbstractAdmin;
use Sonata\AdminBundle\Datagrid\ListMapper;
use Sonata\AdminBundle\Datagrid\DatagridMapper;
use Sonata\AdminBundle\Form\FormMapper;
use Sonata\AdminBundle\Show\ShowMapper;

class ProductAdmin extends AbstractAdmin
{
    // Override default route prefix
    protected $baseRouteName = 'admin_product';
    // Override default base URL
    protected $baseRoutePattern = 'product';
    // Override translation catalogue (default is 'messages')
    protected $translationDomain = 'SonataAdminBundle';
    // Enable preview mode
    // protected $supportsPreviewMode = true;

    const PRICE_FIELD_HELP_MESSAGE = <<<'PRICE_FIELD_HELP'
<small>Note: The currency is in New Zealand dollars</small>
PRICE_FIELD_HELP;

    // Fields to be shown on create/edit forms
    protected function configureFormFields(FormMapper $formMapper)
    {
        $formMapper
            ->tab('Product Information')
                ->with('Product Information', [
                    'class' => 'col-md-12'
                ])
                    ->add('name', 'text', [
                        'label' => 'Product Name'
                    ])
                    ->add('category', 'sonata_type_model', [
                        'class' => 'AppBundle\Entity\Category',
                        'property' => 'name',
                    ])
                    ->add('description', 'textarea', [
                        'attr' => [
                            'rows' => '10'
                        ]
                    ])
                    ->add('dimension')
                    ->add('upc')
                ->end()
            ->end()
            ->tab('Pricing & Stock')
                ->with('Pricing & Stock', [
                    'class' => 'col-md-12',
                    // 'description'=>'This section contains more product description'
                ])
                    ->add('price', 'money', [
                        'help' => self::PRICE_FIELD_HELP_MESSAGE,
                        'currency' => 'false',
                        'attr' => [
                            'placeholder' => 'Amount in NZD',
                        ]
                    ])
                    ->add('stock')
                ->end()
            ->end()
            ->tab('Gallery')
                ->with('Gallery', [
                    'class' => 'col-md-12'
                ])
                    ->add('images', 'sonata_type_collection', [
                        'label' => ' ',
                        'required' => false,
                        'by_reference' => false,
                    ], [
                        'edit' => 'inline',
                        'inline' => 'table',
                        'sortable' => 'id',
                    ])
                ->end()
            ->end();
    }

    // Fields to be shown on filters
    protected function configureDatagridFilters(DatagridMapper $datagridMapper)
    {
        $datagridMapper
            ->add('category', null, [], 'entity', [], [
                'class' => 'AppBundle\Entity\Category',
                'property' => 'name',
                'show_filter' => true,
            ])
            ->add('name')
            ->add('price')
            ->add('stock');
    }

    // Fields to be shown on lists
    protected function configureListFields(ListMapper $listMapper)
    {
        $listMapper
            ->add('category.name')
            ->addIdentifier('name')
            ->add('price', 'currency', [
                'currency' => 'nz$'
            ])
            ->add('stock', 'integer', [
                'editable' => 'editable',
            ])
            ->add('createdAt', null, [
                'format' => 'd/m/Y  H:i',
                'timezone' => 'Pacific/Auckland'
            ])
            ->add('_action', 'actions', [
                'actions' => [
                    'edit' => [],
                    'delete' => [],
                ]
            ]);
    }

    //Fields to be shown by showAction
    protected function configureShowFields(ShowMapper $showMapper)
    {
        $showMapper
            ->with('General Information', [
                'class' => 'col-md-3'
            ])
            ->add('category')
            ->add('name')
            ->add('description')
            ->add('price')
            ->add('stock')
            ->end()
            //form group
            ->with('Gallery', [
                'class' => 'col-md-6',
            ])
            ->add('image')
            ->end();
    }

    //on success message
    public function toString($object)
    {
        return $object instanceof Product
            ? $object->getName()
            : "Product";
    }

    public function prePersist($product)
    {
        $this->preUpdate($product);
    }

    public function preUpdate($product)
    {
        $product->setImages($product->getImages());
    }

}