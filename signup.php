<?php
require "DataBase.php";
$db = new DataBase();
if (isset($_POST['Email']) && isset($_POST['Password'])) {
    if ($db->dbConnect()) {
        if ($db->signUp("users", $_POST['Email'], $_POST['Password'])) {
            echo "Sign Up Success";
        } else echo "Sign Up Failed";//already exist
    } else echo "Error: Database connection";
} else echo "All fields are required";
?>
