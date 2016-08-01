<?php

namespace AppBundle\Tests\Controller\Web;

use AppBundle\Tests\BaseWebTestCase;
use Symfony\Component\DomCrawler\Crawler;

class HomeControllerTest extends BaseWebTestCase
{
    public function testIndex()
    {
        $url = parent::$baseUrl . '/';
        $crawler = $this->client->request('GET', $url);
        $response = $this->client->getInternalResponse();

        $this->assertEquals(200, $response->getStatus(), "Unexpected HTTP status code for GET product/");
        $this->assertContains('Welcome to Symfony', $crawler->filter('#container h1')->text());
    }
}
