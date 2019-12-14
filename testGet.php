<?php
error_reporting(0)
?>
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<meta http-equiv="X-UA-Compatible" content="ie=edge">
	<title>Master Crawler</title>
</head>
<body>
	
<form action="masterCrawler.php" method="get">
	<input type="text" name="url" placeholder="Enter URL Here" />
	<input name="submit" type="submit" value="crawl" />
</form>

<?php echo $_GET["url"] ?>

</body>
</html>
