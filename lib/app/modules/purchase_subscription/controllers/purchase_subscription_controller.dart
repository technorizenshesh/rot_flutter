import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../common/common_widgets.dart';
import '../../../data/apis/api_constants/api_key_constants.dart';
import '../../../data/apis/api_methods/api_methods.dart';
import '../../../data/apis/api_models/get_card_list_model.dart';
import '../../../data/apis/api_models/get_subscription_model.dart';
import '../../../data/apis/api_models/get_token_model.dart';
import '../../../data/apis/api_models/user_model.dart';
import '../../../data/constants/icons_constant.dart';
import '../../../data/constants/string_constants.dart';
import '../../../routes/app_pages.dart';

class PurchaseSubscriptionController extends GetxController {
  final count = 0.obs;
  final upValue = 0.obs;
  final selectedCard = 0.obs;
  final walletAmount = '0'.obs;
  final cardDataPresent = false.obs;
  final buttonLoading = false.obs;
  GetSubscriptionData subscriptionData = Get.arguments;
  List<CardListData> cardList = [];
  String userId = '';

  ///TODO Pay for friend
  FocusNode focusFullName = FocusNode();
  FocusNode focusPhoneNumber = FocusNode();
  FocusNode focusEmail = FocusNode();

  final isFullName = false.obs;
  final isPhoneNumber = false.obs;
  final isEmail = false.obs;

  TextEditingController fullNameController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();
  TextEditingController emailController = TextEditingController();

  List listOfListTile = [
    {
      'title': StringConstants.cardPayment,
      'icon': IconConstants.icCardPayment,
    },
    {
      'title': StringConstants.payMyFriend,
      'icon': IconConstants.icPayMyFriends,
    },
    {
      'title': StringConstants.wallet,
      'icon': IconConstants.icWalletPayment,
    }
  ];

  @override
  void onInit() {
    super.onInit();
    getProfileApi();
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

  clickOnPurchaseButton() {
    if (upValue.value == 0) {
      if (cardList.isNotEmpty) {
        getTokenForPurchaseSubscription();
      } else {
        CommonWidgets.showMyToastMessage("Please add card first....");
      }
    } else if (upValue.value == 2) {
      if (int.parse(double.parse(walletAmount.value).toInt().toString()) >=
          int.parse(double.parse(subscriptionData.amount ?? "50")
              .toInt()
              .toString())) {
        purchaseSubscriptionPlanWithoutToken();
      } else {
        CommonWidgets.showMyToastMessage(
            "Insufficient amount please add more amount in wallet....");
      }
    } else {}
  }

  clickOnEyeButton() {}

  clickOnShareButton() {}

  clickOnListTile({required int index}) {
    upValue.value = index;
    increment();
    print(' upValue.value:::::::::::::${upValue.value}');
  }

  void changeSelectedCardIndex({required int index}) {
    selectedCard.value = index;
    increment();
  }

  void clickOnNewCard() async {
    Map<String, String> data = {ApiKeyConstants.userId: userId};
    cardDataPresent.value = false;
    await Get.toNamed(Routes.ADD_NEW_CARD, parameters: data);
    getMyCardList(userId);
  }

  Future<void> getProfileApi() async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    userId = sp.getString(ApiKeyConstants.userId) ?? '';
    getMyCardList(userId);
    Map<String, String> queryParameters = {
      ApiKeyConstants.userId: userId,
    };
    UserModel? userModel =
        await ApiMethods.getProfile(queryParameters: queryParameters);
    if (userModel != null) {
      walletAmount.value = userModel.userData!.wallet ?? '0';
    }
  }

  Future<void> getMyCardList(String userid) async {
    try {
      Map<String, dynamic> addNewCardParameters = {
        ApiKeyConstants.userId: userid,
      };
      print("bodyParam:-$addNewCardParameters");
      CardListModel? cardListModel =
          await ApiMethods.getCardListApi(bodyParams: addNewCardParameters);
      if (cardListModel != null && cardListModel.status == '1') {
        cardList = cardListModel.data!;
        cardDataPresent.value = true;
      } else {
        cardDataPresent.value = false;
        CommonWidgets.showMyToastMessage('Card are not added till now ...');
      }
    } catch (e) {
      cardDataPresent.value = false;
      print('Error:- ${e.toString()}');
      CommonWidgets.showMyToastMessage('Card are not added till now ...');
    }
  }

