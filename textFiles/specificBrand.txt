html>
<head>
<title> Aliya's Clothing Store </title>
<body>



<?php
$brand_name = $_POST['b_name'];
include('textFiles/connectionData.txt');

$conn = mysqli_connect($server, $user, $pass, $dbname, $port)
        or die('Error connecting to MySQL server.');

?>

<h2> Showing <?php echo $brand_name ?>  </h2>


<?php
$brand_name = $_POST['b_name'];
$brand_name = mysqli_real_escape_string($conn, $brand_name);

$query = "SELECT i.clothes_brand, i.clothes_type, i.item_desc, i.item_price 
FROM Clothing_Brand b JOIN Items i ON(i.clothing_brand_id= b.brand_id)
WHERE brand_name LIKE ";
$query = $query."'".$brand_name."';";
?>


<hr>


<?php
$result = mysqli_query($conn, $query)
or die(mysqli_error($conn));

print "<pre>";
echo "Clothing Type    Clothing Desc   Clothing Price";
echo "\n";
while($row = mysqli_fetch_array($result, MYSQLI_BOTH)) {
          echo "<tr>";
                echo "\n";
                echo "$row[clothes_type]         $row[item_desc]   $row[item_price]";
              echo "</tr>";
               }
  echo "</tbody>
            </table>";
print "</pre>";


//mysqli_free_result($result);

//mysqli_close($conn);

?>
?>
<p>Select the item from the drop down menu to purchase</p>

<form action="cart.php" method="POST">
<select name=b_name>
<option selected disabled>"Select Clothes"</option>

<?php
$query = "SELECT i.item_desc
FROM MCS2.Clothing_Brand b JOIN Items i ON(i.clothing_brand_id= b.brand_id)
WHERE brand_name LIKE ";
$query = $query."'".$brand_name."';";

?>

<?php
$result = mysqli_query($conn, $query) or die(mysqli_error($conn));
while ($row = mysqli_fetch_array($result, MYSQLI_BOTH)) {
print "<option value='$row[item_desc]'>$row[item_desc]</option>";
}
?>
</select>

<input type="submit" value="submit">
<input type="reset" value="erase">
</form>
<a href ="cart.php?b_name=<?php echo $brand_desc?>"
</a>


 <hr> 
<a href ="allBrands.php">
<p>Pick Another Brand
</a>

<a href ="frontPage.html">
<p>Return Home
</a>


<a href ="textFiles/specificBrand.txt">
<p>Code
</a>

</body>
</html>
