<?php
	class Config {
		public static $db_product = "product_list";
		public static $db_order = "order_list";
		public static $db_order_status = "order_status";
		public static $db_payment = "payment_type";
		public static $db_order_detail = "order_detail";
		public static $db_manufacturer = "manufacturer";
		public static $db_account = "account_list";
		public static $line_id = "1591021350";
		public static $line_secret = "49d286199c615f1d311b56a2910357f5";
		public static $paypal_business_email = "fgh351279@gmail.com";
		public static $paypal_return_url = 'http://fcorder.fcudata.science/payment-successful.html';
		public static $paypal_cancel_url = 'http://fcorder.fcudata.science/payment-cancelled.html';
		public static $paypal_notify_url = 'http://fcorder.fcudata.science/PayPalPaid.php';
	}

?>
