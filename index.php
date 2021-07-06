<?php

// Replicate quanto fatto in classe con me stamattina ma usando il vostro database university.
// Nel mio account githug ci sono gli steps che abbiamo fatto.
// Provate ad usare un prepare statement, come da slides, nell'account gitHub trovate dei passaggi da fare.

# 1 Definire le costanti per la connessione

define("DB_SERVERNAME", "localhost");
define("DB_USERNAME", "root");
define("DB_PASSWORD", "root");
define("DB_NAME", "university");
define("DB_PORT", "3306");

# 2 Stabiliamo la connessione con il database

$conn = new mysqli(DB_SERVERNAME, DB_USERNAME, DB_PASSWORD, DB_NAME, DB_PORT);


# 3 Verifichiamo la connessione al database

if ($conn && $conn->connect_error) {
    echo 'Connection Failed' . $conn->connect_error;
}

echo 'Connection Succesful!';

# 4 Eseguiamo una query se la connessione è stata stabilita

$sql = "SELECT * FROM teachers";
$result = $conn->query($sql);

// var_dump($result);

if ($result && $result->num_rows > 0) {

    while ($teacher = $result->fetch_assoc()) {

?>
        <!-- <h1>
            $teacher['name'];
        </h1> -->
<?php
    }
}

$conn->close;
?>

<?php

$conn = new mysqli(DB_SERVERNAME, DB_USERNAME, DB_PASSWORD, DB_NAME, DB_PORT);

if ($conn && $conn->connect_error) {
    echo 'Connection failed' . $conn->connect_error;
} else {
    echo 'Connection succesful';
}


$request =  $conn->prepare("INSERT INTO teachers (name) VALUES (?)");
$request->bind_param("s", $firstname);

$name = $_GET['name'];

$request->execute();


$query = "SELECT * FROM `teachers` WHERE `name` = '" . $name . "';";

// echo $query;

$result = $conn->query($query);


?>


<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>DB-Request</title>
</head>

<body>

    <form action="#" method="get">

        <label for="name">Insert teacher name</label>
        <input type="text" name="name" id="name" placeholder="Insert teacher name here">

    </form>

    <?php
    if ($result && $result->num_rows > 0) {

        while ($teacher = $result->fetch_assoc()) {

    ?>
            <h1><?= $teacher['name']; ?></h1>
            <h2><?= $teacher['surname']; ?></h2>

    <?php
        }
    } elseif ($result) {
        echo 'No teacher found';
    } else {
        echo 'query error';
    }

    ?>

</body>

</html>