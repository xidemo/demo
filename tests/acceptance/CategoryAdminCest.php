<?php
//use StepObject
use Step\Acceptance\Admin as AdminTester;

class CategoryAdminCest
{
    public function _before(AdminTester $I)
    {
        $I->loginAsAdmin();
    }

    public function _after(AdminTester $I)
    {
        $I->logoutAsAdmin();
    }

    public function CategoryCRUD(AdminTester $I)
    {
        $I->wantTo('perform category crud in admin');
        $I->amOnPage('/admin/dashboard');
        $I->waitForText('Product Management');

        //Access Category List
        $I->click($I->getListButton('Category'));
        $I->waitForText('Category List');
        $I->cantSee('Shiny Cat');

        //Create new category 'Shiny Cat'
        $I->click('Add new');
        $I->waitForText('Create and return to list');
        $I->fillField($I->getFormFieldByLabel('Category Name'), 'Shiny Cat');
        $I->click('Create and return to list');
        $I->waitForText('Shiny Cat');

        //Update 'Shiny Cat' to 'Shiny Dog'
        $I->click($I->getEditButton('Shiny Cat'));
        $I->waitForText('Edit "Shiny Cat"', 5);
        $I->canSeeInField($I->getFormFieldByLabel('Category Name'), 'Shiny Cat');
        $I->fillField($I->getFormFieldByLabel('Category Name'), 'Shiny Dog');
        $I->click('Update and close');
        $I->waitForText('Shiny Dog', 5);

        //Delete 'Shiny Dog'
        $I->click($I->getDeleteButton('Shiny Dog'));
        $I->waitForText('Confirm deletion', 5);
        $I->click(' Yes, delete');
        $I->waitForText('Item "Shiny Dog" has been deleted successfully.');
        $I->cantSee('Shiny Dog', '//table');
    }

}
