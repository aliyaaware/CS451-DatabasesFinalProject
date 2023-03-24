?php
include('textFiles/connectionData.txt');

$conn = mysqli_connect($server,  $user, $pass, $dbname, $port)
or die('Error connecting to MySQL server.');

?>
<html>
<head>
  <title>Items List</title>
  </head>

  <body bgcolor="coral">


  <hr>
<h2> A list of our in stock items </h2>
<?php

$item_name= $_POST['item_name'];
$item_name = mysqli_real_escape_string($conn, $item_name);

$query = "SELECT clothes_brand, clothes_type, item_desc, item_price FROM MCS2.Items
          ORDER BY clothes_brand DESC";

?>


<?php
$result = mysqli_query($conn, $query)
or die(mysqli_error($conn));


print "<pre>";
echo "<table> <thread><tr> 
        <th scope='col'>Brand</th>
        <th scope='col'>Type</th>
        <th scope='col'>Description</th>
<th scope='col'>Price</th>
       </tr>
        </thread>
        <tbody>";

//print "$row brand    $row clothes type";
while($row = mysqli_fetch_array($result, MYSQLI_BOTH))
  {
    echo "<tr>";
    echo '<td align="left">' . $row['clothes_brand'] . '</td>';
    echo '<td align="left">' . $row['clothes_type'] . '</td>';
    echo '<td align="left">' . $row['item_desc'] . '</td>';
    echo '<td align="left">' . $row['item_price'] . '</td>';
   echo "</tr>";
        //print "\n";
    //print "$row[clothes_brand]  $row[clothes_type]    $row[item_desc]"; 
  }
echo "</tbody>
            </table>";
    
    
    print "</pre>";
?>

<hr>

<h2> List of every item this store could carry </h2>

<?php
$query = "SELECT top_desc, size, price, color From Tops
Union Select bottoms_desc, size, price, color From Bottoms
UNION Select jackets_desc, size, price, color From Jackets";

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
       </tr>
        </thread>
        <tbody>";

//print "$row brand    $row clothes type";
while($row = mysqli_fetch_array($result, MYSQLI_BOTH))
  {
    echo "<tr>";
    echo '<td align="left">' . $row['top_desc'] . '</td>';
    echo '<td align="left">' . $row['size'] . '</td>';
    echo '<td align="left">' . $row['price'] . '</td>';
    echo '<td align="left">' . $row['color'] . '</td>';
    echo "</tr>";
        //print "\n";
    //print "$row[clothes_brand]  $row[clothes_type]    $row[item_desc]"; 
  }
echo "</tbody>
            </table>";

print "</pre>";
?>

<hr>
    
    <a href ="topsOnly.php">
<p> Just Tops
</a>

<a href ="bottomsOnly.php">
<p> Just Bottoms
</a>

<a href ="jacketsOnly.php">
<p> Just Jackets
</a>

<a href ="frontPage.html">
<p>Return Home
</a>

<a href ="textFiles/myItems.txt">
<p>Code
</a>


</body>
</html>
