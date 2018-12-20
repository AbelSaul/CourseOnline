<?php

use Behat\Behat\Context\Context;
use Behat\Gherkin\Node\PyStringNode;
use Behat\Gherkin\Node\TableNode;
use App\Services\ServiceSuscription;
// use Laracasts\Behat\Context\DatabaseTransactions;

/**
 * Defines application features from the specific context.
 */
class FeatureContext implements Context
{

    // use DatabaseTransactions;

    /**
     * Initializes context.
     *
     * Every scenario gets its own context instance.
     * You can also pass arbitrary arguments to the
     * context constructor through behat.yml.
     */

    private $service_suscription;
    private $resultado;

    public function __construct()
    {
    }

    /**
     * @Given que tengo el emaiL :email
     */
    public function enviarDatosUsuario($email) {
        
        $this->service_suscription = new ServiceSuscription($email);

    }

    /**
    * @When realizo la busqueda
    */
    public function realizarBusquedaUsuario() {
       $this->resultado = $this->service_suscription->verifyUserAppSuscriptions();
    }

    /** 
    * @Then deberia obtener :resultado 
    */
    public function resultadoBusquedaUsuario($resultado) {
        if ($this->resultado != $resultado) {
            throw new Exception("Actual resultado: ".$this->resultado);
        }
        return $this->resultado;
    }




     /**
     * @Given que tengo el siguiente usuario :email
     */
    public function enviarEmail($email) {
        $this->service_suscription = new ServiceSuscription($email);

    }

    /**
    * @When realizo la comprobacion
    */
    public function realizarComprobacion() {
       $this->resultado = $this->service_suscription->verifySuscriptionActiva();
    }

    /** 
    * @Then deberia obtener el siguiente resultado :resultado
    */
    public function resultadoBusquedaSuscripcion($resultado) {
        if ($this->resultado != $resultado) {
            throw new Exception("Actual resultado: ".$this->resultado);
        }
        return $this->resultado;
    }
}
