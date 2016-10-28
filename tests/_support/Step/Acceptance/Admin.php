<?php
namespace Step\Acceptance;

class Admin extends \AcceptanceTester
{
    const ADMIN_WELCOME_MESSAGE = 'Manages all web content and projects related to the website';

    public function loginAsSuperAdmin()
    {
        $I = $this;
        // logging in
        $I->amOnPage('/admin/login');
        $I->fillField('#username', 'ryan');
        $I->fillField('#password', 'ryan');
        $I->click('Log in');
        $I->waitForText(self::ADMIN_WELCOME_MESSAGE);
    }

    public function loginAsContentAdmin()
    {
        $I = $this;
        // logging in
        $I->amOnPage('/admin/login');
        $I->fillField('#username', 'alice');
        $I->fillField('#password', 'alice');
        $I->click('Log in');
        $I->waitForText(self::ADMIN_WELCOME_MESSAGE);
    }

    public function loginAsContentStaff()
    {
        $I = $this;
        // logging in
        $I->amOnPage('/admin/login');
        $I->fillField('#username', 'lili');
        $I->fillField('#password', 'lili');
        $I->click('Log in');
        $I->waitForText(self::ADMIN_WELCOME_MESSAGE);
    }

    public function tryLoginAsUser()
    {
        $I = $this;
        // logging in
        $I->amOnPage('/admin/login');
        $I->fillField('#username', 'tom');
        $I->fillField('#password', 'tom');
        $I->click('Log in');
    }

    public function logout()
    {
        $I = $this;
        // logging out
        $I->click('//li[contains(@class,"user-menu")]/a');
        $I->click('//li[contains(@class,"user-menu")]//a[contains(text(),"Logout")]');
        $I->waitForText('CMS');
    }

}

