<?php

require_once $_SERVER['DOCUMENT_ROOT'] . '/lib/FCPayments/Foundation/PaymentsConfig.php';
require_once $_SERVER['DOCUMENT_ROOT'] . '/lib/FCPayments/PaymentsManager/LinePay.php';
require_once $_SERVER['DOCUMENT_ROOT'] . '/lib/FCPayments/PaymentsManager/iSunny.php';

class PaymentsManager
{
    //取得付款所需物件
    public static function getPaymentObject($orderId, $amount, $orderDate, $productName)
    {
        switch (PaymentsConfig::$paymentType) {
            case "1":
                return iSunny::generateiSunnyObject($orderId, $amount, $orderDate);
                break;
            case "2":
                break;
            case "3":
                LinePay::setLinePayHeader();
                return LinePay::getLinePayObject($orderId, $amount, $productName);
            case "4":
                break;
            default:
                return "Error PaymentType";
        }
        return "";
    }

    //取得驗證結果
    public static function getPaymentConfirm($transactionId, $amount)
    {
        switch (PaymentsConfig::$paymentType) {
            case "1":
                break;
            case "2":
                break;
            case "3":
                LinePay::setLinePayHeader();
                return LinePay::ConfirmLinePay($transactionId, $amount);
            case "4":
                break;
            default:
                return "Error PaymentType";
        }
        return "";
    }

    //設定PaymentType
    public static function setPaymentType($paymentType)
    {
        PaymentsConfig::$paymentType = $paymentType;
    }

    //設定帳戶，overload，檢查有幾個parameter
    public static function setAccount()
    {
        $args = func_get_args();

        if(func_num_args() == 1) {

            self::setPaymentId($args[0]);       //目前isunny用到

        } else if(func_num_args() == 2) {

            self::setPaymentIdAndSecret($args[0], $args[1]);       //目前LinePay用到

        }
    }

    private static function setPaymentId($id)
    {
        PaymentsConfig::$Id = $id;
    }

    private static function setPaymentIdAndSecret($id, $secret)
    {
        PaymentsConfig::$Id = $id;
        PaymentsConfig::$Secret = $secret;
    }

    //設定ConfirmURL
    public static function setConfirmURL($url)
    {
        PaymentsConfig::$confirmURL = $url;
    }

    public static function setNoticeURL($url)
    {
        PaymentsConfig::$noticeURL = $url;
    }

    //設定付款所用的貨幣
    public static function setCurrency($currency)
    {
        PaymentsConfig::$Currency = $currency;
    }
}