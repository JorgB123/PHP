<?php
require "DataBaseConfig.php";

class DataBase
{
    public $connect;
    public $data;
    private $sql;
    protected $servername;
    protected $username;
    protected $password;
    protected $databasename;

    public function __construct()
    {
        $this->connect = null;
        $this->data = null;
        $this->sql = null;
        $dbc = new DataBaseConfig();
        $this->servername = $dbc->servername;
        $this->username = $dbc->username;
        $this->password = $dbc->password;
        $this->databasename = $dbc->databasename;
    }

    function dbConnect()
    {
        $this->connect = mysqli_connect($this->servername, $this->username, $this->password, $this->databasename);
        return $this->connect;
    }

    function prepareData($data)
    {
        return mysqli_real_escape_string($this->connect, stripslashes(htmlspecialchars($data)));
    }

    function logIn($table, $Email, $Password)
{
    $table = $this->prepareData($table);
    $Email = $this->prepareData($Email);
    $Password = $this->prepareData($Password);
    $this->sql = "SELECT * FROM " . $table . " WHERE Email = '" . $Email . "'";
    $result = mysqli_query($this->connect, $this->sql);
    
    if (mysqli_num_rows($result) != 0) {
        $row = mysqli_fetch_assoc($result);
        $dbEmail = $row['Email'];
        $dbPassword = $row['Password'];

        // Use password_verify to check if the entered password matches the hashed password
        if ($dbEmail == $Email && password_verify($Password, $dbPassword)) {
            $login = true;
        } else {
            $login = false;
        }
    } else {
        $login = false;
    }

    return $login;
}
function AdminlogIn($table, $Email, $Password)
{
    $table = $this->prepareData($table);
    $Email = $this->prepareData($Email);
    $Password = $this->prepareData($Password);
    $this->sql = "SELECT * FROM " . $table . " WHERE Email = '" . $Email . "'";
    $result = mysqli_query($this->connect, $this->sql);
    
    if (mysqli_num_rows($result) != 0) {
        $row = mysqli_fetch_assoc($result);
        $dbEmail = $row['Email'];
        $dbPassword = $row['Password'];

        // Use password_verify to check if the entered password matches the hashed password
        if ($dbEmail == $Email) {
            $login = true;
        } else {
            $login = false;
        }
    } else {
        $login = false;
    }

    return $login;
}



   function signUp($table, $Email, $Password, $Firstname, $Lastname, $Department, $Role, $ImagePath)
{
    $Email = $this->prepareData($Email);
    $Password = $this->prepareData($Password);
    $Firstname = $this->prepareData($Firstname);
    $Lastname = $this->prepareData($Lastname);
    $Department = $this->prepareData($Department);
    $Role = $this->prepareData($Role);
    $ImagePath = $this->prepareData($ImagePath); // No need for prepareData, but ensure it's correctly formatted
    $hashedPassword = password_hash($Password, PASSWORD_DEFAULT);

    // Check if the email already exists
    $checkEmailQuery = "SELECT * FROM " . $table . " WHERE Email = '" . $Email . "'";
    $result = mysqli_query($this->connect, $checkEmailQuery);

    if (mysqli_num_rows($result) > 0) {
        // Email already exists, return false
        return false;
    }

    // Email doesn't exist, proceed with insertion
    $this->sql = "INSERT INTO " . $table . " (Email, Password, FirstName, LastName, Department, Role, image) VALUES ('" . $Email . "','" . $hashedPassword . "','" . $Firstname . "','" . $Lastname . "','" . $Department . "','" . $Role . "','" . $ImagePath . "')";

    if (mysqli_query($this->connect, $this->sql)) {
        return true;
    } else {
        return false;
    }
}



function insertData($table, $scannedCode, $itemDescription, $dateAcquired, $itemCost, $itemQuantity, $category, $status, $whereabout, $imagePath, $supplier, $unit, $sourceFund)
{
    // Prepare data
    $table = $this->prepareData($table);
    $scannedCode = $this->prepareData($scannedCode);
    $itemDescription = $this->prepareData($itemDescription);
    $dateAcquired = $this->prepareData($dateAcquired);
    $itemCost = $this->prepareData($itemCost);
    $itemQuantity = $this->prepareData($itemQuantity);
    $category = $this->prepareData($category);
    $status = $this->prepareData($status);
    $whereabout = $this->prepareData($whereabout);
    $supplier = $this->prepareData($supplier);
    $unit = $this->prepareData($unit);
    $sourceFund = $this->prepareData($sourceFund);
    
    // Construct SQL query
    $sql = "INSERT INTO " . $table . " (PropertyNumber, Description, DateAcquired, UnitCost, StockAvailable, Particular, PropertyStatus, WhereAbout, Image, Supplier, Unit, SourceFund) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";

    // Prepare and bind parameters
    $stmt = $this->connect->prepare($sql);
    $stmt->bind_param("ssssssssssss", $scannedCode, $itemDescription, $dateAcquired, $itemCost, $itemQuantity, $category, $status, $whereabout, $imagePath, $supplier, $unit, $sourceFund);

    // Execute statement
    if ($stmt->execute()) { 
        $stmt->close();
        return true;
    } else {
        $stmt->close();
        return false;
    }
}



 function fetchData($table)
    {
        $table = $this->prepareData($table);
        $this->sql = "SELECT * FROM " . $table;
        $result = mysqli_query($this->connect, $this->sql);

        $data = array(); // Initialize an array to hold fetched data

        if (mysqli_num_rows($result) > 0) {
            // Loop through each row of the result set
            while ($row = mysqli_fetch_assoc($result)) {
                // Add each row to the data array
                $data[] = $row;
            }
        }

        return $data;
    }

    // Additional methods (fetchIPAddress, getUserData, etc.) if needed

    



function fetchIPAddress($tables)
{
    $table = $this->prepareData($table);
    $username = $this->prepareData($IPAddress);
    $this->sql = "SELECT IPAddress FROM " . $table . " WHERE ID =1";
    $result = mysqli_query($this->connect, $this->sql);
    
    if (mysqli_num_rows($result) != 0) {
        $row = mysqli_fetch_assoc($result);
        $dbIPAddress = $row['IPAddress'];

        if (empty($IPAddress)) {
            $exist = false;
        } else {
            $exist = true;
        }

    } else {
        $exist = false;
    }

    return $exist;
}










function getUserData($table, $username)
{
    $username = $this->prepareData($username);
    $this->sql = "SELECT image_path, username FROM " . $table . " WHERE username = '" . $username . "'";
    $result = mysqli_query($this->connect, $this->sql);

    if (mysqli_num_rows($result) > 0) {
        $row = mysqli_fetch_assoc($result);
        $image_path = $row['image_path'];
        $userData = array('image_path' => $image_path, 'username' => $username);

        return $userData;
    } else {
        return null; // User not found
    }
}



}











?>
