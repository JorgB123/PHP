<?php
require "DataBase.php"; // Include the file where the database connection is established

$db = new DataBase();
$conn = $db->dbConnect(); // Establish the database connection

if ($conn) { // Check if the connection is successful
    $stmt = $conn->prepare("SELECT Description, StockAvailable, Image FROM properties");

    $stmt->execute();
    $stmt->bind_result($description, $stockAvailable, $image);

    $itemList = array();

    while ($stmt->fetch()) {
        $temp = array();

        $temp['Description'] = $description;
        $temp['StockAvailable'] = $stockAvailable;
        $temp['Image'] = $image;

        array_push($itemList, $temp);
    }

    echo json_encode($itemList);
} else {
    echo json_encode(array("success" => false, "message" => "Error: Database connection"));
}
?>
