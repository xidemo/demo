<?php

class OrderItemControllerCest
{
    private $orderNumber;
    private $itemUri;
    private $token;
    private $payload = '{"product":1, "quantity":10}';
    private $badPayload = '{"quantity": -1}';
    private $invalidJsonPayload = '{"product":2"quantity":10}';

    public function _before(ApiTester $I)
    {
        $this->token = $I->grabTokenForUser('tom', 'tom');
        $I->amBearerAuthenticated($this->token);
    }

    public function _after(ApiTester $I)
    {
    }

    public function newOrderItemTest(ApiTester $I)
    {
        $I->wantTo('add new order item');
        $this->orderNumber = $I->createNewOrder();
        $I->haveHttpHeader('Content-Type', 'application/hal+json');
        $I->haveHttpHeader('Accept', 'application/hal+json');
        $I->sendPOST('/api/orders/mine/' . $this->orderNumber, $this->payload);

        $I->canSeeResponseCodeIs(\Codeception\Util\HttpCode::CREATED);
        $I->canSeeHttpHeader('Content-Type', 'application/hal+json');
        $I->canSeeHttpHeader('Location', '/api/orders/mine/' . $this->orderNumber . '/1');
        $I->canSeeResponseContainsJson([
            'product' => 1,
            'quantity' => 10
        ]);
        $I->canSeeResponseJsonMatchesJsonPath('$._links.self.href');

        $this->itemUri = $I->grabHttpHeader('Location');
    }

    public function getOrderItemTest(ApiTester $I)
    {
        $I->wantTo('get order item');
        $I->sendGET($this->itemUri);

        $I->canSeeResponseCodeIs(\Codeception\Util\HttpCode::OK);
        $I->canSeeHttpHeader('Content-Type', 'application/hal+json');
        $I->canSeeResponseIsJson();
        $I->canSeeResponseContainsJson([
            'product' => 1,
            'quantity' => 10
        ]);
        $I->canSeeResponseJsonMatchesJsonPath('$._links.self.href');
    }

    public function addOrderItemCollectionTest(ApiTester $I)
    {
        $I->wantTo('add a collection of 50 items to the order');
        for ($i = 2; $i <= 51; $i++) {
            $I->sendPOST(
                '/api/orders/mine/' . $this->orderNumber,
                '{"product": ' . $i . ', "quantity": ' . $i . '}'
            );
        }
        $I->canSeeNumRecords(51, 'app_order_item');
        $I->canSeeResponseJsonMatchesJsonPath('$._links.self.href');
    }

    public function listAllOrderItemsTest(ApiTester $I)
    {
        $I->wantTo('list all order items');
        $I->sendGET('/api/orders/mine/' . $this->orderNumber);

        $I->canSeeResponseCodeIs(\Codeception\Util\HttpCode::OK);
        $I->canSeeHttpHeader('Content-Type', 'application/hal+json');
        $I->canSeeResponseIsJson();
        $I->canSeeResponseContainsJson([
            'items' => [
                'product' => 1,
                'quantity' => 10
            ]
        ]);
        $I->canSeeNumRecords(51, 'app_order_item');
        $I->canSeeResponseJsonMatchesJsonPath('$.items[0]._links.self.href');
    }

    public function listAllOrderItemsPaginatedTest(ApiTester $I)
    {
        $I->wantTo('list paginated all order items ');
        $I->sendGET('/api/orders/mine/' . $this->orderNumber);

        $I->canSeeResponseCodeIs(\Codeception\Util\HttpCode::OK);
        $I->canSeeHttpHeader('Content-Type', 'application/hal+json');
        $I->canSeeResponseIsJson();
        $I->canSeeResponseContainsJson([
            'items' => [
                'product' => 9,
            ]
        ]);
        $I->canSeeResponseContainsJson([
            'count' => 10,
        ]);
        $I->canSeeResponseContainsJson([
            'total' => 51,
        ]);
        //check for valid structure
        $I->canSeeResponseJsonMatchesJsonPath('$._links.self');
        $I->canSeeResponseJsonMatchesJsonPath('$._links.first');
        $I->canSeeResponseJsonMatchesJsonPath('$._links.last');
        $I->canSeeResponseJsonMatchesJsonPath('$.items');
        $I->cantSeeResponseContainsJson([
            'items' => [
                'product' => 11,
            ]
        ]);
        $I->canSeeResponseJsonMatchesJsonPath('$.items[0]._links.self.href');
    }

