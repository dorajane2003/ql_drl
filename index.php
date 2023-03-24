<?php
    require "inc/header.php";
    require "db/connect.php";
    session_start();
    // unset($_SESSION['is_login']);
    // unset($_SESSION['user_login']);

    
    if (!isset($_SESSION['is_login']))
        require "pages/login.php";
    else
        require "pages/home.php";
    
    // }
    
    require "inc/footer.php";
?>  