
<?php
	session_start();


require_once('mysqli_connect.php');

if (isset($_POST['submit'])) {
	if(isset($_POST['username']) && isset($_POST['password'])) {

		$user = mysqli_real_escape_string($dbc,$_POST['username']);
		$pass = mysqli_real_escape_string($dbc,$_POST['password']);

		//$user = $_POST['username'];
		//$pass = $_POST['password'];

		$query = "SELECT * FROM user WHERE Username = \"$user\" and Password = \"$pass\"";
		if ($result = @mysql_query($dbc, $query)) {
			if(mysqli_num_rows($result) == 1) {
				$_SESSION['username'] = $user;
				echo "<script>window.location.href='homepage.php'</script>"; 
			} else {
				echo "Invalid login";
			}
		}
	} else {
		echo "Username or password not entered";
	}
}
?>
<html>
<head>
	<title>Login</title>
</head>
<body>
		<h1>
			Login
		</h1>

		<form action="" method = "post">

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
	</body>
</html>