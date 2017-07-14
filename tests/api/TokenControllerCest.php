<?php

class TokenControllerCest
{
    private $authPayLoad = '{"user": "tom", "pass": "tom"}';
    private $authInvalidPayLoad = '{"user": "lucy", "pass": "lucy123"}';
    private $token;

    public function _before(ApiTester $I)
    {
    }

    public function postCreateTokenTest(ApiTester $I)
    {
        $I->sendPOST('/api/token', $this->authPayLoad);

        $I->canSeeResponseCodeIs(\Codeception\Util\HttpCode::OK);
        $I->canSeeResponseJsonMatchesJsonPath('$.token');
    }

    public function postCreateTokenWithInvalidCredentialsTest(ApiTester $I)
    {
        $I->sendPOST('/api/token', $this->authInvalidPayLoad);

        $I->canSeeResponseCodeIs(\Codeception\Util\HttpCode::UNAUTHORIZED);
        $I->canSeeResponseIsJson();
        $I->canSeeResponseContains('Token not found');
    }
}
