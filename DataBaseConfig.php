<?php

class DataBaseConfig
{
    public $servername;
    public $username;
    public $password;
    public $databasename;

    public function __construct()
    {

        $this->servername = 'localhost';
        $this->username = 'bacole';
        $this->password = 'bacole';
        $this->databasename = 'bisu_supply';

    }
}

?>
