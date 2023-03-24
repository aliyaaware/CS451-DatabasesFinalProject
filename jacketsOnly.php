?php
include('textFiles/connectionData.txt');

$conn = mysqli_connect($server,  $user, $pass, $dbname, $port)
or die('Error connecting to MySQL server.');

?>
<html>
<head>
  <title>jackets</title>
  </head>

  <body bgcolor="yellow">


  <hr>
<h2> Jackets we carry </h2>
<?php

$jackets_name = $_POST['jackets_name'];
$jackets_name = mysqli_real_escape_string($conn, $jackets_name);

$query = "SELECT jackets_desc, size, price, color, stock_quantity FROM MCS2.Jackets
JOIN Inventory ON(Item_desc=jackets_desc)";

?>


<?php
$result = mysqli_query($conn, $query)
or die(mysqli_error($conn));

print "<pre>";
echo "<table> <thread><tr> 
        <th scope='col'>Description</th>
        <th scope='col'>Size</th>
        <th scope='col'>Price</th>
        <th scope='col'>Color</th>
        <th scope='col'>Stock</th>
        </tr>
        </thread>
        <tbody>";

while($row = mysqli_fetch_array($result, MYSQLI_BOTH))
  {
    echo "<tr>";
    echo '<td align="left">' . $row['jackets_desc'] . '</td>';
    echo '<td align="left">' . $row['size'] . '</td>';
    echo '<td align="left">' . $row['price'] . '</td>';
    echo '<td align="left">' . $row['color'] . '</td>';
     echo '<td align="left">' . $row['stock_quantity'] . '</td>';
    echo "</tr>";
  }
echo "</tbody>
            </table>";
print "</pre>";
?>
    
<a href ="myItems.php">
<p> All Items
</a>

<a href ="frontPage.html">
<p>Return Home
</a>


<a href ="textFiles/jacketsOnly.txt">
<p>Code
</a>

</body>
</html>
