<?php


class UtilsTest extends \Codeception\Test\Unit
{
    /**
     * @var \UnitTester
     */
    protected $tester;

    protected function _before()
    {
    }

    protected function _after()
    {
    }

    /**
     * @dataProvider getSlugs
     */
    public function testSlugify($string, $expected)
    {
        $utils = new \AppBundle\Utils\Utils();
        $result = $utils->slugify($string);

        $this->assertEquals($expected, $result);
    }

    public function getSlugs()
    {
        return array(
            array('Lorem Ipsum'     , 'lorem-ipsum'),
            array('  Lorem Ipsum  ' , 'lorem-ipsum'),
            array(' lOrEm  iPsUm  ' , 'lorem-ipsum'),
            array('!@Lorem Ipsum!'   , 'lorem-ipsum'),
            array('lorem-ipsum'     , 'lorem-ipsum'),
        );
    }
}