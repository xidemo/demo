<?php

namespace AppBundle\Entity;

use Doctrine\Common\Collections\ArrayCollection;

interface OrderInterface
{
    const STATE_CART = 'cart';
    const STATE_NEW = 'new';
    const STATE_CANCELLED = 'cancelled';
    const STATE_COMPLETED = 'completed';
    const ADJUSTMENT_DISTRIBUTOR = 'distributor';
    const ADJUSTMENT_DISCOUNT = 'discount';

    /**
     * @return string
     */
    public function getOrderNumber();

    /**
     * @param string
     */
    public function setOrderNumber($number);

    /**
     * @return \DateTime
     */
    public function getPlacedAt();

    /**
     * @param null|\DateTime $placedAt
     */
    public function setPlacedAt(\DateTime $placedAt = null);

    /**
     * @return string
     */
    public function getNote();

    /**
     * @param string $note
     */
    public function setNote($note);

    /**
     * @return ArrayCollection|OrderItem[]
     */
    public function getItems();

    /**
     * @param OrderItem $item
     */
    public function addItem(OrderItem $item);

    /**
     * @param OrderItem $item
     */
    public function removeItem(OrderItem $item);

    public function clearItems();

    /**
     * @return int
     */
    public function countItems();

    /**
     * @param OrderItem $item
     *
     * @return bool
     */
    public function hasItem(OrderItem $item);

    /**
     * @return int
     */
    public function getTotalPrice();

    /**
     * @return int
     */
    public function getTotalQuantity();

    /**
     * @return string
     */
    public function getState();

    /**
     * @param string $state
     */
    public function setState($state);

    /**
     * @return bool
     */
    public function isEmpty();

    /**
     * @param string|null $type
     *
     * @return array
     */
    public function calculateAdjustments($type = null);
}