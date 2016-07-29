<?php

namespace AppBundle\Tests;

class AppSmokeTest extends BaseWebTestCase
{
    /**
     * @dataProvider urlProvider
     */
    public function testAppSmoke($url)
    {
        $response = $this->client->get($url);
        $this->assertEquals(200, $response->getStatusCode());
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
