<?php

require_once('mysqli_connect.php');

$query = "SELECT *
FROM LOCATION
WHERE Loc_Type = 'Museum' and City_Name = 'Madrid'";

$response = @mysqli_query($dbc, $query);

if($response) {
	echo '<table align = "left"
	cellspacing = "5" cellpadding = "8">

	<tr>
		<td align = "left"><B> Country Name</b></td>
		<td align = "left"><B> City Name</b></td>
		<td align = "left"><B> Address</b></td>
		<td align = "left"><B> Location</b></td>
		<td align = "left"><B> Cost</b></td>
		<td align = "left"><B> Location Type</b></td>
		<td align = "left"><B> Student Discount</b></td>
	</tr>';

	while($row = mysqli_fetch_array($response)) {

		echo '<tr><td align = left">' .
		$row['Country_Name'] . '</td><td align = "left">' .
		$row['City_Name'] . '</td><td align = "left">' .
		$row['Address'] . '</td><td align = "left">' .
		$row['Loc_Name'] . '</td><td align = "left">' .
		$row['Cost'] . '</td><td align = "left">' .
		$row['Loc_Type'] . '</td><td align = "left">' .
		$row['STD_Discount'] . '</td><td align = "left">';

		echo '</tr>';

	}

	echo '</table>';
} else {
	echo "Couldn't perform query";

	echo mysqli_error($dbc);
}

mysqli_close($dbc);

?>