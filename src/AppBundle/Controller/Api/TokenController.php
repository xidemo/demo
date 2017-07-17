<?php

namespace AppBundle\Controller\Api;

use Nelmio\ApiDocBundle\Annotation\ApiDoc;
use Sensio\Bundle\FrameworkExtraBundle\Configuration\Method;
use Sensio\Bundle\FrameworkExtraBundle\Configuration\Route;
use Symfony\Component\HttpFoundation\JsonResponse;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\Security\Core\Exception\BadCredentialsException;

class TokenController extends ApiBaseController
{
    /**
     * @ApiDoc(
     *      resource=true,
     *      section="Token",
     *      description="Create a new JWT token for user",
     *      https= true,
     *      input="Application\Sonata\UserBundle\Entity\User",
     *      output="token string",
     *      statusCodes={
     *          200="Returned when successful",
     *          401="Returned when fail authentication"
     *      }
     * )
     *
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
