<?php

namespace AppBundle\DataFixtures\Processor;

use Nelmio\Alice\ProcessorInterface;
use AppBundle\Entity\ProductImage;
use AppBundle\Utils\FileUploader;

final class ImageFileProcessor implements ProcessorInterface
{
    /**
     * @var FileUploader
     */
    private $imageFileUploader;

    /**
     * @param FileUploader $fileUploader
     */
    public function __construct(FileUploader $fileUploader)
    {
        $this->imageFileUploader = $fileUploader;
    }

    /**
     * {@inheritdoc}
     */
    public function preProcess($object)
    {
        //handle image fixture files
        if (false === $object instanceof ProductImage) {
            return;
        }

        $uploadedFileName = $this->imageFileUploader->uploadDefaultFixtureFiles(
            $object->getFileName()
        );
        $object->setFileName($uploadedFileName);
    }

    /**
     * {@inheritdoc}
     */
    public function postProcess($object)
    {
        // do nothing
    }
}