
<?php
   function check_exist_list($value, $list2, $label){
        foreach ($list2 as $tc1){
            if ($value == $tc1[ $label])
                return true;
        }
    return false;
}

    function check_bac($string){
        $subString = substr($string,0,3);
        echo $subString;
    }

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
    $sql_tc1 = "SELECT * FROM `tbl_tc1`";
    $sql_tc2 = "SELECT * FROM `tbl_tc2`";
    $sql_tc3 = "SELECT * FROM `tbl_tc3`";
   
    $list_tc1 = getList($sql_tc1);
    $list_tc2 = getList($sql_tc2);
    $list_tc3 = getList($sql_tc3);
    
    
    // if (isset($_POST['btn_submit'])){

    // }
?>
<style>
    table{
        border: none;
    }
    td{
    border: 1px solid #000;
    /* border-left: 1px solid #000; */
    }
    input[type=number]{
        border: none;
    }

</style>
<div id="container">
    <div id="form_chamdiem">
        <form action="" method="POST">
            <table>
                <tr>
                    <td>NỘI DUNG ĐÁNH GIÁ</td>
                    <td>Điểm SV tự đánh giá</td>
                </tr>
            <?php
                foreach ($list_tc1 as $tc){
            ?>
                <tr> 
                    <td><?php echo $tc['nd_tc1']; ?></td>
                    <td></td>
                </tr> 
                <?php 
                foreach($list_tc2 as $tc2) {
                    if ($tc2['id_tc1'] == $tc['id_tc1']){
                ?>
                    <tr>
                        <td><?php echo $tc2['nd_tc2']; ?></td>
                        <?php
                        $temp ='id_tc2';
                        if (check_exist_list($tc2['id_tc2'],$list_tc3,$temp) ){
                        ?>  
                            <td></td>
                        <?php }else{ ?>
                            <td class="">
                                <input type="number" name="<?php echo "id_tc2=".$tc2['id_tc2']; ?>" id="" placeholder="nhập điểm">
                            </td>
                        <?php } 
                        }?>
                    </tr>

                <?php
                    foreach($list_tc3 as $tc3) {
                        if ($tc3['id_tc2'] == $tc2['id_tc2'] && $tc['id_tc1'] == $tc2['id_tc1'] ){
                ?>
                        <tr>
                            <td><?php echo $tc3['nd_tc3']; ?></td>
                            <td><input type="number" name="<?php echo "id_tc3=".$tc3['id_tc3']; ?>" id="" placeholder="nhập điểm"></td>
                        </tr>
                <?php
                    }
                 }
                }
            }
                ?>
        </table>
        <p class="thongbao_submit">Khi gửi sẽ không được chỉnh sửa</p>
        <input type="submit" value="Gửi" name="btn_submit" class="btn-submit">
    </form>
    </div>
</div>

<?php
require "inc/footer.php";
?>