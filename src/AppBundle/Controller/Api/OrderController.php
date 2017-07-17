<?php

namespace AppBundle\Controller\Api;

use AppBundle\Entity\Order;
use Sensio\Bundle\FrameworkExtraBundle\Configuration\Security;
use Symfony\Component\HttpFoundation\Request;
use Sensio\Bundle\FrameworkExtraBundle\Configuration\Method;
use Sensio\Bundle\FrameworkExtraBundle\Configuration\Route;
use Nelmio\ApiDocBundle\Annotation\ApiDoc;


/**
 * @Security("is_granted('ROLE_USER')")
 */
class OrderController extends ApiBaseController
{
    /**
     * @ApiDoc(
     *      resource=true,
     *      section="Order",
     *      description="Create a new Order for authenticated user",
     *      https= true,
     *      headers={
     *         {
     *             "name"="Authorization",
     *             "description"="JWT Authorization key",
     *             "required"="true"
     *         }
     *      },
     *      output="AppBundle\Entity\Order",
     *      statusCodes={
     *          200="Returned when successful",
     *          401="Returned when fail authentication"
     *      }
     * )
     *
     * @Route("/api/orders/new", name="new_order")
     * @Method("POST")
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
     * @ApiDoc(
     *      resource=true,
     *      section="Order",
     *      description="get Order Collection for authenticated user",
     *      https= true,
     *      headers={
     *         {
     *             "name"="Authorization",
     *             "description"="JWT Authorization key",
     *             "required"="true"
     *         }
     *      },
     *      output="AppBundle\Entity\Order",
     *      statusCodes={
     *          200="Returned when successful",
     *          401="Returned when fail authentication",
     *          404="Returned when no orders found for this user"
     *      }
     * )
     *
     * @Route("/api/orders/mine", name="get_order_collection_for_user")
     * @Method("GET")
     */
    public function getOrderCollectionForUserAction(Request $request)
    {
        $data = $this->getDoctrine()
            ->getRepository(Order::class)
            ->findBy(['user' => $this->getUser()]);

        if (!$data) {
            throw $this->createNotFoundException('no order found for this user');
        }

        $response = $this->createApiResponse($data);

        return $response;
    }
}
