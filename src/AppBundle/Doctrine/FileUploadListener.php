<?php

namespace AppBundle\Doctrine;

use AppBundle\Entity\Image;
use AppBundle\Entity\Product;
use AppBundle\Entity\ProductImage;
use AppBundle\Utils\FileUploader;
use Doctrine\Common\EventSubscriber;
use Doctrine\ORM\Event\LifecycleEventArgs;
use Symfony\Component\HttpFoundation\File\File;
use Symfony\Component\HttpFoundation\File\UploadedFile;
use Symfony\Component\Validator\Constraints\DateTime;

class FileUploadListener implements EventSubscriber
{

    /**
     * @var FileUploader
     */
    private $fileUploader;

    public function __construct(FileUploader $fileUploader)
    {
        $this->fileUploader = $fileUploader;
    }

    public function prePersist(LifecycleEventArgs $args)
    {
        $entity = $args->getEntity();

        $this->handleImageFile($entity);
    }

    public function preUpdate(LifecycleEventArgs $args)
    {
        $entity = $args->getEntity();

        $this->handleImageFile($entity);
    }

    // repopulate $tempFile with UploadedFile instance after loading Image
    public function postLoad(LifecycleEventArgs $args)
    {
        /** @var ProductImage $entity */
        $entity = $args->getEntity();

        if (!$entity instanceof Image) {
            return;
        }

        $fileName = $entity->getFileName();

        $entity->setTempFile(new File($this->fileUploader->getTargetDir().'/'.$fileName));
    }

    public function getSubscribedEvents()
    {
        return ['prePersist', 'preUpdate', 'postLoad'];
    }

    private function handleImageFile($entity)
    {
        if (!$entity instanceof Image) {
            return;
        }

        // only set fileName when it is uploaded
        $file = $entity->getTempFile();
        if ($file instanceof UploadedFile) {
            $fileName = $this->fileUploader->upload($file);
            $entity->setFileName($fileName);
        }

        $entity->setCreatedAt(new \DateTime());
    }
}