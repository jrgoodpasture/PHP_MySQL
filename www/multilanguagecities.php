<html>
    <body>
        <A HREF = "homepage.html">Home Page</A> </br>
    </body>
</html>

<?php

require_once('mysqli_connect.php');

$query = "SELECT City_Name, Languages_Spoken
FROM SPANISH_CITIES
WHERE Languages_Spoken > 1;";

$response = @mysqli_query($dbc, $query);

if($response) {
    echo '<table align = "left"
    cellspacing = "5" cellpadding = "8">

    <tr>
        <td align = "left"><B> City Name</b></td>
        <td align = "left"><B> Languages Spoken</b></td>
    </tr>';

    while($row = mysqli_fetch_array($response)) {

        echo '<tr><td align = left">' .
        $row['City_Name'] . '</td><td align = "left">' .
        $row['Languages_Spoken'] . '</td><td align = "left">';
        echo '</tr>';

    }

    echo '</table>';
} else {
    echo "Couldn't perform query";

    echo mysqli_error($dbc);
}

mysqli_close($dbc);

?>