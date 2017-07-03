<?php


class ProductControllerCest
{
    public function _before(FunctionalTester $I)
    {
    }

    public function _after(FunctionalTester $I)
    {
    }

    public function ProductLandingSmoke(FunctionalTester $I)
    {
        $I->wantTo('to see all the required elements on Product landing page');
        $I->amOnPage('/product');
        $I->see('All Products', 'h1');
        $I->canSeeLink('Industrial', '/solution/industrial');
        $I->canSeeLink('Cinema');
        $I->canSeeLink('Agriculture');
        $I->canSeeLink('Data Center');
        $I->seeElement('nav.browser-menu');
        //default 40 products displayed
        $I->canSeeNumberOfElements('.display-item', 40);
    }
}