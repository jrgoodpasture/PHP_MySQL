<html>
	<head>
		<title>Account Registration</title>
	</head>
	<body>

		<A HREF = "login.php">Login</A> </br>

		<?php

		if(isset($_POST['submit'])){

			$data_missing = array();

			if(empty($_POST['username'])){
				$data_missing[] = 'Username';
			} else {
				$uname = trim($_POST['username']);
			}

			if(empty($_POST['password'])){
				$data_missing[] = 'Password';
			} else {
				$pass = trim($_POST['password']);
			}

			if(empty($_POST['confirm_password'])){
				$data_missing[] = 'Confirm Password';
			} else {
				$confirm_pass = trim($_POST['confirm_password']);
			}

			if(empty($_POST['email'])){
				$data_missing[] = 'Email';
			} else {
				$mail = trim($_POST['email']);
			}

			$noadmin = 0;

			if(empty($data_missing)){
				require_once('mysqli_connect.php');

				$query = "INSERT INTO user (Username, Email, Password, isManager)
					VALUES (?, ?, ?, ?)";

				$stmt = mysqli_prepare($dbc, $query);

				mysqli_stmt_bind_param($stmt, "sssi", $uname, $mail, $pass, $noadmin);

				mysqli_stmt_execute($stmt);

				$affected_rows = mysqli_stmt_affected_rows($stmt);

				 if($affected_rows == 1){
				 	echo 'User Entered';
				 	mysqli_stmt_close($stmt);
				 	mysqli_close($dbc);
				 } else {
				 	echo 'Error Occurred<br />';
				 	echo mysqli_error($dbc);

				 }
			} else {
				echo 'FAILED. You need to enter the following data<br />';
				foreach($data_missing as $missing){
					echo "$missing<br />";

				}
			}
		}
		?>

		<form action="register.php" method = "post">
		<b>Add a New User</b>


			<p>Username:
				<input type="text" name="username" size="30" value="" />
			</p>

			<p>Passsword:
				<input type="text" name="password" size="30" value="" />
			</p>

			<p>Confirm Password:
				<input type="text" name="confirm_password" size="30" value="" />
			</p>

			<p>Email:
				<input type="text" name="email" size="30" value="" />
			</p>

			<p>
				<input type = "submit" name = "submit" value = "Send" />
			</p>
		</form>
	</body>
</html>