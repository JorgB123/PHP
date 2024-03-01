<?php


include('Database.php');

$stmt = $conn->prepare("SELECT Description, StockAvailable, Image FROM properties");

$stmt ->execute();
$stmt -> bind_result($description, $stockAvailable, $image);

$itemList = array();

while($stmt ->fetch()){

	$temp = array();

	
	$temp['Description'] = $description
	$temp['StockAvailable'] = $stockAvailable
	$temp['Image'] = $image


	array_push($itemList, $temp);
	}

	echo json_encode($itemList);

?>