  Future<void> getTokenForPurchaseSubscription() async {
    try {
      Map<String, dynamic> getTokenParameters = {
        ApiKeyConstants.cardNumber: cardList[selectedCard.value].cardNumber,
        ApiKeyConstants.expiryMonth:
            cardList[selectedCard.value].expireDate!.substring(0, 2),
        ApiKeyConstants.expiryYear:
            '20${cardList[selectedCard.value].expireDate!.substring(3, 5)}',
        ApiKeyConstants.cvcCode: cardList[selectedCard.value].cvc!,
      };
      buttonLoading.value = true;
      print("bodyParamForToken:-$getTokenParameters");
      TokenModel? tokenModel =
          await ApiMethods.getTokenApi(bodyParams: getTokenParameters);
      if (tokenModel != null &&
          tokenModel.status == '1' &&
          tokenModel.data != null) {
        purchaseSubscriptionPlanWithToken(tokenModel.data!.id!);
        print('Successfully completed....');
      } else {
        print('Failed to get token....');
        CommonWidgets.showMyToastMessage('Your card number is incorrect...');
        buttonLoading.value = false;
      }
    } catch (e) {
      print('Error:- ${e.toString()}');
      CommonWidgets.showMyToastMessage('Your card number is incorrect...');
      buttonLoading.value = false;
    }
  }

  Future<void> purchaseSubscriptionPlanWithToken(String token) async {
    try {
      Map<String, dynamic> purchaseQueryParameters = {
        ApiKeyConstants.userId: userId,
        ApiKeyConstants.subscriptionId: subscriptionData.id,
        ApiKeyConstants.subscriptionName: subscriptionData.name,
        ApiKeyConstants.paymentType: 'Card',
        ApiKeyConstants.amount: subscriptionData.amount,
        ApiKeyConstants.token: token
      };
      http.Response? response = await ApiMethods.purchaseSubscriptionApi(
          queryParameters: purchaseQueryParameters);

      if (response != null) {
        Map<String, dynamic> jsonData = jsonDecode(response.body);
        if (jsonData['status'] == "1") {
          print("Successfully complete.....");
          CommonWidgets.showMyToastMessage(
              "Thank you for purchase subscription plan ...");
          Get.back();
        } else {
          CommonWidgets.showMyToastMessage(
              "Puchase Subscription Plan are failed to complete...");
          print("Failed1.....");
        }
      } else {
        CommonWidgets.showMyToastMessage(
            "Puchase Subscription Plan are failed to complete...");
        print("Failed2.....");
      }
    } catch (e) {
      print("Error 1:- ${e.toString()}");
    }
    buttonLoading.value = false;
  }

  Future<void> purchaseSubscriptionPlanWithoutToken() async {
    try {
      Map<String, dynamic> purchaseQueryParameters = {
        ApiKeyConstants.userId: userId,
        ApiKeyConstants.subscriptionId: subscriptionData.id,
        ApiKeyConstants.subscriptionName: subscriptionData.name,
        ApiKeyConstants.paymentType: 'Wallet',
        ApiKeyConstants.amount: subscriptionData.amount,
        ApiKeyConstants.token: ''
      };
      buttonLoading.value = true;
      print("Purchase Query:::::$purchaseQueryParameters");
      http.Response? response = await ApiMethods.purchaseSubscriptionApi(
          queryParameters: purchaseQueryParameters);

      if (response != null) {
        Map<String, dynamic> jsonData = jsonDecode(response!.body);
        if (jsonData['status'] == "1") {
          print("Successfully complete.....");
          CommonWidgets.showMyToastMessage(
              "Thank you for purchase subscription plan ...");
          Get.back();
        } else {
          CommonWidgets.showMyToastMessage(
              "Puchase Subscription Plan are failed to complete...");
          print("Failed1.....");
        }
      } else {
        CommonWidgets.showMyToastMessage(
            "Puchase Subscription Plan are failed to complete...");
        print("Failed2.....");
      }
    } catch (e) {
      print("Error 1:- ${e.toString()}");
    }
    buttonLoading.value = false;
  }
}
