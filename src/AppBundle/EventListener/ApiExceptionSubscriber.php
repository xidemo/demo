<?php

namespace AppBundle\EventListener;

use AppBundle\Api\ApiProblem;
use AppBundle\Api\ApiProblemException;
use Monolog\Logger;
use Symfony\Component\EventDispatcher\EventSubscriberInterface;
use Symfony\Component\HttpFoundation\JsonResponse;
use Symfony\Component\HttpKernel\Event\GetResponseForExceptionEvent;
use Symfony\Component\HttpKernel\Exception\HttpExceptionInterface;
use Symfony\Component\HttpKernel\KernelEvents;

class ApiExceptionSubscriber implements EventSubscriberInterface
{
    private $debug;
    private $logger;

    public function __construct($debug, Logger $logger)
    {
        $this->debug = $debug;
        $this->logger = $logger;
    }

    public function onKernelException(GetResponseForExceptionEvent $event)
    {
        $request = $event->getRequest();
        // only filter api request
        if (strpos($request->getPathInfo(), '/api') !== 0) {
            return;
        }

        $e = $event->getException();
        $statusCode = $e instanceof HttpExceptionInterface ? $e->getStatusCode() : 500;

        if ($statusCode == 500 && $this->debug) {
            return;
        }

        if ($e instanceof ApiProblemException) {
            $apiProblem = $e->getApiProblem();
        } else {
            $apiProblem = new ApiProblem($statusCode);
            // white listing exception message to be exposed
            if ($e instanceof HttpExceptionInterface) {
                //todo switch to more hidden error description in production
                $apiProblem->set('detail', $e->getMessage());
            }
        }

        $data = $apiProblem->toArray();
        //log exceptions
        $this->logger->log(300, json_encode($data));
        $host = $request->getHost();
        if ($data['type'] != 'about:blank') {
            $data['type'] = 'http://' . $host . '/docs/error#' . $data['type'];
        }
        $response = new JsonResponse(
            $data,
            $apiProblem->getStatusCode()
        );
        $response->headers->set('Content-Type', 'application/problem+json');

        $event->setResponse($response);
    }

    public static function getSubscribedEvents()
    {
        return [
            KernelEvents::EXCEPTION => 'onKernelException'
        ];
    }

}