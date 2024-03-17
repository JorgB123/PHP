<?php
require "DataBase.php";
$db = new DataBase();

if (isset($_POST['Email']) && isset($_POST['Password']) && isset($_POST['Firstname']) && isset($_POST['Lastname']) && isset($_POST['Department']) && isset($_POST['Role']) && isset($_POST['image'])) {
    if ($db->dbConnect()) {
        $Email = $_POST['Email'];
        $Password = $_POST['Password'];
        $Firstname = $_POST['Firstname'];
        $Lastname = $_POST['Lastname'];
        $Department = $_POST['Department'];
        $Role = $_POST['Role'];
        $imageData = $_POST['image']; // Base64 encoded image data

        // Decode Base64 image data
        $decodedImage = base64_decode($imageData);

        // Define the absolute server file path to store the uploaded images
        $uploadDirectory = 'item_images/'; // Change this to your desired image directory
        $imageFileName = $Firstname . '_' . $Lastname . '.jpg'; // You may rename the image file as per requirement
        $uploadPath = $uploadDirectory . $imageFileName;

        // Save the image to the server
        if (file_put_contents($uploadPath, $decodedImage)) {
            // Image saved successfully
            // Now, you can call the signUp function to create the user account and store additional information
            if ($db->signUp("users", $Email, $Password, $Firstname, $Lastname, $Department, $Role, $uploadPath)) {
                echo "Sign Up Success";
            } else {
                echo "Sign Up Failed";//already exist
            }
        } else {
            // Handle image upload error
            echo "Error uploading image.";
        }
    } else {
        echo "Error: Database connection";
    }
} else {
    echo "All fields are required";
}
?>
