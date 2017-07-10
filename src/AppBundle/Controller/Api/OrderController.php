<?php

namespace AppBundle\Controller\Api;

use AppBundle\Entity\Order;
use AppBundle\Form\OrderItemType;
use Symfony\Component\HttpFoundation\Request;
use Sensio\Bundle\FrameworkExtraBundle\Configuration\Method;
use Sensio\Bundle\FrameworkExtraBundle\Configuration\Route;
use AppBundle\Entity\OrderItem;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Generator\UrlGeneratorInterface;


/**
 * Order Hybrid controller.
 */
class OrderController extends ApiBaseController
{
    /**
     * @Route("/api/order", name="get_order_number")
     * @Method("GET")
     */
    public function getOrderAction(Request $request)
    {
        $order = $this->findOrderOrCartForUser($request);
        $orderNumber['orderNumber'] = $order->getOrderNumber();

        return $this->createApiResponse($orderNumber);
    }

    /**
     * @Route("/api/order/{orderNumber}", name="add_order_item")
     * @Method("POST")
     */
    public function addOrderItemAction(Order $order, Request $request)
    {
        $orderItem = new OrderItem();
        $form = $this->createForm(OrderItemType::class, $orderItem);
        $this->processForm($request, $form);
        $orderItem->setOrder($order);

        if (!$form->isValid()) {
            $this->throwApiProblemValidationException($form);
        }

        $em = $this->getDoctrine()->getManager();
        $em->persist($orderItem);
        $em->flush();

        $location = '/api/order/' . $this->generateUrl(
                'get_order_item',
                [
                    'orderNumber' => $order->getOrderNumber(),
                    'id' => $orderItem->getId()
                ],
                UrlGeneratorInterface::RELATIVE_PATH
            );

        $response = $this->createApiResponse($orderItem, 201);
        $response->headers->set('Location', $location);

        return $response;
    }

    /**
     * @Route("/api/order/{orderNumber}/{id}", name="get_order_item")
     * @Method("GET")
     */
    public function getOrderItemAction(OrderItem $orderItem)
    {
        return $this->createApiResponse($orderItem);
    }

    /**
     * @Route("/api/order/{orderNumber}", name="get_order_items")
     * @Method("GET")
     */
    public function listAllOrderItemsAction(Request $request)
    {
        $items = $this->getDoctrine()
            ->getRepository(OrderItem::class)
            ->findAll();

        $data = ['order_items' => $items];

        return $this->createApiResponse($data);
    }

    /**
     * @Route("/api/order/{orderNumber}/{id}", name="update_order_item")
     * @Method({"PUT", "PATCH"})
     */
    public function updateOrderItemAction(OrderItem $orderItem, Request $request)
    {
        //can only modify quantity for order items
        $form = $this->createForm(OrderItemType::class, $orderItem, [
            'is_edit' => true
        ]);
        $this->processForm($request, $form);

        if (!$form->isValid()) {
            $this->throwApiProblemValidationException($form);
        }

        $em = $this->getDoctrine()->getManager();
        $em->persist($orderItem);
        $em->flush();

        return $this->createApiResponse($orderItem);
    }

    /**
     * @Route("/api/order/{orderNumber}/{id}", name="delete_order_item")
     * @Method("DELETE")
     */
    public function deleteOrderItemAction($id)
    {
        $em = $this->getDoctrine()->getManager();
        $orderItem = $em->getRepository(OrderItem::class)
            ->findOneBy(['id' => $id]);

        if ($orderItem) {
            $em->remove($orderItem);
            $em->flush();
        }

        return new Response(null, 204);
    }
}
