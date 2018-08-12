 <?php
     //------------------------------------------
    require_once $_SERVER['DOCUMENT_ROOT'] . '/Foundation/Config.php';
	 
    class PayPal{
		
		//public static $paypalUrl = 'https://www.paypal.com/cgi-bin/webscr';
		
		//sandbox
		private static $paypalUrl = 'https://www.sandbox.paypal.com/cgi-bin/webscr';
		
        public static function getPayPalObject($orderId,$amount){

			$data = [];
			$data['cmd'] = stripslashes('_xclick');
			// $data['no_note'] = stripslashes('1');
			// $data['lc'] = stripslashes('UK');
			// $data['bn'] = stripslashes('PP-BuyNowBF:btn_buynow_LG.gif:NonHostedGuest');
			// $data['first_name'] = stripslashes("Customer's First Name");
			// $data['last_name'] = stripslashes("Customer's Last Name");
			// $data['payer_email'] = stripslashes('customer@example.com');
			
			// Set the PayPal account.
			$data['business'] = Config::$paypal_business_email;

			// Set the PayPal return addresses.
			$data['return'] = stripslashes(Config::$paypal_return_url);
			$data['cancel_return'] = stripslashes(Config::$paypal_cancel_url);
			$data['notify_url'] = stripslashes(Config::$paypal_notify_url);

			// Set the details about the product being purchased, including the amount
			// and currency so that these aren't overridden by the form data.
			$data['item_name'] = 'boxedLunch';
			$data['currency_code'] = 'USD';
			$data['item_number'] = $orderId;
			$data['amount'] = $amount;
			
			// Add any custom fields for the query string.
			//$data['custom'] = USERID;

			// Build the query string from the data.
			$queryString = http_build_query($data);

			//creat payment url
			$payment_url = self::$paypalUrl . '?' . $queryString;
		
            $message = array(
                              "payment_url" => $payment_url
                              );
             
            $message = json_encode($message);
             
            return $message;
        }
		
		public static function payPalServerPaid($db, $data) {
			$status = 3;
			if ($data['payment_status'] === 'Completed'){
				$status = 4;
			}
			if (is_array($data)) {
				$stmt = $db->prepare('UPDATE `order_list` SET `serverPaid`= ?, `status` = ? WHERE `orderId`= ?');
				$stmt->bind_param(
					'sdd',
					$data['txn_id'],
					$status,
					$data['item_number']
				);
				$stmt->execute();
				$stmt->close();

				return $data['item_number'];
			}

			return false;
		}

		public static function payPalClientPaid($db, $data) {
			$status = 3;
			
			if (is_array($data)) {
				$stmt = $db->prepare('UPDATE `order_list` SET `clientPaid`= ?, `status` = ? WHERE `orderId`= ?');
				$stmt->bind_param(
					'sdd',
					$data['txn_id'],
					$status,
					$data['item_number']
				);
				$stmt->execute();
				$stmt->close();

				return $data['item_number'];
			}

			return false;
		}
		public static function verifyTransaction($data) {
	
			$req = 'cmd=_notify-validate';
			foreach ($data as $key => $value) {
				$value = urlencode(stripslashes($value));
				$value = preg_replace('/(.*[^%^0^D])(%0A)(.*)/i', '${1}%0D%0A${3}', $value); // IPN fix
				$req .= "&$key=$value";
			}

			$ch = curl_init(self::$paypalUrl);
			curl_setopt($ch, CURLOPT_HTTP_VERSION, CURL_HTTP_VERSION_1_1);
			curl_setopt($ch, CURLOPT_POST, 1);
			curl_setopt($ch, CURLOPT_RETURNTRANSFER, 1);
			curl_setopt($ch, CURLOPT_POSTFIELDS, $req);
			curl_setopt($ch, CURLOPT_SSLVERSION, 6);
			curl_setopt($ch, CURLOPT_SSL_VERIFYPEER, 1);
			curl_setopt($ch, CURLOPT_SSL_VERIFYHOST, 2);
			curl_setopt($ch, CURLOPT_FORBID_REUSE, 1);
			curl_setopt($ch, CURLOPT_CONNECTTIMEOUT, 30);
			curl_setopt($ch, CURLOPT_HTTPHEADER, array('Connection: Close'));
			$res = curl_exec($ch);

			if (!$res) {
				$errno = curl_errno($ch);
				$errstr = curl_error($ch);
				curl_close($ch);
				throw new Exception("cURL error: [$errno] $errstr");
			}

			$info = curl_getinfo($ch);

			// Check the http response
			$httpCode = $info['http_code'];
			if ($httpCode != 200) {
				throw new Exception("PayPal responded with http code $httpCode");
			}

			curl_close($ch);

			return $res === 'VERIFIED';
		}
    }
 ?>
