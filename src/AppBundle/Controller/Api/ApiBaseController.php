<?php

namespace AppBundle\Controller\Api;

use AppBundle\Api\ApiProblem;
use AppBundle\Api\ApiProblemException;
use Application\Sonata\UserBundle\Entity\User;
use JMS\Serializer\SerializationContext;
use Symfony\Bundle\FrameworkBundle\Controller\Controller;
use Symfony\Component\Form\FormInterface;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Security\Core\Exception\BadCredentialsException;

class ApiBaseController extends Controller
{
    protected function throwApiProblemValidationException(FormInterface $form)
    {
        $errors = $this->getErrorsFromForm($form);

        $apiProblem = new ApiProblem(400, ApiProblem::TYPE_VALIDATION_ERROR);
        $apiProblem->set('errors', $errors);

        throw new ApiProblemException($apiProblem);
    }

    protected function createApiResponse($data, $statusCode = 200, $contentType = 'application/hal+json')
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

    protected function serialize($data)
    {
        $context = new SerializationContext();
        $context->setSerializeNull(true);
        $context->enableMaxDepthChecks();

        $serializer = $this->container->get('jms_serializer');

        return $serializer->serialize($data, 'json', $context);
    }

    protected function decodeUser(Request $request)
    {
        $string = trim(substr($request->headers->get('Authorization'), 6));

        if (!$string) {
            throw new BadCredentialsException('how did you end up in here??!!');
        }

        $data = $this->get('lexik_jwt_authentication.encoder')->decode($string);

        if (!$data) {
            throw new BadCredentialsException('it is all just about the bad token given!');
        }

        //not checking for email as this is a demo only and no ssl used
        $user = $this->getDoctrine()->getRepository(User::class)
                ->findOneBy(['username' => $data['username']]);

        if (!$user) {
            throw new BadCredentialsException('no user found');
        }

        return $user;
    }

    //name holder for random unique string for generating order number in api
    protected function getOrderSession()
    {
        return str_replace(str_split('\\/:*?"<>|=+'), random_int(1, 9), base64_encode(random_bytes(8)));
    }
}