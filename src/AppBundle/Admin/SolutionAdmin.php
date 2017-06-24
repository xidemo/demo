<?php
namespace AppBundle\Admin;

use AppBundle\Entity\Solution;
use Sonata\AdminBundle\Admin\AbstractAdmin;
use Sonata\AdminBundle\Datagrid\ListMapper;
use Sonata\AdminBundle\Datagrid\DatagridMapper;
use Sonata\AdminBundle\Form\FormMapper;
use Sonata\AdminBundle\Show\ShowMapper;

class SolutionAdmin extends AbstractAdmin
{
    // Override default route prefix
    protected $baseRouteName = 'admin_solution';
    // Override default base URL
    protected $baseRoutePattern = 'solution';
    // Override translation catalogue (default is 'messages')
    protected $translationDomain = 'SonataAdminBundle';

    // Fields to be shown on create/edit forms
    protected function configureFormFields(FormMapper $formMapper)
    {
        $formMapper
            ->add('name', 'text', array(
                'label' => 'Name',
                'attr' => array(
                    'placeholder' => 'Enter the new solution name',
                )
            ))
            ->add('description', 'textarea', array(
                'attr' => array(
                    'rows' => '10'
                )
            ))
            ->add('solutionProducts')
        ;
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
                    'edit' => array(),
                    'delete' => array(),
                )
            ))
        ;
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
        return $object instanceof Solution
            ? $object->getName()
            : "solution";
    }
}