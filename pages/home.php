
<?php
   function check_exist_list($value, $list2, $label){
        
    foreach ($list2 as $tc1){
            if ($value == $tc1[$label])
                return true;
        }
    return false;
}

    function check_bac($string){
        $subString = substr($string,0,4);
        echo $subString;
        switch ($subString){
            case "tc1=":
                return 1;
                break;

            case "tc2=":
                return 2;
                break;

            case "tc3=":
                return 3;
                break;
            
        }
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
    $dem_tc2 = 0;
    $dem_tc3 = 0;
    unset($error_diem); 
    $error_diem = array();
    $diem = array();
    if (isset($_POST['btn_submit'])){
       foreach($list_tc2 as $tc2){
            $temp = "id_tc2={$tc2['id_tc2']}";
            if (check_exist_list($tc2['id_tc2'],$list_tc3,'id_tc2')== false)
                if (isset($_POST[$temp]))
                    {
                        $temp_value = (int)$_POST[$temp];
                        if ($temp_value > $tc2['diem_max_tc2'])
                            $error_diem[$temp] = "Tiêu chí ".$tc2['nd_tc2']."<b> vượt quá điểm tối đa</b>";
                        else
                        if ($temp_value <= $tc2['diem_max_tc2'])
                            $diem[$temp] =  $temp_value;    
                    }
                else{
                    // echo $tc2['diem_max_tc2']<= 1;
                    // if ($tc2['diem_max_tc2'] == 0)
                        // $diem[$temp] = -0; 
                    // else
                    $error_diem[$temp] = "Tiêu chí ".$tc2['nd_tc2']."<b> chưa nhập điểm</b>";
                    
            }
       
        
       foreach($list_tc3 as $tc3){
            $temp = "id_tc3={$tc3['id_tc3']}";
            if ($tc3['id_tc2'] == 1){
                if (isset($_POST['dtb'])){
                    $diem[$temp] = $tc3['diem_max_tc3'];
                }
                else 
                    $error_diem['dtb']="Bạn chưa chọn điểm!";   
            }
            else
                if (isset($_POST[$temp])){
                  
                    $temp_value = (int)$_POST[$temp];
                        if ($temp_value > $tc3['diem_max_tc3'])
                            $error_diem[$temp] = "Tiêu chí ".$tc3['nd_tc3']."<b> vượt quá điểm tối đa</b>";
                        
                        if ($temp_value <= $tc3['diem_max_tc3'])
                            $diem[$temp] = $temp_value;    
                }
                else 
                if (empty($_POST[$temp])){
                        $error_diem[$temp] = "Tiêu chí ".$tc3['nd_tc3']."<b> chưa nhập điểm</b>";
                }
        }
       }

       
       if (empty($error_diem)){
            foreach ($list_tc2 as $tc2){
                $sum = 0;
                $temp = "id_tc2={$tc2['id_tc2']}";
                echo $temp."-";
                if (check_exist_list($tc2['id_tc2'],$list_tc3,'id_tc2')){
                    foreach ($list_tc3 as $tc3){
                        if ($tc3['id_tc2'] == $tc2['id_tc2']){
                            $temp = "id_tc3={$tc3['id_tc3']}";
                            $sum += $diem[$temp];
                        }
                    }
                }
               echo $sum."<br>";
            }
       }
    }
?>

<style>
    table{
        border: none;
        border-collapse: collapse;
        box-sizing: border-box;
        text-indent: initial;
        border-spacing: 2px;
        border-color: gray;
        width: 100%;
    }
    td, th {
        border: 1px solid;
    }
    .Pdrl td{
        font-size: 16px;
        padding: 5px 5px;
    }
    .Pdrl th{
        font-size: 18px;
        text-align: center;
    }
    input[type=number]{
        border: none;
    }
</style>
<div id="container">
    <div id="form_chamdiem" class="glass">
        <form action="" method="POST">
        <div class="error_diem">
                <?php
                    if (!empty($error_diem)){
                        foreach ($error_diem as $value)
                        echo "<p>{$value}</p>";
                    }
                ?>      
            </div>
                   
        <table class="Pdrl">
                <tr>
                    <td style="height: 36px;vertical-align: top;padding:0px" colspan="2">
                        <div class="Message">
                            <table>
                                <tbody>
                                    <tr>
                                        <td style="padding:0px">
                                            <div class="drl-base"> 
                                                <div class="title" style="background-color: rgb(164, 189, 247);">
                                                    <span class="Label" style="margin: 5px 0px;padding-left: 5px;">PHIẾU ĐIỂM RÈN LUYỆN</span>
                                                </div>
                                            </div>
                                        </td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                    </td>
                </tr>
                <tr>
                    <td colspan="2" style="height:60px;font-size:25px;color:#07456c; text-align: center; border:none"><b>PHIẾU CHẤM ĐIỂM RÈN LUYỆN</b> </td>
                </tr>
                <tr style="height:50px;">
                    <th>NỘI DUNG ĐÁNH GIÁ</th>
                    <th>Điểm SV tự đánh giá</th>
                </tr>
            <?php
                foreach ($list_tc1 as $tc){
            ?>
                <tr> 
                    <td><b><?php echo $tc['nd_tc1']; ?></b></td>
                    <td></td>
                </tr> 
                <?php 
                foreach($list_tc2 as $tc2) {
                    if ($tc2['id_tc1'] == $tc['id_tc1']){
                ?>
                    <tr>
                        <?php
                            $temp ='id_tc2';
                            if(check_exist_list($tc2['id_tc2'],$list_tc3,$temp) ){
                                ?>
                            <td><i><?php echo $tc2['nd_tc2']; ?></i></td>
                        <?php
                            }
                            else {
                                ?>
                                <td><?php echo $tc2['nd_tc2']; ?></td>
                        <?php
                            }

                        ?>
                        
                        <?php
                        
                        $temp ='id_tc2';
                        if (check_exist_list($tc2['id_tc2'],$list_tc3,$temp) ){
                        ?>  
                            <td></td>
                        <?php }else{ 
                                $dem_tc2++;
                            ?>
                            <td class="">
                                <input type="number" name="<?php echo "id_tc2=".$tc2['id_tc2']; ?>" placeholder="nhập điểm" 
                                                            value="<?php 
                                                            $temp = "id_tc2={$tc2['id_tc2']}";
                                                            if (empty($error_diem[$temp]))
                                                            if (isset($diem[$temp]))
                                                                echo  $diem[$temp];
                                                            ?>">
                                
                            </td>
                        <?php } 
                        }?>
                    </tr>

                <?php
                    foreach($list_tc3 as $tc3) {
                        if ($tc3['id_tc2'] == $tc2['id_tc2'] && $tc['id_tc1'] == $tc2['id_tc1'] ){
                            $dem_tc3++;
                ?>
                        <tr>
                            <td><?php echo $tc3['nd_tc3']; ?></td>
                            <?php
                            if ($tc3['id_tc2']==1){
                            ?>
                             <td><input type="radio" name="dtb" value="<?php  echo "id_tc3=".$tc3['id_tc3']; ?>"  <?php 
                                                 $temp = "id_tc3={$tc3['id_tc3']}";
                                                if (empty($error_diem['dtb']))
                                                    if (isset($diem[$temp]))
                                                    {
                                                        echo 'checked="checked"';
                                                    }
                                            ?>
                                > 
                            </td>
                             <?php
                            }else{
                             ?>
                            <td><input type="number" name="<?php echo "id_tc3=".$tc3['id_tc3']; ?>" id="" placeholder="nhập điểm" 
                                value="<?php 
                                                $temp = "id_tc3={$tc3['id_tc3']}";
                                                        if (empty($error_diem[$temp]))
                                                        if (isset($diem[$temp]))    
                                                            echo  $diem[$temp];
                                        ?>">
                            </td>
                        </tr>
                <?php
                    }}  
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
