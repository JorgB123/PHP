<?php
require "DataBase.php";
$db = new DataBase();
if (isset($_POST['Email']) && isset($_POST['Password'])) {
    if ($db->dbConnect()) {
        if ($db->AdminlogIn("admin", $_POST['Email'], $_POST['Password'])) {
            echo "Login Successfully";
        } else echo "Username or Password wrong";
    } else echo "Error: Database connection";
} else echo "All fields are required";
?>
