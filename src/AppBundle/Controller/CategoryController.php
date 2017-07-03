<?php

namespace AppBundle\Controller;


use AppBundle\Repository\CategoryRepository;
use Symfony\Bundle\FrameworkBundle\Controller\Controller;
use Sensio\Bundle\FrameworkExtraBundle\Configuration\Method;
use Sensio\Bundle\FrameworkExtraBundle\Configuration\Route;
use AppBundle\Entity\Category;
use Symfony\Component\HttpFoundation\Request;

/**
 * Category controller.
 *
 * @Route("/category")
 */
class CategoryController extends Controller
{
    /**
     * @Route("/", name="category_list")
     * @Method("GET")
     */
    public function listAction()
    {
        $em = $this->getDoctrine()->getManager();

        $categories = $em->getRepository('AppBundle:Category')->findAll();

        return $this->render('category/list.html.twig', array(
            'categories' => $categories,
        ));
    }

    /**
     * @Route("/{slug}", name="category_show")
     * @Method("GET")
     */
    public function showAction(Category $category, Request $request)
    {
        $query = $this->getDoctrine()
            ->getRepository('AppBundle:Product')
            ->findAllProductsByCategoryQuery($category)
        ;

        $itemsPerPage = $request->get('items') ? $request->query->get('items') : 40;
        $paginator = $this->get('knp_paginator');
        $pagination = $paginator->paginate(
            $query,
            $request->query->getInt('page', 1)/*page number*/,
            $itemsPerPage
        );

        return $this->render('category/show.html.twig', array(
            'category' => $category,
            'pagination' => $pagination
        ));
    }
}
