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

    public function testShowProductAction()
    {
        $url = parent::$baseUrl . 'product/acme-product';

        $crawler = $this->client->request('GET', $url);
        $response = $this->client->getInternalResponse();
        $this->assertEquals(200, $response->getStatus(), "Unexpected HTTP status code for GET product/acme-product");
        $this->assertContains('Product', $crawler->filter('.col-md-2 > h4')->text());
        $this->assertContains('acme_product', $crawler->filter('.col-md-10 > h2')->text());
        $this->assertGreaterThan(0, $crawler->filter('td')->count(), 'Missing element td numbers');
    }
}
