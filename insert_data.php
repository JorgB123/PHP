<?php
require "DataBase.php";
$db = new DataBase();

header('Content-Type: application/json'); // Set the content type to JSON

if (
    isset($_POST['PropertyNumber']) &&
    isset($_POST['Description']) &&
    isset($_POST['DateAcquired']) &&
    isset($_POST['UnitCost']) &&
    isset($_POST['StockAvailable']) && // New field for item quantity
    isset($_POST['Particular']) &&
    isset($_POST['PropertyStatus']) &&
    isset($_POST['WhereAbout']) &&
    isset($_POST['Unit']) &&
    isset($_POST['SourceFund']) &&
    isset($_POST['Supplier']) &&
    isset($_POST['Image'])
) {
    if ($db->dbConnect()) {
        $scannedCode = $db->prepareData($_POST['PropertyNumber']);
        $itemDescription = $db->prepareData($_POST['Description']);
        $dateAcquired = $db->prepareData($_POST['DateAcquired']);
        $itemCost = $db->prepareData($_POST['UnitCost']);
        $itemQuantity = $db->prepareData($_POST['StockAvailable']); // Retrieve item quantity
        $category = $db->prepareData($_POST['Particular']);
        $status = $db->prepareData($_POST['PropertyStatus']);
        $whereabout = $db->prepareData($_POST['WhereAbout']);
        $unit = $db->prepareData($_POST['Unit']);
        $sourceFund = $db->prepareData($_POST['SourceFund']);
        $supplier = $db->prepareData($_POST['Supplier']);

        // Define the absolute server file path to store the uploaded images
        $uploadDirectory = 'item_images/'; // Change this to your desired image directory
        $imageFileName = $scannedCode . '.jpg'; // Rename the image based on the scanned code
        $uploadPath = $uploadDirectory . $imageFileName;

        // Convert image data from base64 to binary
        $imageData = base64_decode($_POST['Image']);

        // Save the image to the server
        if (file_put_contents($uploadPath, $imageData)) {
            // Image saved successfully
            // Now, you can insert the item data and image path into your MySQL database
            $imagePath = $uploadPath; // Set the image path to be stored in the database

            // Adjust the insertData function to handle additional fields
            if ($db->insertData(
                "properties",
                $scannedCode,
                $itemDescription,
                $dateAcquired,
                $itemCost,
                $itemQuantity, // Insert item quantity into the database
                $category,
                $status,
                $whereabout,
                $imagePath, // Pass image path instead of image data
                $supplier,
                $unit,
                $sourceFund
            )) {
                echo json_encode(array("success" => true, "message" => "Data inserted successfully"));
            } else {
                echo json_encode(array("success" => false, "message" => "Error: Failed to insert data"));
            }
        } else {
            // Handle image upload error
            echo json_encode(array("success" => false, "message" => "Error uploading image."));
        }
    } else {
        echo json_encode(array("success" => false, "message" => "Error: Database connection"));
    }
} else {
    echo json_encode(array("success" => false, "message" => "Incomplete data"));
}
?>
    