<?php

namespace AppBundle\Tests\Controller\Web;

use AppBundle\Tests\BaseWebTestCase;

class CategoryControllerTest extends BaseWebTestCase
{
    public function testListCategoryAction()
    {
        $url = parent::$baseUrl . 'category';

        $crawler = $this->client->request('GET', $url);
        $response = $this->client->getInternalResponse();
        $this->assertEquals(200, $response->getStatus(), "Unexpected HTTP status code for GET product/");
    }
}
