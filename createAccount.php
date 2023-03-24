<?php
include('textFiles/connectionData.txt');

$conn = mysqli_connect($server,  $user, $pass, $dbname, $port)
or die('Error connecting to MySQL server.');

$input = "";

function createAccount($server, $user, $pass, $dbname, $port)
{
    $customer_id = rand(100,999);
    $Name = $_POST["Name"];
    $email = $_POST["email"];
    $address = $_POST["address"];
    $payment_method = $_POST["payment_method"];
    $shopping_cart_default = NULL;
    //$qry = "S"
    $query = "INSERT INTO customer (customer_id, Name, email, address, payment_method, Shopping_cart_cart_cust_id) VALUES ($customer_id, '$Name', '$email', '$address', '$payment_method', $shopping_cart_default);";
    if (mysqli_query($conn, $query)){
        $input = "User '$Name' created!";
    } else {
            echo "Error: " . $query . "<br>" . mysqli_error($conn);
    }
    echo $input."<br>";
}


?>
<html>
<head>
  <title>Create Account</title>
  </head>

  <body bgcolor="lightblue">


  <hr>
<h2> Create A New User </h2>
<hr>


<?php
if (isset($_POST["created"])){

        createAccount($server, $user, $pass, $dbname, $port);
}
?>

<h3> Enter in you info to create a new account </h3>
    
 <form method="post" action="createAccount.php">
        <label for="Name"> Name: </label>
        <input type="text" name="Name" required>
        <br>
        <label for="email"> Email:  </label>
        <input type="text" name="city" required>
        <br>
        <label for="address"> Address:  </label>
        <input type="text" name="address" required>
        <br>
        <label for="payment_method"> payment_method:  </label>
        <input type="text" name="payment_method" required>
        <br>
        <br>
        <input type="submit" value="create" name="created">
        <input type="reset" value="erase">
</form>

<h4> Customers </h4>

<?php

// $conn = mysqli_connect($server, $user, $pass, $dbname, $port);
$userQuery = "SELECT customer_id, Name, email, address, payment_method FROM customer;";
$result = mysqli_query($conn, $userQuery);

print "<pre>";
echo "<table>";
echo "<tr><td>cust_id</td><td>name</td><td>email</td><td>address</td><td>payment</td></tr>";
while ($row = mysqli_fetch_array($result, MYSQLI_ASSOC)) {
$customer_id = $row['customer_id'];
$Name = $row['Name'];
$email = $row['email'];
$address = $row['address'];
$payment_method = $row['payment_method'];
//$button = "<td><form action=\"editUser.php\" method=\"get\"><input type=\"hidden\" name=\"customer_id\" value=\"$customer_id\" style=\"text-decoration: none\" /><input type=\"submit\" value=\"Edit\" /></form></td>";
echo "<tr><td>".$customer_id."</td><td>".$Name."</td><td>".$email."</td><td>".$address."</td><td>".$payment_method."</td></tr>";
}
echo "</table>";
echo "</pre>";

    mysqli_free_result($result);

?>


<a href ="frontPage.html">
<p>Return Home
</a>

<a href ="textFiles/createAccount.txt">
<p>Code
</a>

</body>
</html>

