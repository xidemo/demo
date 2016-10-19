<?php
namespace Step\Acceptance;

class Admin extends \AcceptanceTester
{
    public function loginAsAdmin()
    {
        $I = $this;
        // logging in
        $I->amOnPage('/admin/login');
        $I->fillField('#username', 'admin');
        $I->fillField('#password', 'admin');
        $I->click('Log in');
        $I->waitForText('Manages all web content and projects related to the website');
    }

    public function logoutAsAdmin()
    {
        $I = $this;
        // logging out
        $I->click('body > div > header > nav > div.navbar-custom-menu > ul > li.dropdown.user-menu > a');
        $I->click('body > div > header > nav > div.navbar-custom-menu > ul > li.dropdown.user-menu.open > ul > li.user-footer > div.pull-right > a');
        $I->waitForText('CMS');
    }

}

