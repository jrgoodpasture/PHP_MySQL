<html>
	<head>
		<title>Account Registration</title>
	</head>
	<body>

		<?php

		if(isset($_POST['submit'])){

			$data_missing = array();

			if(empty($_POST['username'])){
				$data_missing[] = 'Username';
			} else {
				$uname = trim($_POST['username'])
			}

			if(empty($_POST['password'])){
				$data_missing[] = 'Password';
			} else {
				$pass = trim($_POST['password'])
			}

			if(empty($_POST['confirm_password'])){
				$data_missing[] = 'Confirm Password';
			} else {
				$confirm_pass = trim($_POST['fconfirm_password'])
			}

			if(empty($_POST['email'])){
				$data_missing[] = 'Email';
			} else {
				$mail = trim($_POST['email'])
			}

			if(empty($data_missing)){
				require_once(mysqli_connect.php');

				$query = "INSERT INTO user (Username, Email, Password, isManager)
					VALUES (?, ?, ?, 0)";

				$stmt - mysqli_prepare($dbc, $query);

				mysqli_stmt_bind_param($stmt, "sssi", $uname, $pass, $mail, 0);

				mysql_stmt_execute($stmt);

				$affected_rows = mysqli_stmt_affected_rows($stmt);

				 if($affected_rows == 1){
				 	echo 'Student Entered';
				 	mysqli_stmt_close($stmt);
				 	mysqli_close($dbc);
				 } else {
				 	echo 'Error Occurred<br />';
				 	echo mysqli_error();

				 }
			} else {
				echo 'You need to enter the following data<br />';
				foreach($data_missing as $missing){
					echo "$missing<br />";

				}

			}


		<h1>
			Register
		</h1>

		<form action="addeduser.php" method = "post">
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