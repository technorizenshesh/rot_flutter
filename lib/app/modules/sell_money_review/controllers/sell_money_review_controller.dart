import 'package:currency_symbols/currency_symbols.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../common/common_widgets.dart';
import '../../../data/apis/api_constants/api_key_constants.dart';
import '../../../data/apis/api_methods/api_methods.dart';
import '../../../data/apis/api_models/response_model.dart';
import '../../../routes/app_pages.dart';

class SellMoneyReviewController extends GetxController {
  final inAsyncCall = false.obs;
  final btnLoading = false.obs;
  TextEditingController sendMoneyController = TextEditingController();
  final sendCurrencyName = 'EUR'.obs;
  final recipientCurrencyName = 'USD'.obs;
  final deliverBankAccount = ''.obs;
  final walletAvailableAmountLater = '0'.obs;
  final recipientMoney = '0'.obs;
  final converterRate = '0'.obs;
  final totalPayMoney = ''.obs;
  final totalFeeMoney = ''.obs;
  Map<String, String?> parameter = Get.parameters;

  final count = 0.obs;
  @override
  void onInit() async {
    super.onInit();
    sendCurrencyName.value = parameter['sendCurrencyName'] ?? 'EUR';
    recipientCurrencyName.value = parameter['recipientCurrencyName'] ?? 'USD';
    totalPayMoney.value = parameter['totalPayMoney'] ?? '0';
    totalFeeMoney.value = parameter['totalFeeMoney'] ?? '0';
    converterRate.value = parameter['converterRate'] ?? '0';
    sendMoneyController.text =
        "${cSymbol(parameter['sendCurrencyName'] ?? 'EUR')} ${parameter['sendMoney']}";
    recipientMoney.value = parameter['recipientMoney'] ?? '0';
    if (parameter['from'] == 'wallet') {
      walletAvailableAmountLater.value =
          ((double.parse(parameter['walletAmount'] ?? '0').toInt() -
                  double.parse(parameter['totalPayMoney'] ?? '0').toInt()))
              .toString();
    }
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void increment() => count.value++;

  void clickOnDeliverBank() {
    Get.toNamed(Routes.ACCOUNTS);
  }

  /* Future<void> getTokenForSellMoney() async {
    try {
      Map<String, dynamic> getTokenParameters = {
        ApiKeyConstants.cardNumber: cardListData.cardNumber,
        ApiKeyConstants.expiryMonth:
        cardListData.expireDate.toString().substring(0, 2),
        ApiKeyConstants.expiryYear:
        '20${cardListData.expireDate.toString().substring(3, 5)}',
        ApiKeyConstants.cvcCode: cardListData.cvc,
      };
      print("bodyParamForToken:-$getTokenParameters");
      TokenModel? tokenModel =
      await ApiMethods.getTokenApi(bodyParams: getTokenParameters);
      if (tokenModel != null &&
          tokenModel.status == '1' &&
          tokenModel.data != null) {
        submitRecharge(tokenModel.data!.id!);
        print('Successfully completed....');
      } else {
        print('Failed to get token....');
        CommonWidgets.showMyToastMessage('Your card number is incorrect...');
        btnLoading.value = false;
      }
    } catch (e) {
      print('Error:- ${e.toString()}');
      CommonWidgets.showMyToastMessage('Your card number is incorrect...');
      btnLoading.value = false;
    }
  }*/

  clickOnSellButton() {
    if (parameter['from'] == 'wallet') {
      CommonWidgets.showMyToastMessage(
          'Sell money from wallet this is under working process.....');
    } else {
      submitMoneySell('678js945wkjlskjl');
    }
  }

  Future<void> submitMoneySell(String token) async {
    try {
      Map<String, dynamic> submitRechargeParameters = {
        ApiKeyConstants.userId: parameter[ApiKeyConstants.userId],
        ApiKeyConstants.token: token,
        ApiKeyConstants.amount: parameter['totalPayMoney'],
        ApiKeyConstants.payCardId: parameter[ApiKeyConstants.cardId],
        ApiKeyConstants.changeFrom: parameter['sendCurrencyName'],
        ApiKeyConstants.changeTo: parameter['recipientCurrencyName'],
      };
      inAsyncCall.value = true;
      print("bodyParamForSubmitRecharge:-$submitRechargeParameters");
      ResponseModel? response = await ApiMethods.submitSellMoneyApi(
          queryParameters: submitRechargeParameters);
      if (response != null && response.status == 1) {
        print('Successfully completed sell to money amount ....');
        CommonWidgets.showMyToastMessage(
            'Successfully completed sell to money amount ....');
        Get.back();
        Get.back();
      } else {
        print('Failed to recharge....');
        CommonWidgets.showMyToastMessage('Failed sell to money amount ...');
      }
    } catch (e) {
      print('Error:- ${e.toString()}');
      CommonWidgets.showMyToastMessage('Failed sell to money amount  ...');
    }
    inAsyncCall.value = false;
  }
}
