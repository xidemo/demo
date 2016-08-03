<?php
namespace AppBundle\Admin;

use AppBundle\Entity\Category;
use Sonata\AdminBundle\Admin\AbstractAdmin;
use Sonata\AdminBundle\Datagrid\ListMapper;
use Sonata\AdminBundle\Datagrid\DatagridMapper;
use Sonata\AdminBundle\Form\FormMapper;
use Sonata\AdminBundle\Show\ShowMapper;

class CategoryAdmin extends AbstractAdmin
{
    // Override default route prefix
    protected $baseRouteName = 'admin_category';
    // Override default base URL
    protected $baseRoutePattern = 'category';
    // Override translation catalogue (default is 'messages')
    protected $translationDomain = 'SonataAdminBundle';

    // Fields to be shown on create/edit forms
    protected function configureFormFields(FormMapper $formMapper)
    {
        $formMapper
            ->add('name', 'text', array(
                'label' => 'Category Name',
                'attr' => array(
                    'placeholder' => 'Enter the new category name',
                )
            ));
    }

    // Fields to be shown on filter forms
    protected function configureDatagridFilters(DatagridMapper $datagridMapper)
    {
        $datagridMapper
            ->add('name');
    }

    // Fields to be shown on lists
    protected function configureListFields(ListMapper $listMapper)
    {
        $listMapper
            ->addIdentifier('name')
            ->add('_action', 'actions', array(
                'actions' => array(
                    'show' => array(),
                    'edit' => array(),
                    'delete' => array(),
                )
            ));
    }

    //Fields to be shown by showAction
    protected function configureShowFields(ShowMapper $showMapper)
    {
        $showMapper
            ->add('name');
    }

    //on success message
    public function toString($object)
    {
        return $object instanceof Category
            ? $object->getName()
            : "Category";
    }
}