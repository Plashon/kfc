<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Search_phone</title>
</head>
<body>
    <h1>Search_phone</h1>
    <form action="Search_phone.php" method="GET">
    <input type="text" placeholder="Enter Phone Number" name="Phone_Number">
    <br><br>
    <input type="submit">
    </form>
</body>
</html>

<?php
    require "connect.php";
    if(isset($_GET["Phone_Number"])&&$_GET['Phone_Number']!=null)
    {
        $sql = "SELECT * FROM customer Where  Phone_Number like CONCAT('%',:Phone_Number,'%')";
    
        echo "<br>" . " sql =
        " .$sql . "<br>";
    
        $stmt = $conn->prepare($sql);
        $stmt->bindParam(':Phone_Number',$_GET['Phone_Number']);
        $stmt->execute();
        $result = $stmt->fetch(PDO::FETCH_ASSOC)
        ?>

      <table width="200" border="1">
  <tr>
    <th width="100">รหัสลูกค้า</th>
    <td width="100"><?php echo $result['Customer_ID']; ?></td>
  </tr>
<tr>
    <th width="100">ชื่อ</th>
    <td><?php echo $result['First_Name']; ?></td>
  </tr>
  <tr>
    <th width="100">นามสกุล</th>
    <td><?php echo $result['Last_Name']; ?></td>
  </tr>
 
  <tr>
    <th width="100">เบอร์โทร</th>
    <td><?php echo $result['Phone_Number']; ?></td>
  </tr>
  </table>
       
    

    
    <?php }
    // if($_GET['P_name']==null)
    // echo "<br> NO Data... <br>";
    $conn = null;
        
    ?>
    </table>