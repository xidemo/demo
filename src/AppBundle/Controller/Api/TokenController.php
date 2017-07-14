<?php

namespace AppBundle\Controller\Api;

use Application\Sonata\UserBundle\Entity\User;
use Sensio\Bundle\FrameworkExtraBundle\Configuration\Method;
use Sensio\Bundle\FrameworkExtraBundle\Configuration\Route;
use Symfony\Component\HttpFoundation\JsonResponse;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Security\Core\Exception\BadCredentialsException;

class TokenController extends ApiBaseController
{
    /**
     * @Route("/api/token")
     * @Method("POST")
     */
    public function newTokenAction(Request $request)
    {
        $data = json_decode($request->getContent(), true);

        $user = $this->get('sonata.user.user_manager')
            ->findOneBy(['username' => $data['user']]);

        if (!$user) {
            throw new BadCredentialsException();
        }

        $isValid = $this->get('security.password_encoder')
            ->isPasswordValid($user, $data['pass']);

        if (!$isValid) {
            throw new BadCredentialsException();
        }
        
        $token = $this->get('lexik_jwt_authentication.encoder')
            ->encode([
                'username' => $user->getUsername(),
                'roles' => $user->getRoles(),
                'exp' => time() + 7200 //manually set here
            ]);

        return new JsonResponse([
            'token' => $token
        ]);
    }
}
