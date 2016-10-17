<?php
//use StepObject
use Step\Acceptance\Admin as AdminTester;

class AdminCest
{
    public function _before(AdminTester $I)
    {
        $I->loginAsAdmin();
        $I->see('CM News:');
    }

    public function _after(AdminTester $I)
    {
        $I->logoutAsAdmin();
        $I->see('Acme CMS');
    }

    public function CategoryCRUD(AdminTester $I)
    {
        $I->wantTo('perform category crud in admin');
        $I->amOnPage('/admin/dashboard');
        $I->waitForText('Product Management');
        //Access Category List
        $I->click('.link_list','/html/body/div[1]/div/section[2]/div/div/div[1]/div/div[1]/div[2]/table/tbody/tr[1]');
        $I->waitForText('Category List');
        $I->cantSee('Shiny Cat');
        //Create new category 'Shiny Cat'
        $I->click('Add new');
        $I->waitForText('Create and return to list');
        $I->fillField('/html/body/div[1]/div/section[2]/div/form/div[1]/div/div/div/div/div[2]/div/div/div/input', 'Shiny Cat');
        $I->click('Create and return to list');
        $I->waitForText('Shiny Cat');
        //Update 'Shiny Cat' to 'Shiny Dog'
        $I->click('.edit_link','/html/body/div[1]/div/section[2]/div[3]/div/form/div/div[1]/table/tbody/tr[5]');
        $I->waitForText('Edit "Shiny Cat"');
        $I->canSeeInField('/html/body/div[1]/div/section[2]/div/form/div[1]/div/div/div/div/div[2]/div/div/div/input', 'Shiny Cat');
        $I->fillField('/html/body/div[1]/div/section[2]/div/form/div[1]/div/div/div/div/div[2]/div/div/div/input', 'Shiny Dog');
        $I->click('Update and close');
        $I->waitForText('Shiny Dog', 5);
        //Delete 'Shiny Dog'
        $I->click('.delete_link','/html/body/div[1]/div/section[2]/div[3]/div/form/div/div[1]/table/tbody/tr[5]');
        $I->waitForText('Confirm deletion', 5);
        $I->click(' Yes, delete');
        $I->waitForText('Item "Shiny Dog" has been deleted successfully.');
        $I->cantSee('Shiny Dog','/html/body/div[1]/div/section[2]/div[3]/div/form/div/div[1]/table');
    }
}
