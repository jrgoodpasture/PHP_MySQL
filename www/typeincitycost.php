<html>
	<body>
		<A HREF = "homepage.html">Home Page</A> </br>
	</body>
</html>

<?php

require_once('mysqli_connect.php');

$query = "SELECT *
FROM EVENT 
WHERE Cost < 150 and Cost > 0
	and City_Name = 'Barcelona'
	and Category = 'Concert';";

$response = @mysqli_query($dbc, $query);

if($response) {
	echo '<table align = "left"
	cellspacing = "5" cellpadding = "8">

	<tr>
		<td align = "left"><B> Country Name</b></td>
		<td align = "left"><B> City Name</b></td>
		<td align = "left"><B> Address</b></td>
		<td align = "left"><B> Event Name</b></td>
		<td align = "left"><B> Event Date</b></td>
		<td align = "left"><B> Start Time</b></td>
		<td align = "left"><B> Cost</b></td>
		<td align = "left"><B> End time</b></td>
		<td align = "left"><B> Student Discount</b></td>
		<td align = "left"><B> Description</b></td>
	</tr>';

	while($row = mysqli_fetch_array($response)) {

		echo '<tr><td align = left">' .
		$row['Country_Name'] . '</td><td align = "left">' .
		$row['City_Name'] . '</td><td align = "left">' .
		$row['Address'] . '</td><td align = "left">' .
		$row['Event_Name'] . '</td><td align = "left">' .
		$row['Event_Date'] . '</td><td align = "left">' .
		$row['Start_Time'] . '</td><td align = "left">' .
		$row['Cost'] . '</td><td align = "left">' .
		$row['End_Time'] . '</td><td align = "left">' .
		$row['STD_Discount'] . '</td><td align = "left">' .
		$row['Description'] . '</td><td align = "left">';

		echo '</tr>';

	}

	echo '</table>';
} else {
	echo "Couldn't perform query";

	echo mysqli_error($dbc);
}

mysqli_close($dbc);

?>