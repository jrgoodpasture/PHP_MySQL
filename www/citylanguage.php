<html>
	<body>
		<A HREF = "homepage.html">Home Page</A> </br>
		<p>
		What language would you like to search for?
		
  			
  			<?php 
				require_once('mysqli_connect.php');
				echo "<select name=\"formLanguage\">";
				echo "<option value=\"\">Select...</option>";

				$query = "SELECT Name FROM LANGUAGE";
				$response = mysqli_query($dbc, $query);
				if($response) {
					while($row = mysqli_fetch_array($response)) {
						echo "<option value=$row[Name]/option>";
						echo '<tr><td align = left">' .
						$row['Name'] . '</td><td align = "left">';
						echo '</tr>';
					}
				}
			
			?>

		</select>
		</p>
	</body>
</html>

<?php

require_once('mysqli_connect.php');




$query = "SELECT City_Name
FROM City_Language
WHERE Lang_Name = 'Spanish'";

$response = @mysqli_query($dbc, $query);

if($response) {
	echo '<table align = "left"
	cellspacing = "5" cellpadding = "8">

	<tr>
		<td align = "left"><B> City Name</b></td>

	</tr>';

	while($row = mysqli_fetch_array($response)) {

		echo '<tr><td align = left">' .
		$row['City_Name'] . '</td><td align = "left">';
		echo '</tr>';

	}

	echo '</table>';
} else {
	echo "Couldn't perform query";

	echo mysqli_error($dbc);
}

mysqli_close($dbc);

?>
