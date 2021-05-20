
<?php

$presql = 'BEGIN PC_BILL_SIGN_UPDATE(:EMPCODE,:SIGN_OBJ_CODE,:PRE_SIGN_OBJ_CODE); END;';            
				$pstmt = oci_parse($conn,$presql);                     
				oci_bind_by_name($pstmt,':EMPCODE',$EMP_CODE); 
				oci_bind_by_name($pstmt,':SIGN_OBJ_CODE',$SIGN_OBJ_CODE);
                oci_bind_by_name($pstmt,':PRE_SIGN_OBJ_CODE',$prev_sign_obj_flag);
				oci_execute($pstmt);
?>
