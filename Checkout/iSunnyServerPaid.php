<?php
	//iSuuny伺服器通知訂單付款完成

	if( isset($_GET['orderID']) && isset($_POST["transID"]) ) {
        error_log(print_r($_POST['rCodeMsg'],true));
        error_log(print_r("server error", true));

		$orderID = $_GET['orderID'];
		$transID = $_POST['transID'];

		$user = 'FCOrderServer';
		$password = 'fcorderpassword';
		$db = 'FCOrder';
		$host = 'localhost';
	
		$conn = mysqli_connect($host, $user, $password, $db);
		mysqli_query($conn,"SET NAMES 'UTF8'");

		$sql = " UPDATE `order_list` SET `serverPaid`='$transID', `status` = 4 WHERE `orderId`='$orderID' ";
		$result = mysqli_query($conn,$sql) or die ('MySQL query 1 error');
		mysqli_close($conn);
	}

?>
