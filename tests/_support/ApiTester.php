<?php


/**
 * Inherited Methods
 * @method void wantToTest($text)
 * @method void wantTo($text)
 * @method void execute($callable)
 * @method void expectTo($prediction)
 * @method void expect($prediction)
 * @method void amGoingTo($argumentation)
 * @method void am($role)
 * @method void lookForwardTo($achieveValue)
 * @method void comment($description)
 * @method \Codeception\Lib\Friend haveFriend($name, $actorClass = NULL)
 *
 * @SuppressWarnings(PHPMD)
 */
class ApiTester extends \Codeception\Actor
{
    use _generated\ApiTesterActions;

    public function createNewOrder()
    {
        $this->sendPOST('/api/orders/new');
        $response = json_decode($this->grabResponse(), true);

        return $response['orderNumber'];
    }


    public function grabTokenForUser($user, $pass)
    {
        $userPayLoad = sprintf('{"user": "%s", "pass": "%s"}', $user, $pass);
        $this->sendPOST('/api/token', $userPayLoad);
        $response = json_decode($this->grabResponse(), true);

        return $response['token'];
    }

    public function loadBaseValue()
    {
        //dummy order
        $this->haveInDatabase('app_order', [
            'id' => 1234,
            'user_id' => 2,
            'order_number' => 1234,
            'session' => 1234,
            'placed_at' => '2017-07-01 00:00:00',
            'note' => 'super dummy order',
            'state' => \AppBundle\Entity\Order::STATE_COMPLETED
        ]);
        //dumy order items
        for ($i = 1; $i <= 20; $i++) {
            $this->haveInDatabase('app_order_item', [
                'id' => $i,
                'order_id' => 1,
                'product_id' => $i,
                'quantity' => $i
            ]);
        }
    }
}
