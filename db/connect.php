<?php
 $connect = mysqli_connect('localhost','root','','ql_diemrenluyen');
 if (!$connect){
     echo "Kết nối không thành công ".mysqli_connect_error();
     die();
 } 
?>