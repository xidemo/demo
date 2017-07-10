<?php

class CartControllerCest
{
    private $itemId;
    private $location;
    private $payload = '{"session": 123456, "order":1, "product":2, "quantity": 10}';

    public function _before(ApiTester $I)
    {
    }

    public function _after(ApiTester $I)
    {
    }

    // add item to cart
    public function addCartItemTest(ApiTester $I)
    {
        $I->wantTo('add an item to the cart');
        $I->haveHttpHeader('Content-Type', 'application/json');
        $I->haveHttpHeader('Accept', 'application/json');
        $I->sendPOST('/api/cart', $this->payload);
        $I->seeResponseCodeIs(\Codeception\Util\HttpCode::CREATED);
        $I->canSeeHttpHeader('Content-Type', 'application/json');
        $I->canSeeHttpHeader('Location', '/api/cart/1');
        $I->canSeeResponseContainsJson([
            'order_id' => 1,
            'product_id' => 2,
            'quantity' => 10
        ]);

        $this->location = $I->grabHttpHeader('Location');
    }

    // get an item in cart
    public function getCartItemTest(ApiTester $I)
    {
        $I->wantTo('get an item from the cart');
        $I->sendGET($this->location);
        $I->seeResponseCodeIs(\Codeception\Util\HttpCode::OK);
        $I->canSeeHttpHeader('Content-Type', 'application/json');
        $I->canSeeResponseContainsJson([
            'order_id' => 1,
            'product_id' => 2,
            'quantity' => 10
        ]);

    }

    //get all items in cart
    public function getAllCartItemsTest(ApiTester $I)
    {
        $I->wantTo('list all items in the cart');
        $I->sendGET('/api/cart');
        $I->seeResponseCodeIs(\Codeception\Util\HttpCode::OK);
        $I->canSeeHttpHeader('Content-Type', 'application/json');
        $I->canSeeResponseContainsJson([
            'cart_items' => [
                'order_id' => 1,
                'product_id' => 2,
                'quantity' => 10
            ]
        ]);
    }
}
