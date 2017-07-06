<?php


/**
 * Inherited Methods
 * @method void wantToTest($text)
 * @method void wantTo($text)
 * @method void execute($callable)
 * @method void expectTo($prediction)
 * @method void expect($prediction)
 * @method void amGoingTo($argumentation)
 * @method void am($role)
 * @method void lookForwardTo($achieveValue)
 * @method void comment($description)
 * @method \Codeception\Lib\Friend haveFriend($name, $actorClass = NULL)
 *
 * @SuppressWarnings(PHPMD)
 */
class AcceptanceTester extends \Codeception\Actor
{
    use _generated\AcceptanceTesterActions;

    public function getListButton($name)
    {
        return '//td[normalize-space(text())="' . $name . '"]/following-sibling::td//a[contains(@class,"link_list")]';
    }

    public function getEditButton($name)
    {
        return '//td[a[normalize-space(text())="' . $name . '"]]/following-sibling::td//a[contains(@class,"edit_link")]';
    }

    public function getDeleteButton($name)
    {
        return '//td[a[normalize-space(text())="' . $name . '"]]/following-sibling::td//a[contains(@class,"delete_link")]';
    }

    public function getTabButtonByText($text)
    {
        return '//ul[@role="tablist"]//a[normalize-space(text())="' . $text . '"]';
    }

    public function getFormFieldByLabel($text)
    {
        return '//label[contains(text(), "' . $text . '")]/../div/*[1]';
    }

    public function clickCellLink($text)
    {
        $this->click('//td[a[contains(text(), "alice")]]/a');
    }

    public function getCheckBoxByValue($value)
    {
        return '//input[@value="' . $value . '"]/following-sibling::ins';
    }

}
