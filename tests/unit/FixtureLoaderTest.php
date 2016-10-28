<?php


class FixtureLoaderTest extends \Codeception\Test\Unit
{
    /**
     * @var \UnitTester
     */
    protected $tester;

    protected function _before()
    {
        // Load fixtures
        $fixtureLoader = $this->tester->grabService('app.fixture_loader');
        $fixtureLoader->load('fixtures.yml','test');
    }

    protected function _after()
    {
        $this->tester->purgeDB();
    }

    public function testFixtureLoader()
    {
        $this->tester->wantTo('load fixtures from default file and see them in DB');
        $this->tester->canSeeInRepository('Application\Sonata\UserBundle\Entity\User', ['username' => 'alice']);
        $this->tester->canSeeInRepository('Application\Sonata\UserBundle\Entity\User', ['username' => 'ryan']);
        $this->tester->canSeeNumRecords(4, 'app_category');
        $this->tester->canSeeNumRecords(100, 'app_product');
    }
}