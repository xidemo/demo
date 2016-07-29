<?php

namespace AppBundle\Tests\Controller\Web;

use AppBundle\Tests\BaseWebTestCase;
use Symfony\Component\DomCrawler\Crawler;

class HomeControllerTest extends BaseWebTestCase
{
    public function testIndex()
    {
        $response = $this->client->get('');

        $this->assertEquals(200, $response->getStatusCode());
        $crawler = new Crawler($response->getBody()->getContents());
        $this->assertContains('Welcome to Symfony', $crawler->filter('#container h1')->text());
    }
}
