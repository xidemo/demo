<?php

namespace AppBundle\DataFixtures\ORM;

use Doctrine\Common\DataFixtures\FixtureInterface;
use Doctrine\Common\Persistence\ObjectManager;
use Nelmio\Alice\Fixtures;

class LoadFixtures implements FixtureInterface
{
    public function load(ObjectManager $manager)
    {
        Fixtures::load(
            __DIR__ . '/fixtures.yml',
            $manager,
            array(
                'providers' => [$this]
            )
        );
    }

    public function optronicEquipment()
    {
        $items = array();
        for ($i = 1000; $i <= 35000; $i += 1000) {
            $items[] = 'Mercury Xenon Short Arc Lamps ' . $i . ' watts';
        }
        for ($i = 2500; $i <= 18000; $i += 1000) {
            $items[] = 'Long Arc UV Lamps for Curing/Coating ' . $i . ' watts';
        }
        for ($i = 250; $i <= 350; $i += 20) {
            $items[] = 'Long Arc UV Lamps for Exposure ' . $i . ' watts';
        }
        for ($i = 1000; $i <= 35000; $i += 1000) {
            $items[] = 'Projection Lamps for Optical Inspection ' . $i . ' watts';
        }
        for ($i = 20; $i <= 200; $i += 10) {
            $items[] = 'Germicidal Lamps for UV/O3 Cleaning ' . $i . ' watts';
        }
        for ($i = 700; $i <= 10000; $i += 1000) {
            $items[] = 'Film/Stage Xenon Lamps ' . $i . ' watts';
        }
        for ($i = 500; $i <= 2000; $i += 100) {
            $items[] = 'DE HPS Lamps ' . $i . ' watts';
        }
        for ($i = 50; $i <= 200; $i += 20) {
            $items[] = 'CDI-' . $i . 'S Single-table Scan Laser Direct Imaging System ';
        }

        $key = array_rand($items);

        return $items[$key];
    }
}