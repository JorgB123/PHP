<?php
require "DataBase.php";

// Create an instance of the DataBase class
$db = new DataBase();

// Establish a database connection
$conn = $db->dbConnect();

// Define your SQL query
$query = "SELECT PropertyNumber, DateAcquired, Unit, UnitCost, Supplier, Particular, PropertyStatus, SourceFund FROM properties";

// Execute the query
$result = mysqli_query($conn, $query);

$products = array();

// Fetch the results and store them in an array
while ($row = mysqli_fetch_assoc($result)) {
    $temp = array(
        'PropertyNumber' => $row['PropertyNumber'],
        'DateAcquired' => $row['DateAcquired'],
        'Unit' => $row['Unit'],
        'UnitCost' => $row['UnitCost'],
        'Supplier' => $row['Supplier'],
        'Particular' => $row['Particular'],
        'PropertyStatus' => $row['PropertyStatus'],
        'SourceFund' => $row['SourceFund']
    );

    array_push($products, $temp);
}

// Encode the array as JSON and echo it
echo json_encode($products);
?>
