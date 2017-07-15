<?php

namespace AppBundle\Controller\Api;

use AppBundle\Entity\Order;
use AppBundle\Form\OrderItemType;
use Pagerfanta\Adapter\DoctrineORMAdapter;
use Pagerfanta\Pagerfanta;
use Sensio\Bundle\FrameworkExtraBundle\Configuration\Security;
use Symfony\Component\HttpFoundation\Request;
use Sensio\Bundle\FrameworkExtraBundle\Configuration\Method;
use Sensio\Bundle\FrameworkExtraBundle\Configuration\Route;
use AppBundle\Entity\OrderItem;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Generator\UrlGeneratorInterface;


/**
 * @Security("is_granted('ROLE_USER')")
 */
class OrderController extends ApiBaseController
{
    /**
     * @Route("/api/orders/new", name="new_order")
     * @Method("GET")
     */
    public function newOrderAction(Request $request)
    {
        $order = new Order();
        //pseudo session name with random unique string for generating order number in api
        $order->setSession($this->getOrderSession());
        $order->setOrderNumber(strtoupper($order->getSession()));
        $order->setUser($this->getUser());

        $em = $this->getDoctrine()->getManager();
        $em->persist($order);
        $em->flush();

        return $this->createApiResponse($order);
    }

    /**
     * @Route("/api/orders/mine", name="get_order_collection_for_user")
     * @Method("GET")
     */
    public function getOrderCollectionForUserAction(Request $request)
    {
        $data = $this->getDoctrine()
            ->getRepository(Order::class)
            ->findBy(['user' => $this->getUser()]);

        $response = $this->createApiResponse($data);

        return $response;
    }
}
