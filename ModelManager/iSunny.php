<?php
	class iSunny {
		public static function generateiSunnyObject($orderId, $amount, $orderDate) {
			//將付款資料用json格式回傳
			$message = array(
				"orderId" => $orderId,
				// "memberID" => "mh1996320",
				//"memberId" => "ga3830582",
                "memberId" => "zxc1234",
				"procCode" => "010300",
				"amount" => $amount,
				"initDateTime" => $orderDate,
				// "MAC" => getMAC("mh1996320"."010300".$amount.$orderDate),
				//"MAC" => self::getMAC_new("ga3830582"."010300".$amount.$orderDate),
                "MAC" => self::getMAC_new("zxc1234"."010300".$amount.$orderDate),
				"replyURL" => "http://10.0.2.2:8888/Checkout/iSunnyClientPaid.php?orderID=".$orderId,
				"memo" => "",
                "noticeURL" => "http://10.0.2.2:8888/Checkout/iSunnyServerPaid.php?orderID=".$orderId
			);
			return $message;
		}

		// public static function getMAC($plainText) {
		// 	//產生iSunny交易驗證碼

		// 	// 洪邦仁的
		// 	// $KEY = "\x69\x49\x42\x35\x42\x74\x6F\x76\x32\x41\x45\x70\x59\x74\x57\x31\x74\x6D\x52\x30\x67\x32\x4C\x35";
		// 	// $ICV = "\x42\x66\x68\x32\x51\x52\x65\x66";

		// 	// 江宗翰的
		// 	$KEY = "\x50\x55\x30\x5A\x32\x48\x44\x66\x43\x4E\x6A\x53\x46\x79\x71\x50\x34\x75\x6A\x65\x42\x37\x56\x34";
		// 	$ICV = "\x4A\x4E\x61\x39\x6D\x4E\x6A\x4E";

		// 	$encrypt = self::encryptText($plainText, $KEY, $ICV);
		// 	return strtoupper(substr( $encrypt , -16 ));
		// }

		public static function getMAC_new($plainText) {
			//產生iSunny交易驗證碼
			// 江宗翰的
			//$KEY = "\x50\x55\x30\x5A\x32\x48\x44\x66\x43\x4E\x6A\x53\x46\x79\x71\x50\x34\x75\x6A\x65\x42\x37\x56\x34";
			//$ICV = "\x4A\x4E\x61\x39\x6D\x4E\x6A\x4E";

            //陳冠霖的
            //A碼：4836694959627347 744D6C6E71426537
            //B碼：7A7944326F455932 676D585134476336
            $KEY = "\x48\x36\x69\x49\x59\x62\x73\x47\x67\x6D\x58\x51\x34\x47\x63\x36\x74\x4D\x6C\x6E\x71\x42\x65\x37";
            $ICV = "\x7A\x79\x44\x32\x6F\x45\x59\x32";
            
			// test
			// $KEY = "\x53\x64\x63\x63\x34\x6C\x73\x43\x4A\x54\x78\x45\x42\x72\x66\x59\x63\x32\x68\x6A\x76\x69\x38\x33";
			// $ICV = "\x38\x47\x75\x35\x64\x32\x55\x74";

			$encrypt = self::encryptText_new($plainText, $KEY, $ICV);
			return strtoupper(substr( $encrypt , -16 ));
		}

		// private static function encryptText($plainText, $key, $icv) {
		// 	// mcrypt is deprecated in PHP 7
		// 	$padded = self::pkcs5_pad($plainText, mcrypt_get_block_size("tripledes", "cbc")); // mcrypt_get_block_size("tripledes", "cbc") is 8
		// 	$encText = mcrypt_encrypt("tripledes", $key, $padded, "cbc", $icv);
		// 	return self::strToHex($encText);
		// }

		private static function encryptText_new($plainText, $key, $icv) {
			// mcrypt is deprecated in PHP 7
			$padded = self::pkcs5_pad($plainText, 8);
			$encText = openssl_encrypt($padded, "DES-EDE3-CBC", $key, OPENSSL_RAW_DATA | OPENSSL_NO_PADDING, $icv);
			return self::strToHex($encText);
		}

		private static function pkcs5_pad ($text, $blocksize) {
			$pad = $blocksize - (strlen($text) % $blocksize);
			return $text . str_repeat(chr($pad), $pad);
		}
		
		private static function strToHex($string){
			$hex = '';
			for ($i=0; $i<strlen($string); $i++){
				$ord = ord($string[$i]);
				$hexCode = dechex($ord);
				$hex .= substr('0'.$hexCode, -2);
			}
			return strToUpper($hex);
		}

		private static function hexToStr($hex){
			$string='';
			for ($i=0; $i < strlen($hex)-1; $i+=2){
				$string .= chr(hexdec($hex[$i].$hex[$i+1]));
			}
			return $string;
		}
	}
?>
