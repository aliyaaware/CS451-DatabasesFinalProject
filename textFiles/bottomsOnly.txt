<?php
include('textFiles/connectionData.txt');

$conn = mysqli_connect($server,  $user, $pass, $dbname, $port)
or die('Error connecting to MySQL server.');

?>
<html>
<head>
  <title>Bottoms</title>
  </head>

  <body bgcolor="coral">


  <hr>
<h2> Bottoms we carry </h2>
<?php

$bottoms_name = $_POST['bottoms_name'];
$bottoms_name = mysqli_real_escape_string($conn, $bottoms_name);

$query = "SELECT bottoms_desc, size, price, color, stock_quantity FROM MCS2.Bottoms JOIN Inventory ON(Item_desc=bottoms_desc)";

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
    echo '<td align="left">' . $row['bottoms_desc'] . '</td>';
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

<a href ="textFiles/bottomsOnly.txt">
<p>Code
</a>

</body>
</html>
