<html>
	<head>
		<title>Login Page</title>
	</head>
	<body>

		<?php
			include 'mysqli_connect.php';
			if(isset($_POST['submit'])) {

				$data_missing = array();

				if(empty($_POST['username'])){
					$data_missing[] = 'Username';
				} else {
					$username = trim($_POST['username']);
					//$_SESSION["username"] = $uname;
				}

				if(empty($_POST['password'])){
					$data_missing[] = 'Password';
				} else {
					$password = trim($_POST['password']);
					//$_SESSION["password"] = $pass;
				}

				if(empty($data_missing)){
					require_once('mysqli_connect.php');

					$query = "SELECT *
						FROM user
						WHERE 'Username' = 'boots'";

					$response = mysqli_query($dbc, $query);

					if(!$response) {
						die('Invalid query: ' . mysql_error());
					}
					mysqli_close($dbc);
				}
			}
		?>
		<h1>
			Login
		</h1>
		<form action="loginattempt.php" method = "post">

			<p>Username:
				<input type="text" name="username" size="30" value="" />
			</p>

			<p>Password:
				<input type="text" name="password" size="30" value="" />
			</p>

			<p>
				<input type = "submit" name = "submit" value = "Send" />
			</p>


		</form>
		<A HREF = "registeruser.php">Register an Account</A> </br>
	</body>
</html>