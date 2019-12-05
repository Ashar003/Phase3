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
$dbname = "smashv1";
$conn = mysqli_connect($server, $username, $password, $dbname) or die('Connection Error');

if(isset($_GET['search'])){
    $query = $_GET['search'];

    $sql = $conn -> query("
    SELECT profile_fname, profile_lname, sf_name
    FROM profile, smash_fighter
    WHERE profile.sf_id = smash_fighter.sf_id
    AND profile_fname LIKE '%$query%'
    ");

    if($sql->num_rows > 0){
        while($row = $sql -> fetch_assoc()){
            echo "<br>".$row["profile_fname"];
            echo " ".$row["profile_lname"];
            echo "  ---- ".$row["sf_name"]."<br>";
        }
    }

    else{

        echo "<p>0 results</p>";
    }
}

?>
    
</body>
</html>