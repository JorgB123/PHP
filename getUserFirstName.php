<?php
require "DataBase.php"; // Include the file where the database connection is established

$db = new DataBase();
$conn = $db->dbConnect(); // Establish the database connection

$message = ""; // Variable to store login status message

if ($_SERVER["REQUEST_METHOD"] == "POST") {
    // Retrieve username and password from the POST request
    $Email = $_POST['Email'];
    $Password = $_POST['Password'];

    // Prepare SQL statement to select UserID based on email and password
    $stmt = $conn->prepare("SELECT UserID FROM users WHERE Email = ? AND Password = ?");
    $stmt->bind_param("ss", $Email, $Password);

    // Execute SQL statement
    $stmt->execute();

    // Bind result variables
    $stmt->bind_result($userId);

    // Fetch UserID
    $stmt->fetch();

    // Close statement
    $stmt->close();

    // Check if a user with the provided credentials exists
    if ($userId) {
        // Prepare SQL statement to select user's first name based on UserID
        $stmt = $conn->prepare("SELECT FirstName FROM users WHERE UserID = ?");
        $stmt->bind_param("s", $userId);

        // Execute SQL statement
        $stmt->execute();

        // Bind result variables
        $stmt->bind_result($firstName);

        // Fetch user's first name
        $stmt->fetch();

        // Close statement
        $stmt->close();

        // Set success message with user's first name
        $message = "User found. First Name: " . $firstName;
    } else {
        // User not found, set error message
        $message = "User not found. Invalid email or password.";
    }
}
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login</title>
</head>
<body>

<h2>Login</h2>
<form method="post" action="<?php echo htmlspecialchars($_SERVER["PHP_SELF"]); ?>">
    <label for="email">Email:</label><br>
    <input type="email" id="email" name="Email" required><br> <!-- Ensure name="Email" -->
    <label for="password">Password:</label><br>
    <input type="password" id="password" name="Password" required><br><br> <!-- Ensure name="Password" -->
    <input type="submit" value="Login">
</form>

<!-- Display login status message -->
<?php
if (!empty($message)) {
    echo "<p>$message</p>";
}
?>

</body>
</html>
