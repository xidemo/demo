<?php

namespace AppBundle\Controller;

use FOS\RestBundle\Controller\Annotations as Rest;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Bundle\FrameworkBundle\Controller\Controller;
use Sensio\Bundle\FrameworkExtraBundle\Configuration\Method;
use Sensio\Bundle\FrameworkExtraBundle\Configuration\Route;
use AppBundle\Entity\Product;
use AppBundle\Form\ProductType;

/**
 * Product controller.
 *
 * @Route("/product")
 */
class ProductController extends Controller
{
    /**
     * @Rest\Route("/", name="product_list")
     * @Method("GET")
     *
     * @param Request $request
     * @return \Symfony\Component\HttpFoundation\Response
     */
    public function listAction(Request $request)
    {
        $query = $this->getDoctrine()
            ->getRepository('AppBundle:Product')
            ->findAllProductsQuery()
        ;

        $itemsPerPage = $request->get('items') ? $request->query->get('items') : 40;
        $paginator = $this->get('knp_paginator');
        $pagination = $paginator->paginate(
            $query,
            $request->query->getInt('page', 1)/*page number*/,
            $itemsPerPage
        );

        return $this->render('product/list.html.twig', array(
            'pagination' => $pagination
        ));
    }

    /**
     * @Route("/search", name="product_search")
     * @Method("GET")
     *
     * @param Request $request
     * @return \Symfony\Component\HttpFoundation\Response
     */
    public function searchAction(Request $request)
    {
        $keyword = $request->query->get('keyword');
        $query = $this->getDoctrine()
            ->getRepository('AppBundle:Product')
            ->findProductsByKeywordQuery($keyword);
        ;

        $paginator = $this->get('knp_paginator');
        $pagination = $paginator->paginate(
            $query,
            $request->query->getInt('page', 1)/*page number*/,
            20
        );

        return $this->render('product/search.html.twig', array(
            'pagination' => $pagination
        ));
    }

    /**
     * @Route("/{slug}", name="product_show")
     * @Method("GET")
     *
     * @param Product $product
     * @return \Symfony\Component\HttpFoundation\Response
     */
    public function showAction(Product $product)
    {
        return $this->render('product/show.html.twig', array(
            'product' => $product,
        ));
    }


}
