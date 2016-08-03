<?php

namespace AppBundle\Tests\Controller\Web;

use AppBundle\Tests\BaseWebTestCase;

class ProductControllerTest extends BaseWebTestCase
{
    protected function setUp()
    {
        parent::setUp();

        $this->loadFixtureFromFile();
    }

    public function testProductCRUD()
    {
        $url = parent::$baseUrl . 'product';

        $crawler = $this->client->request('GET', $url);
        $response = $this->client->getInternalResponse();
        $this->assertEquals(200, $response->getStatus(), "Unexpected HTTP status code for GET product/");
        $this->assertContains('Product list', $crawler->filter('body > h1')->text());
        $this->assertGreaterThan(0, $crawler->filter('td')->count(), 'Missing element td numbers');

        $crawler = $this->client->click($crawler->selectLink('Create a new entry')->link());

        // Fill in the form and submit it
        $form = $crawler->selectButton('Create')->form(array(
            'product[name]'  => 'acme_product2',
            'product[price]'  => 100,
            'product[description]'  => 'acme_product_description',
            'product[image]'  => 'acme_product_image',
            'product[stock]'  => 10,
        ));
        $crawler = $this->client->submit($form);

        // Show
        $this->assertGreaterThan(0, $crawler->filter('td:contains("acme_product2")')->count(), 'Missing element td:contains("aceme_product2")');

        // Edit
        $crawler = $this->client->click($crawler->selectLink('Edit')->link());
        $form = $crawler->selectButton('Edit')->form(array(
            'product[name]'  => 'acme_product3',
        ));
        $crawler = $this->client->submit($form);
        $this->assertGreaterThan(0, $crawler->filter('[value="acme_product3"]')->count(), 'Missing element [value="acme_product3"]');

        // Delete
        $crawler = $this->client->submit($crawler->selectButton('Delete')->form());
        $this->assertNotRegExp('/acme_product3/', $this->client->getResponse()->getContent());
    }
}
