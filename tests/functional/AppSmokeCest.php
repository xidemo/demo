<?php


class AppSmokeCest
{
    private $appName;

    public function _before(FunctionalTester $I)
    {
        //set app name variable
        $this->appName = 'Acme';
    }

    public function _after(FunctionalTester $I)
    {
    }

    public function endpointsTest(FunctionalTester $I)
    {
        $I->wantTo('ensure all app endpoints are working');
        //homepage
        $I->amOnRoute('homepage');
        $I->canSeeResponseCodeIs(\Codeception\Util\HttpCode::OK);
        $I->canSee('Welcome to ' . $this->appName);
        //category
        $I->amOnRoute('category_list');
        $I->canSeeResponseCodeIs(\Codeception\Util\HttpCode::OK);
        $I->amOnRoute('category_show', ['slug' => 'fake-category']);
        $I->canSeeResponseCodeIs(\Codeception\Util\HttpCode::NOT_FOUND);
        //product
        $I->amOnRoute('product_show', ['slug' => 'fake-product']);
        $I->canSeeResponseCodeIs(\Codeception\Util\HttpCode::NOT_FOUND);
        //fos_user
//        $I->amOnPage('/register');
//        $I->canSeeResponseCodeIs(\Codeception\Util\HttpCode::OK);
    }
}
