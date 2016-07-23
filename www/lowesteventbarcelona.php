<html>
    <body>
        <A HREF = "homepage.html">Home Page</A> </br>
    </body>
</html>

<?php

require_once('mysqli_connect.php');

$query = "SELECT City_Name
FROM CITY_LANGUAGE
WHERE Lang_Name = 'French' and Country_Name != 'France'";

$response = @mysqli_query($dbc, $query);

if($response) {
    echo '<table align = "left"
    cellspacing = "5" cellpadding = "8">

    <tr>
        <td align = "left"><B> Country Name</b></td>
        <td align = "left"><B> City Name</b></td>
        <td align = "left"><B> Location</b></td>
        <td align = "left"><B> Address</b></td>
        <td align = "left"><B> Average Score</b></td>
    </tr>';

    while($row = mysqli_fetch_array($response)) {

        echo '<tr><td align = left">' .
        $row['Country_Name'] . '</td><td align = "left">' .
        $row['City_Name'] . '</td><td align = "left">' .
        $row['Loc_Name'] . '</td><td align = "left">' .
        $row['Address'] . '</td><td align = "left">' .
        $row['AVG_Score'] . '</td><td align = "left">';

        echo '</tr>';

    }

    echo '</table>';
} else {
    echo "Couldn't perform query";

    echo mysqli_error($dbc);
}

mysqli_close($dbc);

?>