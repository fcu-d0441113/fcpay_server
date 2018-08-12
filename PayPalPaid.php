<?php

$dbConfig = [
	'host' => 'localhost',
	'username' => 'FCOrderServer',
	'password' => 'fcorderpassword',
	'name' => 'FCOrder'
];


// Include Functions
require_once $_SERVER['DOCUMENT_ROOT'] . '/ModelManager/PayPal.php';

// Check if paypal request or response
if (isset($_POST["txn_id"]) && isset($_POST["txn_type"])) {
	// Handle the PayPal response.

	// Create a connection to the database.
	$db = new mysqli($dbConfig['host'], $dbConfig['username'], $dbConfig['password'], $dbConfig['name']);

	// Check connection
	if ($db->connect_error) {
		die("Connection failed: " . $db->connect_error);
	}
	
	// Assign posted variables to local data array.
	$data = [
		'item_name' => $_POST['item_name'],
		'item_number' => $_POST['item_number'],
		'payment_status' => $_POST['payment_status'],
		'payment_amount' => $_POST['mc_gross'],
		'payment_currency' => $_POST['mc_currency'],
		'txn_id' => $_POST['txn_id'],
		'receiver_email' => $_POST['receiver_email'],
		'payer_email' => $_POST['payer_email'],
		'custom' => $_POST['custom'],
	];

	if (PayPal::payPalClientPaid($db, $data) !== false) {
		// Payment status successfully update.
	}
	
	// We need to verify the transaction comes from PayPal and check we've not
	// already processed the transaction before adding the payment to our
	// database.
	if (PayPal::verifyTransaction($_POST)) {
		if (PayPal::payPalServerPaid($db, $data) !== false) {
			// Payment status successfully update.
		}
	}
	$db->close();
}
