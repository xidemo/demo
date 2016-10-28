<?php

namespace AppBundle\Utils;

use Symfony\Component\DependencyInjection\ContainerInterface as Container;

class FixtureLoader
{
    /**
     * @var Container
     */
    private $container;

    public function __construct(Container $container)
    {
        $this->container = $container;
    }

    /**
     * TODO: environment control stuck on test
     * Load default Alice/Faker fixture file
     * @param string $filename
     * @param string $environment
     */
    public function load($filename, $environment = 'dev')
    {
        $entityManager = $this->container->get('doctrine.orm.entity_manager');
        $kernel = $this->container->get('kernel');
        $fixtureFolder = __DIR__ . '/../DataFixtures/ORM/';

        $this->container
            ->get('hautelook_alice.doctrine.executor.fixtures_executor')
            ->execute(
                $entityManager,
                $this->container->get('hautelook_alice.doctrine.orm.loader_generator')->generate(
                    $this->container->get('hautelook_alice.fixtures.loader'),
                    $this->container->get('hautelook_alice.alice.fixtures.loader'),
                    $kernel->getBundles(),
                    $environment),
                $this->container->get('hautelook_alice.doctrine.orm.fixtures_finder')->resolveFixtures(
                    $kernel,
                    [ $fixtureFolder . $filename ]),
                false, //If true, data will not be purged
                function ($message) {
                }, //Can be used for logging, if needed
                true); //If true, truncates instead of deleting
    }
}