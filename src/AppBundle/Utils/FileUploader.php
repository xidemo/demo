<?php

namespace AppBundle\Utils;

use Symfony\Component\Filesystem\Exception\FileNotFoundException;
use Symfony\Component\Filesystem\Filesystem;
use Symfony\Component\HttpFoundation\File\UploadedFile;

class FileUploader
{
    const DEFAULT_UPLOAD_DIR = __DIR__ . '/../../../web/uploads/';

    private $targetDir;

    public function __construct($targetDir)
    {
        $this->targetDir = $targetDir;
    }

    public function upload(UploadedFile $file)
    {
        $fileName = md5(uniqid()).'.'.$file->guessExtension();

        $file->move($this->targetDir, $fileName);

        return $fileName;
    }

    public function uploadDefaultFixtureFiles($filename)
    {
        $fs = new Filesystem();
        $defaultFile = realpath(self::DEFAULT_UPLOAD_DIR . $filename);

        if (!$defaultFile || !$fs->exists($defaultFile)) {
            throw new FileNotFoundException('the default file is not found ' . $defaultFile);
        }

        list($prefix, $surfix) = explode('.', $filename);
        $newFileName = md5($prefix).'.'.$surfix;

        $fs->copy($defaultFile, self::DEFAULT_UPLOAD_DIR . $newFileName);

        return $newFileName;
    }

    /**
     * @return mixed
     */
    public function getTargetDir()
    {
        return $this->targetDir;
    }

    /**
     * @param mixed $targetDir
     */
    public function setTargetDir($targetDir)
    {
        $this->targetDir = $targetDir;
    }
}