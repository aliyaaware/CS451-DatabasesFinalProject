<?php
include('textFiles/connectionData.txt');

$conn = mysqli_connect($server,  $user, $pass, $dbname, $port)
or die('Error connecting to MySQL server.');

?>
<html>
<head>
  <title>Another Simple PHP-MySQL Program</title>
  </head>

  <body bgcolor="white">


  <hr>
<h2> Brands we carry </h2>
<?php

$brand_name = $_POST['brand_name'];
$brand_name = mysqli_real_escape_string($conn, $brand_name);

$query = "SELECT brand_id, brand_name FROM MCS2.Clothing_Brand";
//$query = $query."'".$brand_name."'";

?>

<p>
Result of query:
<p>

<?php
$result = mysqli_query($conn, $query)
or die(mysqli_error($conn));

print "<pre>";
print "$row brand ID:    $row brand name:";
while($row = mysqli_fetch_array($result, MYSQLI_BOTH))
  {
    print "\n";
    print "$row[brand_id]  $row[brand_name]";
  }
print "</pre>";
?>

<hr>

<p>Select a brand from the drop down menu to browse what they have</p>

<form action="specificBrand.php" method="POST">
<select name=b_name>
<option selected disabled>"Select an element"</option>

<?php
$query = "SELECT DISTINCT brand_name FROM MCS2.Clothing_Brand;";
$result = mysqli_query($conn, $query) or die(mysqli_error($conn));
while ($row = mysqli_fetch_array($result, MYSQLI_BOTH)) {
print "<option value='$row[brand_name]'>$row[brand_name]</option>";
}
?>
</select>

<input type="submit" value="submit">
<input type="reset" value="erase">
</form>
<a href ="specificBrand.php?b_name=<?php echo $brand_name?>"
</a> 
<!-- mysqli_free_result($result); -->

<a href ="frontPage.html">
<p>Return Home
</a>

<a href ="textFiles/allBrands.txt">
<p>Code
</a>

</body>
</html>
