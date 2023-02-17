<html><head>
        <title>รายการอาหาร</title>
    </head>
    <body>
<?php
require 'connect.php';
// ลองให้โชว์ข้อมูล customer
$sql = "SELECT * FROM `food` WHERE 1 ";

$stmt = $conn->prepare($sql);
$stmt->execute();
echo '<br>';
echo '<br>';
?>
<table width="600" border="1">
  <tr>
    <th width="100"> <div align="center">ชื่ออาหาร</div></th>
    <th width="300"> <div align="center">รายละเอียด</div></th>
    <th width="50"> <div align="center">เมนู</div></th>
    <th width="50"> <div align="center">ราคา</div></th>
   
    </tr>
<?php while ($result = $stmt->fetch(PDO::FETCH_ASSOC)) { ?>
 
  <tr>
    <td>  <div align="center">  <?php echo $result['Food_Name']; ?>        </td>
    <td>   <div align="center"> <?php echo $result['Food_Description']; ?>    </td>
    <td>    <div align="center"><?php echo $result['Menu_ID']; ?>         </td>
    <td>   <div align="center"><?php echo $result['Food_Price']; ?>        </td>       
  </tr>
 
<?php } ?>
</table>
<?php $conn = null; ?>
    </body>
</html>


