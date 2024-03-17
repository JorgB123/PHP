<?php
// Include your database connection file
require "DataBase.php";

// Establish a database connection
$db = new DataBase();
$conn = $db->dbConnect();

// Check if the item ID is provided in the request
if (isset($_POST['PropertyId'])) {
    // Retrieve the item ID from the request
    $PropertyId = $_POST['PropertyId'];

    // Query to fetch additional data based on the item ID
    $query = "SELECT PropertyNumber, DateAcquired, Unit, UnitCost, Supplier, Particular, PropertyStatus, SourceFund 
              FROM properties 
              WHERE PropertyId = ?";

    // Prepare and execute the statement
    $stmt = $conn->prepare($query);
    $stmt->bind_param("i", $PropertyId);
    $stmt->execute();

    // Bind result variables
    $stmt->bind_result($propertyNumber, $dateAcquired, $unit, $unitCost, $supplier, $particular, $propertyStatus, $sourceFund);

    // Fetch the data
    if ($stmt->fetch()) {
        // Store the fetched data in an associative array
        $response = array(
            'PropertyNumber' => $propertyNumber,
            'DateAcquired' => $dateAcquired,
            'Unit' => $unit,
            'UnitCost' => $unitCost,
            'Supplier' => $supplier,
            'Particular' => $particular,
            'PropertyStatus' => $propertyStatus,
            'SourceFund' => $sourceFund
        );

        // Encode the response as JSON and send it
        echo json_encode($response);
    } else {
        // If no data is found for the given item ID
        echo "No data found for the provided item ID.";
    }

    // Close the statement
    $stmt->close();
} else {
    // If item ID is not provided in the request
    echo "Item ID is missing in the request.";
}

// Close the database connection
$conn->close();
?>
