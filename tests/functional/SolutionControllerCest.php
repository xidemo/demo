<?php


class SolutionControllerCest
{
    public function _before(FunctionalTester $I)
    {
    }

    public function _after(FunctionalTester $I)
    {
    }

    public function solutionLandingSmoke(FunctionalTester $I)
    {
        $I->wantTo('to see all the required elements on solution landing page');
        $I->amOnPage('/solution');
        $I->see('Our Solutions', 'h1');
        $I->canSeeLink('Industrial', '/solution/industrial');
        $I->canSeeLink('Cinema');
        $I->canSeeLink('Agriculture');
        $I->canSeeLink('Data Center');
        $I->seeElement('nav.browser-menu');
    }

    public function solutionsWalkThrough(FunctionalTester $I)
    {
        $I->wantTo('to walk through basic solution navigation');
        $I->amOnPage('/solution');
        $I->canSeeLink('Industrial');
        $I->click('Industrial');
        $I->see('Description');
        $I->see('Related Products');
    }
}