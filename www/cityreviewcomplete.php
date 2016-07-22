
<html>
	<?php
		session_start();
	?>
	<head>
		<title>City Review</title>
	</head>
	<body>
		<A HREF = "homepage.html">Home Page</A> </br>
		<?php

		if(isset($_POST['submit'])){

			$data_missing = array();

			if(empty($_POST['country'])){
				$data_missing[] = 'Country';
			} else {
				$country = trim($_POST['country']);
			}

			if(empty($_POST['city'])){
				$data_missing[] = 'City';
			} else {
				$city = trim($_POST['city']);
			}

			if(empty($_POST['date'])){
				$data_missing[] = 'Date';
			} else {
				$date = trim($_POST['date']);
			}

			if(empty($_POST['score'])){
				$data_missing[] = 'Score';
			} else {
				$score = trim($_POST['score']);
			}

			if(empty($_POST['description'])){
				$data_missing[] = 'Description';
			} else {
				$desc = trim($_POST['description']);
			}

			#fix username entry
			$user = $_SESSION["username"];



			if(empty($data_missing)){
				require_once('mysqli_connect.php');

				$query = "INSERT INTO city_review (Username, Date_Written, City_Name, Country_Name, Score, Description)
					VALUES (?, ?, ?, ?, ?, ?)";

				$stmt = mysqli_prepare($dbc, $query);

				mysqli_stmt_bind_param($stmt, "ssssis", $user, $date, $city, $country, $score, $desc);

				mysqli_stmt_execute($stmt);

				$affected_rows = mysqli_stmt_affected_rows($stmt);

				 if($affected_rows == 1){
				 	echo 'User Entered';
				 	mysqli_stmt_close($stmt);
				 	mysqli_close($dbc);
				 } else {
				 	echo 'Error Occurred<br />';
				 	echo mysqli_error();

				 }
			} else {
				echo 'FAILED. You need to enter the following data<br />';
				foreach($data_missing as $missing){
					echo "$missing<br />";

				}
			}
		}
		?>

		<form action="cityreviewcomplete.php" method = "post">
		<b>Add a City Review</b>


			<p>Country:
				<input type="text" name="country" size="30" value="" />
			</p>

			<p>City:
				<input type="text" name="city" size="30" value="" />
			</p>

			<p>Date(ex.):
				<input type="date" name="date" size="30" value="" />
			</p>

			<p>Score:
				<input type="text" name="score" size="30" value="" />
			</p>

			<p>Description:
				<input type="text" name="description" size="100" value="" />
			</p>

			<p>
			<input type = "submit" name = "submit" value = "Send" />
			</p>


		</form>
	</body>
</html>