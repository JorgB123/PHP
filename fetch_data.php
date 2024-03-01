<?php
require "DataBase.php";

$db = new DataBase();
header('Content-Type: application/json'); // Set the content type to JSON

if ($db->dbConnect()) {
    $data = $db->fetchData("properties");

    if (!empty($data)) {
        // Array to hold filtered data
        $filteredData = array();

        // Loop through fetched data
        foreach ($data as $row) {
            // Extract the fields you need
            $filteredRow = array(
                "Description" => $row["Description"],
                "StockAvailable" => $row["StockAvailable"],
                "Image" => base64_encode($row["Image"])
            );

            // Add filtered row to filtered data array
            $filteredData[] = $filteredRow;
        }

        // Return filtered data as JSON
        echo json_encode(array("success" => true, "data" => $filteredData));
    } else {
        echo json_encode(array("success" => false, "message" => "No data found"));
    }
} else {
    echo json_encode(array("success" => false, "message" => "Error: Database connection"));
}
?>
