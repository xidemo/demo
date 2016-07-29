<?php

namespace AppBundle\Tests\Controller\Web;

use AppBundle\Tests\BaseWebTestCase;

class CategoryControllerTest extends BaseWebTestCase
{
    public function testListCategoryAction()
    {
        $response = $this->client->request('GET', 'category/');
        $this->assertEquals(200, $response->getStatusCode(), "Unexpected HTTP status code for GET /category/");
    }
}