    //filter stub
    public function listAllOrderItemsPaginatedWithFilterTest(ApiTester $I)
    {
        $I->wantTo('search|filter all order items with low stock');
        $I->sendGET('/api/orders/mine/' . $this->orderNumber . '?maxstock=5');

        $I->canSeeResponseCodeIs(\Codeception\Util\HttpCode::OK);
        $I->canSeeHttpHeader('Content-Type', 'application/hal+json');
        //check for valid structure
        $I->canSeeResponseJsonMatchesJsonPath('$._links.self');
        $I->canSeeResponseJsonMatchesJsonPath('$._links.first');
        $I->canSeeResponseJsonMatchesJsonPath('$._links.last');
        $I->canSeeResponseJsonMatchesJsonPath('$.items');
        $I->canSeeResponseJsonMatchesJsonPath('$.count');
        $I->canSeeResponseJsonMatchesJsonPath('$.total');
        //check for filtered result
        $I->canSeeResponseContainsJson([
            'items' => [
                'quantity' => 5,
            ]
        ]);
        $I->cantSeeResponseContainsJson([
            'items' => [
                'quantity' => 6,
            ]
        ]);
        $I->canSeeResponseJsonMatchesJsonPath('$.items[0]._links.self.href');
    }

    //modify a order item quantity using PUT
    public function putOrderItemTest(ApiTester $I)
    {
        $I->wantTo('put order item');
        $I->sendPUT($this->itemUri,
            '{"order":1, "product":5, "quantity": 11}'
        );

        $I->canSeeResponseCodeIs(\Codeception\Util\HttpCode::OK);
        $I->canSeeHttpHeader('Content-Type', 'application/hal+json');
        //should not change
        $I->canSeeResponseContainsJson(['product' => 1]);
        //should change
        $I->canSeeResponseContainsJson(['quantity' => 11]);
        //idempotency check
        $I->canSeeNumRecords(51, 'app_order_item');
        $I->canSeeResponseJsonMatchesJsonPath('$._links.self.href');
    }

    //modify a order item quantity using PATCH
    public function patchOrderItemTest(ApiTester $I)
    {
        $I->wantTo('patch order item');
        $I->sendPATCH($this->itemUri,
            '{"quantity": 12}'
        );

        $I->canSeeResponseCodeIs(\Codeception\Util\HttpCode::OK);
        $I->canSeeHttpHeader('Content-Type', 'application/hal+json');
        //should not change
        $I->canSeeResponseContainsJson(['product' => 1]);
        //should change
        $I->canSeeResponseContainsJson(['quantity' => 12]);
        //idempotency check
        $I->canSeeNumRecords(51, 'app_order_item');
        $I->canSeeResponseJsonMatchesJsonPath('$._links.self.href');
    }

    public function deleteOrderItemTest(ApiTester $I)
    {
        $I->wantTo('delete order item');
        $I->sendDELETE($this->itemUri);

        $I->canSeeResponseCodeIs(\Codeception\Util\HttpCode::NO_CONTENT);
        $I->canSeeNumRecords(50, 'app_order_item');
    }

    //idempotency - delete a non-existing order item
    public function deleteOrderItemIdempotencyTest(ApiTester $I)
    {
        $I->wantTo('delete order item that does not exist');
        $I->sendDELETE($this->itemUri);

        $I->canSeeResponseCodeIs(\Codeception\Util\HttpCode::NO_CONTENT);
        $I->canSeeNumRecords(50, 'app_order_item');
    }

    public function validationTest(ApiTester $I)
    {
        $I->wantTo('test api validation errors');
        $I->haveHttpHeader('Content-Type', 'application/json');
        $I->sendPOST('/api/orders/mine/' . $this->orderNumber, $this->badPayload);

        $I->canSeeResponseCodeIs(\Codeception\Util\HttpCode::BAD_REQUEST);
        $I->canSeeHttpHeader('Content-Type', 'application/problem+json');
        $I->canSeeResponseIsJson();
        $I->canSeeResponseContains('type');
        $I->canSeeResponseContains('title');
        $I->canSeeResponseContains('errors');
        $I->canSeeResponseContains('Product needed');
        $I->canSeeResponseContains('Quantity can not be negative');
    }

    public function invalidJsonTest(ApiTester $I)
    {
        $I->wantTo('test invalid json sent by the client');
        $I->haveHttpHeader('Content-Type', 'application/json');
        $I->sendPOST('/api/orders/mine/' . $this->orderNumber, $this->invalidJsonPayload);

        $I->canSeeResponseCodeIs(\Codeception\Util\HttpCode::BAD_REQUEST);
        $I->canSeeHttpHeader('Content-Type', 'application/problem+json');
        $I->canSeeResponseIsJson();
        $I->canSeeResponseContains('type');
        $I->canSeeResponseContains('title');
    }

    public function api404Test(ApiTester $I)
    {
        $I->wantTo('see consistent api error response');
        $I->sendGET('/api/orders/mine/' . $this->orderNumber . '/fakeitem');

        $I->canSeeResponseCodeIs(\Codeception\Util\HttpCode::NOT_FOUND);
        $I->canSeeHttpHeader('Content-Type', 'application/problem+json');
        $I->canSeeResponseIsJson();
        $I->canSeeResponseContainsJson(['type' => 'about:blank']);
        $I->canSeeResponseContains('detail');
        $I->canSeeResponseContains('not found');
    }
}
