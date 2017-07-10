<?php

namespace AppBundle\Controller\Api;

use AppBundle\Api\ApiProblem;
use AppBundle\Api\ApiProblemException;
use AppBundle\Entity\Order;
use JMS\Serializer\SerializationContext;
use Symfony\Bundle\FrameworkBundle\Controller\Controller;
use Symfony\Component\Form\FormInterface;
use Symfony\Component\HttpFoundation\JsonResponse;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\HttpFoundation\Session\Session;
use Symfony\Component\HttpKernel\Exception\BadRequestHttpException;

class ApiBaseController extends Controller
{
    protected function throwApiProblemValidationException(FormInterface $form)
    {
        $errors = $this->getErrorsFromForm($form);

        $apiProblem = new ApiProblem(400, ApiProblem::TYPE_VALIDATION_ERROR);
        $apiProblem->set('errors', $errors);

        throw new ApiProblemException($apiProblem);
    }

    protected function createApiResponse($data, $statusCode = 200, $contentType = 'application/json')
    {
        $json = $this->serialize($data);

        return new Response($json, $statusCode, ['Content-Type' => $contentType]);
    }

    protected function processForm(Request $request, FormInterface $form)
    {
        $body = $request->getContent();
        $data = json_decode($body, true);

        if (!$data) {
            $apiProblem = new ApiProblem(400, ApiProblem::TYPE_INVALID_REQUEST_BODY_FORMAT);

            throw new ApiProblemException($apiProblem);
        }

        $form->submit($data);
    }

    protected function getErrorsFromForm(FormInterface $form)
    {
        $errors = array();
        foreach ($form->getErrors() as $error) {
            $errors[] = $error->getMessage();
        }
        foreach ($form->all() as $childForm) {
            if ($childForm instanceof FormInterface) {
                if ($childErrors = $this->getErrorsFromForm($childForm)) {
                    $errors[$childForm->getName()] = $childErrors;
                }
            }
        }

        return $errors;
    }

    protected function findOrderOrCartForUser(Request $request)
    {
        if ($request->getSession()->getId()) {
            $sid = $request->getSession()->getId();
        } else {
            $session = new Session();
            $session->start();
            $sid = $session->getId();
        }

        return $this->getOrderOrCartBySessionOrNew($sid);
    }

    protected function getOrderOrCartBySessionOrNew($sid)
    {
        $order = $this->getDoctrine()->getRepository('AppBundle:Order')->findOneBy(['session' => $sid]);
        if (!$order || $order->getState() === ORDER::STATE_COMPLETED) {
            $order = new Order();
            $order->setSession($sid);
            //TODO fix fake auth & idempotency
            $user = $this->get('sonata.user.manager.user')->findOneBy(['username' => 'ryan']);
            $order->setUser($user);

            $em = $this->getDoctrine()->getManager();
            $em->persist($order);
            $em->flush();
        }

        return $order;
    }

    protected function serialize($data)
    {
        $context = new SerializationContext();
        $context->setSerializeNull(true);
        $context->enableMaxDepthChecks();

        $serializer = $this->container->get('jms_serializer');

        return $serializer->serialize($data, 'json', $context);
    }
}