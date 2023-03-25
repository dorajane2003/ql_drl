<?php
     function getList($sql_String){
        $list = array();
        global $connect;
        $result= mysqli_query($connect,$sql_String);
        $num_row = mysqli_num_rows($result);
        if ($num_row > 0){
            while ($row = mysqli_fetch_assoc($result)){
                $list[] = $row;
            }
        }
        return $list;
    }

    function check_login($list_user ,$id_user, $password_user){
        foreach ($list_user as $value){
            if ($value['maso'] == $id_user && $value['mat_khau'] == $password_user)
                return true;
        }
        return false;
    }

    $sql_sv = "SELECT * FROM `tbl_sinhvien`";
    $sql_gv = "SELECT * FROM `tbl_giangvien`";
    $sql_khoa = "SELECT * FROM `tbl_khoa`";
   
    $list_sv = getList($sql_sv);
    $list_gv = getList($sql_gv);
    $list_khoa = getList($sql_khoa);

    if (isset($_POST['btn_login'])){
        $error = array();
        if (empty($_POST['id_user']))
           $error['id_user'] = "Không được để trống Tên đăng nhập";
        else 
            $id_user = $_POST['id_user'];

        if (empty( $_POST['password_user']))
             $error['password_user'] = "Không được để trống mật khẩu";
        else
             $password_user = $_POST['password_user'];
        
        if (empty($error)){
            // print_r($list_sv);
            // echo "<br>";
            // echo $id_user."<br>";
            // echo $password_user;
            // echo "<br>";
            // echo  $list_sv[0]['mat_khau'];
            // echo  $list_sv[1]['maso'];
            
            if (check_login($list_sv,$id_user, $password_user)){
                    $_SESSION['is_login'] = true;
                    $_SESSION['user_login'] = $id_user;
                }
                else
                    echo "<h1>Tài khoản không tồn tại</h1>";
            }
        }
?>

<div id="container">
    <div class="welcome">Chào mừng bạn đến với hệ thống điểm rèn luyện của trường ĐHSG</div>
    <form id="login" method="POST" class="glass">
                <label for="id_user">Mã số sinh viên</label>
                <input type="text" name="id_user" id="id_user" value="<?php if (!empty($id_user)) echo $id_user;?>">
                <p class="error">
                    <?php
                        if (!empty($error['id_user']))
                            echo $error['id_user'];
                    ?>
                </p>
                <label for="">Mật khẩu</label>
                <input type="password" name="password_user" id="password_user">
                <p class="error">
                    <?php
                        if (!empty($error['password_user']))
                            echo $error['password_user'];
                    ?>
                </p>
                <input type="submit" name="btn_login" value="Đăng nhập">
            </form>
        </div>