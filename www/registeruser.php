<html>
	<head>
		<title>Account Registration</title>
	</head>
	<body>
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