<?php

class OrderControllerCest
{
    private $orderNumber;
    private $token;

    public function _before(ApiTester $I)
    {
        $this->token = $I->grabTokenForUser('tom', 'tom');
        $I->amBearerAuthenticated($this->token);
    }

    public function _after(ApiTester $I)
    {
    }

    public function newOrderForUserTest(ApiTester $I)
    {
        $I->wantTo('create a new order as a logged-in customer');
        $I->sendPOST('/api/orders/new');

        $I->canSeeResponseCodeIs(\Codeception\Util\HttpCode::OK);
        $I->canSeeHttpHeader('Content-Type', 'application/hal+json');
        $I->canSeeResponseJsonMatchesJsonPath('$.orderNumber');
        $response = json_decode($I->grabResponse(), true);
        $this->orderNumber = $response['orderNumber'];
        $I->canSeeResponseContainsJson(['orderNumber' => $this->orderNumber]);
        $I->canSeeResponseJsonMatchesJsonPath('$.user');
        $I->canSeeResponseJsonMatchesJsonPath('$.items');
        $I->canSeeResponseJsonMatchesJsonPath('$.orderNumber');
        $I->canSeeResponseJsonMatchesJsonPath('$.placedAt');
        $I->canSeeResponseJsonMatchesJsonPath('$.note');
        $I->canSeeResponseJsonMatchesJsonPath('$.state');
        $I->canSeeResponseJsonMatchesJsonPath('$._links.orderItems.href');
    }

    public function addOrderCollectionForUserTest(ApiTester $I)
    {
        $I->wantTo('add a collection of 10 orders');
        for ($i = 2; $i <= 11; $i++) {
            $I->sendPOST('/api/orders/new');
        }
        $I->canSeeNumRecords(11, 'app_order');
    }

    public function listOrderCollectionForUserTest(ApiTester $I)
    {
        $I->wantTo('get order collection as a logged-in customer');
        $I->sendGET('/api/orders/mine');

        $I->canSeeResponseCodeIs(\Codeception\Util\HttpCode::OK);
        $I->canSeeHttpHeader('Content-Type', 'application/hal+json');
        $I->canSeeResponseIsJson();
        $I->canSeeNumRecords(11, 'app_order');
        $I->canSeeResponseJsonMatchesJsonPath('$[0].user');
        $I->canSeeResponseJsonMatchesJsonPath('$[0].items');
        $I->canSeeResponseJsonMatchesJsonPath('$[0].orderNumber');
        $I->canSeeResponseJsonMatchesJsonPath('$[0].placedAt');
        $I->canSeeResponseJsonMatchesJsonPath('$[0].note');
        $I->canSeeResponseJsonMatchesJsonPath('$[0].state');
        $I->canSeeResponseJsonMatchesJsonPath('$[0]._links.orderItems.href');
    }
}
