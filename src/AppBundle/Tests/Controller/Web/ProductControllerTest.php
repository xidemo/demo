<?php

namespace AppBundle\Tests\Controller\Web;

use AppBundle\Tests\BaseWebTestCase;
use Symfony\Component\HttpKernel\Kernel;

class ProductControllerTest extends BaseWebTestCase
{
    protected function setUp()
    {
        parent::setUp();

        $this->loadFixtureFromFile();
    }

    public function testListProductAction()
    {
        $url = parent::$baseUrl . 'product';

        $crawler = $this->client->request('GET', $url);
        $response = $this->client->getInternalResponse();
        $this->assertEquals(200, $response->getStatus(), "Unexpected HTTP status code for GET product/");
    }

//    public function testCompleteScenario()
//    {
//        // Create a new client to browse the application
//        $client = static::createClient();
//
//        // Create a new entry in the database
//        $crawler = $client->request('GET', '/product/');
//        $this->assertEquals(200, $client->getResponse()->getStatusCode(), "Unexpected HTTP status code for GET /product/");
//        $crawler = $client->click($crawler->selectLink('Create a new entry')->link());
//
//        // Fill in the form and submit it
//        $form = $crawler->selectButton('Create')->form(array(
//            'appbundle_product[field_name]'  => 'Test',
//            // ... other fields to fill
//        ));
//
//        $client->submit($form);
//        $crawler = $client->followRedirect();
//
//        // Check data in the show view
//        $this->assertGreaterThan(0, $crawler->filter('td:contains("Test")')->count(), 'Missing element td:contains("Test")');
//
//        // Edit the entity
//        $crawler = $client->click($crawler->selectLink('Edit')->link());
//
//        $form = $crawler->selectButton('Update')->form(array(
//            'appbundle_product[field_name]'  => 'Foo',
//            // ... other fields to fill
//        ));
//
//        $client->submit($form);
//        $crawler = $client->followRedirect();
//
//        // Check the element contains an attribute with value equals "Foo"
//        $this->assertGreaterThan(0, $crawler->filter('[value="Foo"]')->count(), 'Missing element [value="Foo"]');
//
//        // Delete the entity
//        $client->submit($crawler->selectButton('Delete')->form());
//        $crawler = $client->followRedirect();
//
//        // Check the entity has been delete on the list
//        $this->assertNotRegExp('/Foo/', $client->getResponse()->getContent());
//    }
}
