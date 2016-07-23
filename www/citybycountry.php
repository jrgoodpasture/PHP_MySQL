<html>
	<body>
		<A HREF = "homepage.html">Home Page</A> </br>

		<form action="citybycountry.php" method = "post">
			<p>Country:
				<input type="text" name="country" size="30" value="" />
			</p>

			<p>
				<input type = "submit" name = "submit" value = "Send" />
			</p>
		</form>
	</body>
</html>

<?php

require_once('mysqli_connect.php');
	if(isset($_POST['submit'])) {
		$query = "SELECT *
		FROM CITY
		WHERE Country_Name = '{$_POST['country']}'";

		$response = @mysqli_query($dbc, $query);

		if($response) {
			echo '<table align = "left"
			cellspacing = "5" cellpadding = "8">

			<tr>
				<td align = "left"><B> City Name</b></td>
			</tr>';

			while($row = mysqli_fetch_array($response)) {

				echo '<tr><td align = left">' .
				$row['City_Name'] . '</td><td align = "left">' .
				$row['Longitude'] . '</td><td align = "left">' .
				$row['Latitude'] . '</td><td align = "left">' .
				$row['City_Population'] . '</td><td align = "left">';

				echo '</tr>';

			}

			echo '</table>';
		} else {
			echo "Couldn't perform query";

			echo mysqli_error($dbc);
		}
	}

mysqli_close($dbc);

?>
