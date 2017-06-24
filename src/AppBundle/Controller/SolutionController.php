<?php

namespace AppBundle\Controller;


use Symfony\Bundle\FrameworkBundle\Controller\Controller;
use Sensio\Bundle\FrameworkExtraBundle\Configuration\Method;
use Sensio\Bundle\FrameworkExtraBundle\Configuration\Route;
use AppBundle\Entity\Solution;

/**
 * Solution controller.
 *
 * @Route("/solution")
 */
class SolutionController extends Controller
{
    /**
     * Lists all Solution entities.
     *
     * @Route("/", name="solution_list")
     * @Method("GET")
     */
    public function listAction()
    {
        $em = $this->getDoctrine()->getManager();

        $solutions = $em->getRepository('AppBundle:Solution')->findAll();

        return $this->render(':solution:list.html.twig', array(
            'solutions' => $solutions,
        ));
    }

    /**
     * Finds and displays a Solution entity.
     *
     * @Route("/{slug}", name="solution_show")
     * @Method("GET")
     */
    public function showAction(Solution $solution)
    {

        return $this->render(':solution:show.html.twig', array(
            'solution' => $solution,
        ));
    }
}
