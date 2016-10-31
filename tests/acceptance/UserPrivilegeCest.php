<?php
//use StepObject
use Step\Acceptance\Admin as AdminTester;

class UserPrivilegeCest
{
    public function _before(AdminTester $I)
    {
    }

    public function _after(AdminTester $I)
    {
    }

    public function userPrivilege(AdminTester $I)
    {
        $I->wantToTest("normal user can't access the admin area.");
        $I->tryLoginAsUser();
        $I->waitForText('Access denied');
    }

    public function contentStaffPrivilege(AdminTester $I)
    {
        $I->wantToTest('a content staff can view and edit, but not delete.');
        $I->loginAsContentStaff();
        $I->click($I->getListButton('Category'));
        $I->waitForText('Category List');

        $I->canSeeElement('//a[@title="Show"]');
        $I->canSeeElement('//a[@title="Edit"]');
        $I->cantSeeElement('//a[@title="Delete"]');
    }

    public function contentAdminPrivilege(AdminTester $I)
    {
        $I->wantToTest('a content admin can perform all actions.');
        $I->loginAsContentAdmin();
        $I->click($I->getListButton('Category'));
        $I->waitForText('Category List');

        $I->canSeeElement('//a[@title="Show"]');
        $I->canSeeElement('//a[@title="Edit"]');
        $I->canSeeElement('//a[@title="Delete"]');
    }

    public function superAdminPrivilege(AdminTester $I)
    {
        $I->loginAsSuperAdmin();

        $I->wantToTest("super admin can modified other people's privileges.");
        $I->click($I->getListButton('Users'));
        $I->waitForText('Impersonate User');
        $I->clickCellLink('alice');
        $I->waitForText('Edit "alice"');
        $I->click($I->getTabButtonByText('Security'));
        $I->waitForText('Roles');
        $I->checkOption($I->getCheckBoxByValue('ROLE_APP_ADMIN_CATEGORY_ADMIN'));
        //then scroll down to see the other checkbox (or it wont be selected)
        $I->executeJS('window.scrollTo(0,500);');
        $I->checkOption($I->getCheckBoxByValue('ROLE_APP_ADMIN_PRODUCT_ADMIN'));
        $I->click('Update and close');
        $I->waitForText('Item "alice" has been successfully updated.');
    }

}
