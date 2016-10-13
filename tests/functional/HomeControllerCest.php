<?php


class HomeControllerCest
{
    public function _before(FunctionalTester $I)
    {
    }

    public function _after(FunctionalTester $I)
    {
    }

    public function indexPage(FunctionalTester $I)
    {
        $I->wantTo('to see all the require elements on home page');
        $I->amOnPage('/');
        $I->see('Welcome');
        $I->canSeeLink('Products');
        $I->canSee('360-595-6502');
        $I->canSee('Our Mission');
        $I->canSee('We Provide');
        $I->canSee('Latest news');
    }
}