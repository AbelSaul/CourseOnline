<?php
namespace App\Services;
use DateTime;
use App\User;

   
class ServiceSuscription{

        private $email;
        private $user_id;
        private $enddate;

        public function __construct($email){
            $this->email = $email;
        }


        public function verifyUser(){
       
            $response = $this->apiSuscriptions();
            $users = json_decode($response,true);

            if (is_array($users) || is_object($users))
            {
                foreach($users as $key => $obj){
                    
                    $email = $obj['email'];
                    if ($email === $this->email) {
                        $this->enddate = $obj['enddate'];
                        return true;
                    }
                }
            }

            return false;

        }

                // Verifica si su suscripcion esta activa
        public function validateDateSuscription(){
            $today = $this->today();  
            $enddate = new DateTime($this->enddate);  
            if($today<$enddate){
                return true;
            }
            return false;
        }

        public function today(){
            $today = date('Y-m-j H:i:s'); 
            $date = new DateTime($today);
            return $date;
        }

        public function cosultSuscription(){

            $response = $this->apiSuscriptions();
            $users = json_decode($response,true);


            if (is_array($users) || is_object($users))
            {
                foreach($users as $key => $obj){
                    
                    $email = $obj['email'];
                    if ($email === $this->email) {
                        $this->enddate = $obj['enddate'];
                        $result = $this->validateDateSuscription();
                        return $result;
                    }
                }
            }

        }

          public function verifySuscriptionActiva(){
            $response = $this->apiSuscriptions();
            $users = json_decode($response,true);


            if (is_array($users) || is_object($users))
            {
                foreach($users as $key => $obj){
                    
                    $email = $obj['email'];
                    if ($email === $this->email) {
                        $this->enddate = $obj['enddate'];
                        $result = $this->validateDateSuscriptionBehat();
                        return $result;
                    }
                }
            }
        }

      
        public function apiSuscriptions(){
            $url = "http://67.205.138.236:81/AppSuscriptionsApache/public/api/suscriptions";
            
            $options = array
                (
                    CURLOPT_HEADER => false,
                    CURLOPT_RETURNTRANSFER => true,
                    CURLOPT_TIMEOUT => 2,
                    CURLOPT_URL => $url,
                    CURLOPT_CUSTOMREQUEST => "GET",
            );
                
            $handle = curl_init();
            curl_setopt_array($handle, ($options));
            $response = curl_exec($handle);

            return $response;
        }


        public function verifyUserAppSuscriptions(){
            $response = $this->apiSuscriptions();
            $users = json_decode($response,true);

            $result = 'No es usuario de AppSuscriptions';
            if (is_array($users) || is_object($users))
            {
                foreach($users as $key => $obj){
                    
                    $email = $obj['email'];
                    if ($email === $this->email) {
                        $result =  'Es usuario del sistema AppSuscriptions';
                        return $result;
                    }
                }
            }

            return $result;
        }

        public function validateDateSuscriptionBehat(){

            $today = $this->today();  
            $enddate = new DateTime($this->enddate);  
            $result = 'No tiene suscripcion activa';
            if($today<$enddate){
                $result = 'Este usuario tiene suscripcion activa';
                return $result;
            }
            return $result;
        }



}

?>