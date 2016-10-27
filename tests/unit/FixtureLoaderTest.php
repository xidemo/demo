<?php


class FixtureLoaderTest extends \Codeception\Test\Unit
{
    /**
     * @var \UnitTester
     */
    protected $tester;

    protected function _before()
    {
    }

    protected function _after()
    {
    }

    public function testFixtureLoader()
    {
        $this->tester->wantTo('load fixtures from default file and see them in DB');
        $fixtureLoader = $this->tester->grabService('app.fixture_loader');
        $fixtureLoader->load('fixtures_test_env.yml','dev');
        $this->tester->seeInRepository('Application\Sonata\UserBundle\Entity\User', ['username' => 'admin']);
        $this->tester->seeInRepository('Application\Sonata\UserBundle\Entity\User', ['username' => 'superadmin']);
        $this->tester->seeInRepository('AppBundle\Entity\Category', ['name' => 'acme_category']);
        $this->tester->seeInRepository('AppBundle\Entity\Product', ['name' => 'acme_product']);
    }
}