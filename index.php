<?php
    require "inc/header.php";
    if (!isset($_SESSION['btn_login'])){
        require 'pages/login.php';
    }
    
    require "inc/footer.php";
?>