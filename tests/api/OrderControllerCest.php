<?php

class OrderControllerCest
{
    private $orderNumber;
    private $itemUri;
    private $payload = '{"product":1, "quantity":10}';
    private $badPayload = '{"quantity":10}';
    private $invalidJsonPayload = '{"product":2"quantity":10}';

    public function _before(ApiTester $I)
    {
    }

    public function _after(ApiTester $I)
    {
    }

    public function getOrderCartTest(ApiTester $I)
    {
        $I->wantTo('get order/cart number');
        $I->sendGET('/api/order');

        $I->canSeeResponseCodeIs(\Codeception\Util\HttpCode::OK);
        $I->canSeeHttpHeader('Content-Type', 'application/json');
        $response = json_decode($I->grabResponse(), true);
        $this->orderNumber = $response['orderNumber'];
        $I->canSeeResponseContainsJson(['orderNumber' => $this->orderNumber]);
    }

    public function addOrderItemTest(ApiTester $I)
    {
        $I->wantTo('add order item');
        $I->haveHttpHeader('Content-Type', 'application/json');
        $I->haveHttpHeader('Accept', 'application/json');
        $I->sendPOST('/api/order/' . $this->orderNumber, $this->payload);

        $I->canSeeResponseCodeIs(\Codeception\Util\HttpCode::CREATED);
        $I->canSeeHttpHeader('Content-Type', 'application/json');
        $I->canSeeHttpHeader('Location', '/api/order/' . $this->orderNumber . '/1');
        $I->canSeeResponseContainsJson([
            'productId' => 1,
            'quantity' => 10
        ]);

        $this->itemUri = $I->grabHttpHeader('Location');
    }

    public function getOrderItemTest(ApiTester $I)
    {
        $I->wantTo('get order item');
        $I->sendGET($this->itemUri);

        $I->canSeeResponseCodeIs(\Codeception\Util\HttpCode::OK);
        $I->canSeeHttpHeader('Content-Type', 'application/json');
        $I->canSeeResponseIsJson();
        $I->canSeeResponseContainsJson([
            'productId' => 1,
            'quantity' => 10
        ]);
    }

    public function addOrderItemCollectionTest(ApiTester $I)
    {
        $I->wantTo('add a collection of 50 items to the order');
        for ($i = 2; $i <= 51; $i++) {
            $I->sendPOST(
                '/api/order/' . $this->orderNumber,
                '{"product": ' . $i . ', "quantity": ' . $i . '}'
            );
        }
    }

    public function listAllOrderItemsTest(ApiTester $I)
    {
        $I->wantTo('get all order items');
        $I->sendGET('/api/order/' . $this->orderNumber);

        $I->canSeeResponseCodeIs(\Codeception\Util\HttpCode::OK);
        $I->canSeeHttpHeader('Content-Type', 'application/json');
        $I->canSeeResponseIsJson();
        $I->canSeeResponseContainsJson([
            'items' => [
                'productId' => 1,
                'quantity' => 10
            ]
        ]);
        $I->canSeeNumRecords(51, 'app_order_item');
    }

    public function listAllOrderItemsPaginatedTest(ApiTester $I)
    {
        $I->wantTo('get all order items paginated');
        $I->sendGET('/api/order/' . $this->orderNumber);

        $I->canSeeResponseCodeIs(\Codeception\Util\HttpCode::OK);
        $I->canSeeHttpHeader('Content-Type', 'application/json');
        $I->canSeeResponseIsJson();
        $I->canSeeResponseContainsJson([
            'items' => [
                'productId' => 9,
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
                'productId' => 11,
            ]
        ]);
    }

    //filter stub
    public function listAllOrderItemsPaginatedWithFilterTest(ApiTester $I)
    {
        $I->wantTo('search|filter all order items with low stock');
        $I->sendGET('/api/order/' . $this->orderNumber . '?maxstock=5');

        $I->canSeeResponseCodeIs(\Codeception\Util\HttpCode::OK);
        $I->canSeeHttpHeader('Content-Type', 'application/json');
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
    }

    //modify a order item quantity using PUT
    public function putOrderItemTest(ApiTester $I)
    {
        $I->wantTo('put order item');
        $I->sendPUT($this->itemUri,
            '{"orderId":1, "productId":5, "quantity": 11}'
        );

        $I->canSeeResponseCodeIs(\Codeception\Util\HttpCode::OK);
        $I->canSeeHttpHeader('Content-Type', 'application/json');
        //should not change
        $I->canSeeResponseContainsJson(['productId' => 1]);
        //should change
        $I->canSeeResponseContainsJson(['quantity' => 11]);
        //idempotency check
        $I->canSeeNumRecords(51, 'app_order_item');
    }

    //modify a order item quantity using PATCH
    public function patchOrderItemTest(ApiTester $I)
    {
        $I->wantTo('patch order item');
        $I->sendPATCH($this->itemUri,
            '{"quantity": 12}'
        );

        $I->canSeeResponseCodeIs(\Codeception\Util\HttpCode::OK);
        $I->canSeeHttpHeader('Content-Type', 'application/json');
        //should not change
        $I->canSeeResponseContainsJson(['productId' => 1]);
        //should change
        $I->canSeeResponseContainsJson(['quantity' => 12]);
        //idempotency check
        $I->canSeeNumRecords(51, 'app_order_item');
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
        $I->sendPOST('/api/order/' . $this->orderNumber, $this->badPayload);

        $I->canSeeResponseCodeIs(\Codeception\Util\HttpCode::BAD_REQUEST);
        $I->canSeeHttpHeader('Content-Type', 'application/problem+json');
        $I->canSeeResponseIsJson();
        $I->canSeeResponseContains('type');
        $I->canSeeResponseContains('title');
        $I->canSeeResponseContains('errors');
        $I->canSeeResponseContains('Please enter a product id');
    }

    public function invalidJsonTest(ApiTester $I)
    {
        $I->wantTo('test invalid json sent by the client');
        $I->haveHttpHeader('Content-Type', 'application/json');
        $I->sendPOST('/api/order/' . $this->orderNumber, $this->invalidJsonPayload);

        $I->canSeeResponseCodeIs(\Codeception\Util\HttpCode::BAD_REQUEST);
        $I->canSeeHttpHeader('Content-Type', 'application/problem+json');
        $I->canSeeResponseIsJson();
        $I->canSeeResponseContains('type');
        $I->canSeeResponseContains('title');
    }

    public function api404Test(ApiTester $I)
    {
        $I->wantTo('see consistent api error response');
        $I->sendGET('/api/order/' . $this->orderNumber . '/fakeitem');

        $I->canSeeResponseCodeIs(\Codeception\Util\HttpCode::NOT_FOUND);
        $I->canSeeHttpHeader('Content-Type', 'application/problem+json');
        $I->canSeeResponseIsJson();
        $I->canSeeResponseContainsJson(['type' => 'about:blank']);
        $I->canSeeResponseContains('detail');
        $I->canSeeResponseContains('not found');
    }
}
