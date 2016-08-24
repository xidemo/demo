<?php

namespace AppBundle\Tests\Controller\Web;

use AppBundle\Tests\BaseWebTestCase;

class CategoryControllerTest extends BaseWebTestCase
{
    protected function setUp()
    {
        parent::setUp();

        $this->loadFixtureFromFile();
    }

    public function testCategoryListAction()
    {
        $url = parent::$baseUrl . 'category';

        $crawler = $this->client->request('GET', $url);
        $response = $this->client->getInternalResponse();

        $this->assertEquals(200, $response->getStatus(), "Unexpected HTTP status code for GET product/");
        $this->assertContains('Category', $crawler->filter('.col-md-2 > h4')->text());
        $this->assertContains('Id', $crawler->filter('th:nth-child(1)')->text());
        $this->assertContains('Name', $crawler->filter('th:nth-child(2)')->text());
        $this->assertContains('Slug', $crawler->filter('th:nth-child(3)')->text());
        $this->assertContains('Associate Products', $crawler->filter('th:nth-child(4)')->text());
        $this->assertContains('acme_category', $crawler->filter('.table td > a')->text());
        $this->assertContains('acme-category', $crawler->filter('.table td:nth-child(3)')->text());
        $this->assertContains('acme_product', $crawler->filter('.table td:nth-child(4)')->text());
    }

    public function testCategoryShowAction()
    {
        $url = parent::$baseUrl . 'category/acme-category';

        $crawler = $this->client->request('GET', $url);
        $response = $this->client->getInternalResponse();

        $this->assertEquals(200, $response->getStatus(), "Unexpected HTTP status code for GET product/acme-category");
        $this->assertContains('Category', $crawler->filter('.col-md-2 > h4')->text());
        $this->assertContains('acme_category', $crawler->filter('h2')->text());
        $this->assertContains('acme_product', $crawler->filter('#assoc_product td > a')->text());
    }
}
