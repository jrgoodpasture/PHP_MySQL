<html>
	<head>
		<title>City Review</title>
	</head>
	<body>
		<h1>
			Write a Review
		</h1>
		<A HREF = "homepage.html">Home Page</A> </br>
		<form action="cityreviewcomplete.php" method = "post">

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