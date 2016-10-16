<?php

namespace AppBundle\Admin;

use AppBundle\Entity\ProductImage;
use DateTime;
use Sonata\AdminBundle\Admin\AbstractAdmin;
use Sonata\AdminBundle\Datagrid\ListMapper;
use Sonata\AdminBundle\Datagrid\ProxyQueryInterface;
use Sonata\AdminBundle\Form\FormMapper;
use Sonata\AdminBundle\Route\RouteCollection;
use Sonata\AdminBundle\Show\ShowMapper;
use Symfony\Component\Form\Extension\Core\Type\FileType;
use Symfony\Component\HttpFoundation\File\UploadedFile;

class ProductImageAdmin extends AbstractAdmin
{
    // Override default route prefix
    protected $baseRouteName = 'admin_product_image';
    // Override default base URL
    protected $baseRoutePattern = 'product/image';
    // Override translation catalogue (default is 'messages')
    protected $translationDomain = 'SonataAdminBundle';
    // Disable the 'create' functionality
//    protected function configureRoutes(RouteCollection $collection)
//    {
//        $collection->remove('create');
//    }

    // Fields to be shown on create/edit forms
    protected function configureFormFields(FormMapper $formMapper)
    {
        $formMapper
            ->with('Product Image', [
                'class' => 'col-md-6'
            ])
            ->add('product')
            ->add('tempFile', FileType::class, array(
                'image_path' => 'webPath',
                'label' => 'Thumbnail'
            ))
            ->end();
    }

    // Fields to be shown on lists
    protected function configureListFields(ListMapper $listMapper)
    {
        $listMapper
            ->add('fileName', 'image', array(
                'prefix' => $this->getImageWebFolder(),
                'width' => 100,
                'label' => 'Image previews'
            ))
            ->add('_action', 'actions', [
                'actions' => [
                    'show' => [],
                    'edit' => [],
                    'delete' => [],
                ]
            ])
            ->add('product', 'sonata_type_model', array(
                'class' => 'AppBundle\Entity\Product',
                'associated_property' => 'name',
                'label' => 'Product'
            ))
            ->add('createdAt');
    }

    //Fields to be shown by showAction
    protected function configureShowFields(ShowMapper $showMapper)
    {
        $showMapper
            ->add('product', 'sonata_type_model', array(
                'class' => 'AppBundle\Entity\Product',
                'associated_property' => 'name',
                'label' => 'Product:'
            ))
            ->add('fileName', 'image', array(
                'prefix' => $this->getImageWebFolder(),
                'width' => 400,
                'height' => 300,
                'label' => 'File Name:'
            ))
            ->add('createdAt', null, array(
                'label' => 'Created:'
            ));
    }

    //on success message
    public function toString($object)
    {
        return $object instanceof ProductImage
            ? $object->getFileName()
            : "Product Image";
    }

    /**
     *  delete old file and help trigger external doctrine update event
     * TODO refactor to lifecycle or within admin class?
     * 
     * @param ProductImage $image
     */
    public function preUpdate($image)
    {
        $this->deleteImageFile($image);
        $image->setCreatedAt(new DateTime());
    }


    /**
     * Delete physical file after remove Image
     *
     * @param ProductImage $image
     */
    public function postRemove($image)
    {
        $this->deleteImageFile($image);
    }

    /**
     * Make sure batch delete remove physical files
     *
     * @param string $actionName
     * @param ProxyQueryInterface $query
     * @param array $idx
     * @param bool $allElements
     */
    public function preBatchAction($actionName, ProxyQueryInterface $query, array &$idx, $allElements)
    {
        if ($actionName == 'delete') {
            /** @var ProductImage[] $images */
            $images = $query->execute();

            foreach ($images as $image) {
                $this->deleteImageFile($image);
            }
        }
    }

    protected function getImageWebFolder()
    {
        $container = $this->getConfigurationPool()->getContainer();
        $imageFolder = $container->get('request')->getBasePath() . '/uploads/';

        return $imageFolder;
    }

    /**
     * @param ProductImage $image
     */
    protected function deleteImageFile($image)
    {
        $container = $this->getConfigurationPool()->getContainer();
        $fs = $container->get('filesystem');

        $fs->remove($container->getParameter('upload_folder') . '/' . $image->getFileName());
    }
}
