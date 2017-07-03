<?php

namespace AppBundle;

/**
 * Interface implemented by a salable product.
 *
 * Add extra fields to an existing product to be used by both web and apis
 * most of time set by default.
 */
interface SalableInterface
{
    /**
     * Get price
     */
    public function getPrice();

    /**
     * Set price
     */
    public function setPrice($price);

    /**
     * Get stock quantity
     */
    public function getStock();

    /**
     * Set stock quantity
     */
    public function setStock($stock);

    /**
     * Get dimension
     */
    public function getDimension();

    /**
     * Set dimension
     */
    public function setDimension($dimension);

    /**
     * Get upc
     */
    public function getUpc();

    /**
     * Set upc
     */
    public function setUpc($upc);
}
