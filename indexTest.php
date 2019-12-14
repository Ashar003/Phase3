<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Document</title>
</head>
<body>




    <form action="index.php" method="get">
            <input type="text" name="search" />
            <input type="submit" value="search">
    </form>

    
    <?php
$server = "localhost";
$username = "root";
$password = "";
$dbname = "searchengine";
$conn = mysqli_connect($server, $username, $password, $dbname) or die('Connection Error');

if(isset($_GET['search'])){
    $query = $_GET['search'];

    $sql = $conn -> query("
    SELECT pageTitle, pageURL, pageDescription, indexAt 
    FROM page 
    WHERE pageTitle LIKE '%$query%'
    OR pageDescription LIKE '%$query%'
    ");

    if($sql->num_rows > 0){
        while($row = $sql -> fetch_assoc()){
            echo "<br>".$row[""];
            echo " ".$row[""];
            echo "  ---- ".$row[""]."<br>";
        }
    }

    else{

        echo "<p>0 results</p>";
    }
}

?>
    
</body>
</html>