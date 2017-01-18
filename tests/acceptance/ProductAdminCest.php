<?php
//use StepObject
use Step\Acceptance\Admin as AdminTester;

class ProductAdminCest
{
    public function _before(AdminTester $I)
    {
        $I->loginAsSuperAdmin();
    }

    public function _after(AdminTester $I)
    {
//        $I->logout();
    }

    public function ProductCRUD(AdminTester $I)
    {
        $I->wantTo('perform product crud in admin');
        $I->amOnPage('/admin/dashboard');
        $I->waitForText('Product Management');

        //Access Product List
        $I->click($I->getListButton('Product'));
        $I->waitForText('Product List');
        $I->cantSee('Fancy Product');

        //Create new product 'Fancy Product'
        $I->click('Add new');
        $I->waitForText('Create and return to list');
        //fill the first tab
        $I->canSee('Product Information', '//form//h4');
        $I->fillField($I->getFormFieldByLabel('Product Name'), 'Fancy Product');
        $I->fillField($I->getFormFieldByLabel('Description'), 'This is such a good product that you want to purchase right away!');
        //click and fill the second tab
        $I->click($I->getTabButtonByText('Pricing & Stock'));
        $I->waitForText('Pricing & Stock', 3, '//div[contains(@class,"active")]//h4');
        $I->fillField($I->getFormFieldByLabel('Price'), '199.95');
        $I->fillField($I->getFormFieldByLabel('Stock'), '2000');
        //submit and validate the new entry
        $I->click('Create and return to list');
        $I->waitForText('Item "Fancy Product" has been successfully created.');
        $I->click('//a[@title="Last"]');
        $I->waitForElement('//a[text()="Fancy Product"]');

        //Update 'Fancy Product' to 'Great Product'
        $I->click($I->getEditButton('Fancy Product'));
        $I->waitForText('Edit "Fancy Product"', 5);
        $I->canSeeInField($I->getFormFieldByLabel('Product Name'), 'Fancy Product');
        $I->fillField($I->getFormFieldByLabel('Product Name'), 'Great Product');
        $I->click('Update and close');
        $I->waitForText('Item "Great Product" has been successfully updated.');
        $I->click('//a[@title="Last"]');
        $I->waitForElement('//a[text()="Great Product"]');

        //Delete 'Shiny Dog'
        $I->click($I->getDeleteButton('Great Product'));
        $I->waitForText('Confirm deletion', 5);
        $I->click(' Yes, delete');
        $I->waitForText('Item "Great Product" has been deleted successfully.');
//        $I->click('//a[@title="Last"]');
//        $I->cantSee('Great Product', '//table');
    }

}
