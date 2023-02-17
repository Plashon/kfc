<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Add food</title>
</head>
<body>
    <H1>Add food</H1>
    <form action="addFood.php"method="POST">
   <input type="text" placeholder="Enter ID"name="Food_ID">
    <br><br>
    <input type="text" placeholder="Enter Name"name="Food_Name"> 
    <br><br>
     <input type="text" placeholder="Enter price"name="Food_Price">
    <br><br>
    <!-- <input type="text"  placeholder="Enter Description"name="Food_Description">  -->
    <textarea name="Food_Description" cols="30" rows="10" placeholder="Enter Description"></textarea>
    <br><br>
    <input type="text" placeholder="Enter menu"name="Menu_ID">
    <br><br>
    <input type="submit">
    </form>
    </body>
</html>

<?php

if(!empty($_POST['Food_ID'])&& !empty($_POST['Food_Name'])&& !empty($_POST['Food_Price'])&& !empty($_POST['Food_Description'])&& !empty($_POST['Menu_ID'])):
require 'connect.php';
$sql_insert="insert into food values (:Food_ID, :Food_Name,:Food_Description, :Food_Price,  :Menu_ID)";

$stmt=$conn->prepare($sql_insert);

$stmt->bindParam(":Menu_ID", $_POST['Menu_ID']);
$stmt->bindParam(":Food_Price", $_POST['Food_Price']);
$stmt->bindParam(":Food_ID", $_POST['Food_ID']);
$stmt->bindParam(":Food_Description", $_POST['Food_Description']);
$stmt->bindParam(":Food_Name", $_POST['Food_Name']);

if($stmt->execute()):
    
    $message = '       Suscessfully add new food';
    //header("Location:/business265/");
else:
    $message = '         Fail to add new food';
endif;
echo $message;
$conn = null;
endif;

?>