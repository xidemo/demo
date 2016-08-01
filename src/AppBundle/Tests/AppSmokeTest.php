<?php

namespace AppBundle\Tests;

class AppSmokeTest extends BaseWebTestCase
{
    /**
     * @dataProvider urlProvider
     */
    public function testAppSmoke($url)
    {
        $urlToTest = parent::$baseUrl . $url;

        $crawler = $this->client->request('GET', $urlToTest);
        $response = $this->client->getInternalResponse();
        $this->assertEquals(200, $response->getStatus());
    }

    public function urlProvider()
    {
        return array(
            array(''),
            array('product'),
            array('category'),
            array('admin'),
            array('login'),
            array('logout'),
            array('profile'),
            array('register'),
        );
    }
}
