<?php
/**
 * Created by PhpStorm.
 * User: usuario
 * Date: 25/07/2018
 * Time: 20:48
 */

namespace App\Controller;

use Sensio\Bundle\FrameworkExtraBundle\Configuration\Route;
use Symfony\Bundle\FrameworkBundle\Controller\Controller;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;

use App\Services\InitializationDatabase;

class ViewsController extends Controller{
    public function index(Request $request, InitializationDatabase $InitializationDatabase ): Response  {
        return $this->render('default/index.html.twig');
    }
}