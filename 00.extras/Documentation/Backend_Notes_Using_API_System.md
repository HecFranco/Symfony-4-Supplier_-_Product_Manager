### JSON Response

#### Serialize Entity

> Example of JSON controller response by serializing entity.

```php
// ...
use Symfony\Component\HttpFoundation\JsonResponse;
// ...
class UserController extends Controller
{

    public function getDataUser( Request $request )
    {
        $serializer = $this->get('jms_serializer');
        // Load Entity Manager
        $em = $this->getDoctrine()->getManager();
        // Get User
        $userId = $this->getUser()->getId();
        // Load User_repo
        $user_repo = $em->getRepository(Users::class);
        $user = $user_repo->findOneBy(array('id'=>$userId));
        $result = [
            'result'=>$user,
        ];
        return new Response($serializer->serialize($result, "json"));
        // return new JsonResponse($result);
    }
}
```

#### JSON Response array or JSON object

> Example of simple JSON controller response.

```php
// ...
use Symfony\Component\HttpFoundation\Response;
// ...
class UserController extends Controller
{

    public function getDataUser( Request $request )
    {
        // Load Entity Manager
        $em = $this->getDoctrine()->getManager();
        // Get User
        $userId = $this->getUser()->getId();
        // Load User_repo
        $user_repo = $em->getRepository(Users::class);
        $user = $user_repo->findOneBy(array('id'=>$userId));
        $result = [
            'result'=>$user,
        ];
        return new JsonResponse($result);
    }
}
```