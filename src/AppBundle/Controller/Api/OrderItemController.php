<?php

namespace AppBundle\Controller\Api;

use AppBundle\Entity\Order;
use AppBundle\Form\OrderItemType;
use Nelmio\ApiDocBundle\Annotation\ApiDoc;
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
class OrderItemController extends ApiBaseController
{
    /**
     * @ApiDoc(
     *      resource=true,
     *      section="Order Item",
     *      description="Add an Order Item",
     *      https= true,
     *      headers={
     *         {
     *             "name"="Authorization",
     *             "description"="JWT Authorization key",
     *             "required"="true"
     *         }
     *      },
     *      input="AppBundle\Entity\OrderItem",
     *      parameters={
     *          {"name"="product", "dataType"="integer", "required"=true, "description"="product id"},
     *          {"name"="quantity", "dataType"="integer", "required"=true, "description"="product quantity"},
     *      },
     *      output="AppBundle\Entity\OrderItem",
     *      statusCodes={
     *          200="Returned when successful",
     *          401="Returned when fail authentication",
     *          400="Returned when request body is invalid"
     *      }
     * )
     *
     * @Route("/api/orders/mine/{orderNumber}", name="new_order_item")
     * @Method("POST")
     */
    public function newOrderItemAction(Order $order, Request $request)
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

        $location = '/api/orders/mine/' . $this->generateUrl(
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
     * @ApiDoc(
     *      resource=true,
     *      section="Order Item",
     *      description="Returns an Order Item",
     *      https= true,
     *      headers={
     *         {
     *             "name"="Authorization",
     *             "description"="JWT Authorization key",
     *             "required"="true"
     *         }
     *      },
     *      output="AppBundle\Entity\OrderItem",
     *      statusCodes={
     *          200="Returned when successful",
     *          401="Returned when fail authentication",
     *          404="Returned when no order item found"
     *      }
     * )
     *
     * @Route("/api/orders/mine/{orderNumber}/{id}", name="get_order_item")
     * @Method("GET")
     */
    public function getOrderItemAction(OrderItem $orderItem)
    {
        return $this->createApiResponse($orderItem);
    }

    /**
     * @ApiDoc(
     *      resource=true,
     *      section="Order Item",
     *      description="Returns Order Item Collection",
     *      https= true,
     *      headers={
     *         {
     *             "name"="Authorization",
     *             "description"="JWT Authorization key",
     *             "required"="true"
     *         }
     *      },
     *      requirements={
     *          {"name"="page", "dataType"="integer", "required"=true, "description"="current page"},
     *      },
     *      filters={
     *          {"name"="maxstock", "dataType"="integer"},
     *      },
     *      statusCodes={
     *          200="Returned when successful",
     *          401="Returned when fail authentication",
     *          404="Returned when no order item found"
     *      }
     * )
     *
     * @Route("/api/orders/mine/{orderNumber}", name="get_order_item_collection")
     * @Method("GET")
     */
    public function listAllOrderItemsAction(Request $request)
    {
        $page = $request->query->get('page', 1);
        $filter = $request->query->get('maxstock');

        $qb = $this->getDoctrine()
            ->getRepository(OrderItem::class)
            ->findAllWithFilterQueryBuilder($filter);

        $route = 'get_order_item_collection';
        $routeParam = ['orderNumber' => $request->attributes->get('orderNumber')];
        $paginatedCollection = $this->get('app.pagination_factory')->createCollection($qb, $request, $route, $routeParam);

        $response = $this->createApiResponse($paginatedCollection);

        return $response;
    }

    /**
     * @ApiDoc(
     *      resource=true,
     *      section="Order Item",
     *      description="Update an Order Item",
     *      https= true,
     *      headers={
     *         {
     *             "name"="Authorization",
     *             "description"="JWT Authorization key",
     *             "required"="true"
     *         }
     *      },
     *      output="AppBundle\Entity\OrderItem",
     *      statusCodes={
     *          200="Returned when successful",
     *          401="Returned when fail authentication",
     *          404="Returned when no order item found"
     *      }
     * )
     *
     * @Route("/api/orders/mine/{orderNumber}/{id}", name="update_order_item")
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
     * @ApiDoc(
     *      resource=true,
     *      section="Order Item",
     *      description="Delete an Order Item",
     *      https= true,
     *      headers={
     *         {
     *             "name"="Authorization",
     *             "description"="JWT Authorization key",
     *             "required"="true"
     *         }
     *      },
     *      statusCodes={
     *          200="Returned when successful",
     *          401="Returned when fail authentication",
     *          404="Returned when no order item found"
     *      }
     * )
     *
     * @Route("/api/orders/mine/{orderNumber}/{id}", name="delete_order_item")
     * @Method("DELETE")
     */
    public function deleteOrderItemAction($id, Request $request)
    {
        $em = $this->getDoctrine()->getManager();

        $order = $em->getRepository(Order::class)
            ->findOneBy(['orderNumber' => $request->attributes->get('orderNumber')]);

        if (!$order) {
            $this->createNotFoundException('order not found');
        }

        $orderItem = $em->getRepository(OrderItem::class)
            ->findOneBy(['id' => $id]);

        if ($orderItem) {
            $em->remove($orderItem);
            $em->flush();
        }

        return new Response(null, 204);
    }
}
