<?php

namespace AppBundle\Twig;

use Knp\Menu\ItemInterface;
use Knp\Menu\Matcher\MatcherInterface;
use Knp\Menu\Twig\Helper;

/**
 * Class AppExtension
 * @package AppBundle\Twig
 */
class AppExtension extends \Twig_Extension
{
    private $helper;

    private $matcher;

    public function __construct(Helper $helper, MatcherInterface $matcher)
    {
        $this->helper = $helper;
        $this->matcher = $matcher;
    }

    public function getFunctions()
    {
        return [
            new \Twig_SimpleFunction('get_current_menu_items', function ($menu, array $path = array(), array $options = array()) {
                $menu = $this->helper->get($menu, $path, $options);
                return $this->getCurrentItems($menu);
            }),
        ];
    }

    private function getCurrentItems(ItemInterface $item)
    {
        $items = [];
        $getActiveItems = function (ItemInterface $item) use (&$getActiveItems, &$items) {
            if ($this->matcher->isCurrent($item)) {
                $items[] = $item;
                foreach ($item->getChildren() as $child) {
                    $getActiveItems($child);
                }
            }
        };
        $getActiveItems($item);

        return $items;
    }

    public function getName()
    {
        return 'knp_menu_extension';
    }
}