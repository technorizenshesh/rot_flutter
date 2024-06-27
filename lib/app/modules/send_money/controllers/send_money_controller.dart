import 'dart:convert';

import 'package:currency_picker/currency_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../common/common_widgets.dart';
import '../../../../common/convert_currency_to_countrycode.dart';
import '../../../data/apis/api_constants/api_key_constants.dart';
import '../../../data/apis/api_methods/api_methods.dart';
import '../../../data/apis/api_models/get_card_list_model.dart';
import '../../../data/apis/api_models/get_exist_email_phone_model.dart';
import '../../../data/apis/api_models/get_money_converter_rate_model.dart';
import '../../../data/apis/api_models/get_wallet_by_currency_model.dart';
import '../../../data/constants/icons_constant.dart';
import '../../../data/constants/string_constants.dart';
import '../../../routes/app_pages.dart';

class SendMoneyController extends GetxController {
  final upValue = 0.obs;
  final inAsyncCall = false.obs;
  TextEditingController sendMoneyController = TextEditingController();
  TextEditingController recipientMoneyController = TextEditingController();
  TextEditingController destinationController = TextEditingController();
  final isSendingCountryName = 'Venezuela'.obs;
  final isSendingCountryCurrencyName = 'VES'.obs;
  final sendCurrencyName = 'INR'.obs;
  final recipientCurrencyName = 'USD'.obs;
  final moneyConvertorRate = '0.0119'.obs;
  final totalPayMoney = ''.obs;
  final totalFeeMoney = ''.obs;
  final deliverBankAccount = ''.obs;
  final walletMoney = '0'.obs;
  final type = 'email'.obs;
  List<CardListData> cardList = [];
  String userId = '';
  final cardDataPresent = false.obs;
  final selectedPayCard = 0.obs;
  final selectedReceivedCard = 0.obs;
  Map<String, String?> parameter = Get.parameters;
  MoneyConverterRateModel? moneyConverterRateModel;

  List listOfListTile = [
    {
      'title': StringConstants.cardPayment,
      'icon': IconConstants.icCardPayment,
    },
    {
      'title': StringConstants.wallet,
      'icon': IconConstants.icWalletPayment,
    }
  ];

  final count = 0.obs;
  @override
  void onInit() async {
    super.onInit();
    SharedPreferences sp = await SharedPreferences.getInstance();
    userId = sp.getString(ApiKeyConstants.userId) ?? '';
    sendCurrencyName.value = parameter[ApiKeyConstants.currency] ?? 'INR';
    getMoneyConverterApi(sendCurrencyName.value);
    getWalletMoneyByCurrencyApi();
    getMyCardList(userId);
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

  String getCountryCode(int index) {
    String countryCodeName = 'US';
    switch (index) {
      case 0:
        {
          countryCodeName = convertCurrencyToCountryCode[
                  isSendingCountryCurrencyName.value] ??
              'US';
        }
        break;
      case 1:
        {
          countryCodeName =
              convertCurrencyToCountryCode[sendCurrencyName.value] ?? 'US';
        }
        break;
      case 2:
        {
          countryCodeName =
              convertCurrencyToCountryCode[recipientCurrencyName.value] ?? 'US';
        }
        break;
    }
    print("CountryCodeName:-$countryCodeName");
    return countryCodeName;
  }

  void changeSendMoney(String value) {
    recipientMoneyController.text =
        (double.parse(value) * double.parse(moneyConvertorRate.value))
            .toStringAsFixed(3);
    totalFeeMoney.value = ((double.parse(recipientMoneyController.text)) * 0.12)
        .toStringAsFixed(3);
    totalPayMoney.value =
        (((double.parse(recipientMoneyController.text)) * 0.12) +
                ((double.parse(recipientMoneyController.text))))
            .toStringAsFixed(3);
  }

  clickOnListTile({required int index}) {
    upValue.value = index;
    increment();
    print(' upValue.value:::::::::::::${upValue.value}');
  }

  void clickOnBegin() {
    if (destinationController.text.isNotEmpty) {
      checkExistEmailPhoneApi();
    } else {
      CommonWidgets.showMyToastMessage('Please enter email/phone number...');
    }
  }

  void changePaySelectedCardIndex({required int index}) {
    selectedPayCard.value = index;
    increment();
  }

  void changeReceivedSelectedCardIndex({required int index}) {
    selectedReceivedCard.value = index;
    increment();
  }

  void clickOnNewCard() {
    Get.toNamed(Routes.ADD_NEW_CARD);
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

  void showMyCurrencyPicker(int index) {
    showCurrencyPicker(
      context: Get.context!,
      showFlag: true,
      showSearchField: true,
      showCurrencyName: true,
      showCurrencyCode: true,
      theme: CurrencyPickerThemeData(
          inputDecoration: InputDecoration(
        contentPadding: EdgeInsets.all(5.px),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14.px),
          borderSide: BorderSide(
            width: .8.px,
            color: Theme.of(Get.context!).primaryColor,
          ),
        ),
        disabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14.px),
          borderSide: BorderSide(
            width: .8.px,
            color: Theme.of(Get.context!).primaryColor,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14.px),
          borderSide: BorderSide(
            width: .8.px,
            color: Theme.of(Get.context!).primaryColor,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14.px),
          borderSide: BorderSide(
            width: .8.px,
            color: Theme.of(Get.context!).colorScheme.onSecondaryContainer,
          ),
        ),
      )),
      searchHint: StringConstants.currency,
      favorite: ['eur'],
      onSelect: (Currency currency) async {
        switch (index) {
          case 0:
            {
              isSendingCountryName.value = currency.name;
              isSendingCountryCurrencyName.value = currency.code;
            }
            break;
          case 1:
            {
              sendCurrencyName.value = currency.code;
              await getMoneyConverterApi(sendCurrencyName.value);
              changeSendMoney(sendMoneyController.text);
              increment();
            }
            break;
          case 2:
            {
              getConversationRate(currency.code, moneyConverterRateModel!);
              recipientCurrencyName.value = currency.code;
              changeSendMoney(sendMoneyController.text);
              increment();
            }
            break;
        }
        print('Select currency: ${currency.code}');
      },
    );
  }

  getMoneyConverterApi(String fromMoney) async {
    Map<String, String> authorization = {};
    authorization = {'Accept': 'application/json'};
    // try {
    http.Response? response = await http.get(
      Uri.parse(
          'https://v6.exchangerate-api.com/v6/eb2c521ba8c86e9fc9fd15a6/latest/$fromMoney'),
      headers: authorization,
    );
    if (response != null) {
      moneyConverterRateModel =
          MoneyConverterRateModel.fromJson(jsonDecode(response.body));
      getConversationRate(
          recipientCurrencyName.value, moneyConverterRateModel!);
      print("Successfully complete ...........");
    } else {
      print(
          "ERROR::statusCode=${response.statusCode}: :response=${response.body}");
    }
    // } catch (e) {
    //   print("EXCEPTION:: Server Down $e");
    //   CommonWidgets.showMyToastMessage(
    //       'Can not convert money to same currency....');
    // }
  }

  void getConversationRate(String toMoney, MoneyConverterRateModel model) {
    moneyConvertorRate.value =
        model.conversionRates!.toJson()[toMoney].toString();
  }

  Future<void> getWalletMoneyByCurrencyApi() async {
    Map<String, String> queryParameters = {
      ApiKeyConstants.userId: userId,
      ApiKeyConstants.currency: sendCurrencyName.value
    };
    GetWalletByCurrencyModel? getWalletByCurrencyModel =
        await ApiMethods.getMyWalletByCurrencyApi(
            queryParameters: queryParameters);
    if (getWalletByCurrencyModel != null &&
        getWalletByCurrencyModel.status == "1" &&
        getWalletByCurrencyModel.data != null) {
      walletMoney.value = getWalletByCurrencyModel.data!.amount ?? '0';
      increment();
    }
  }

  Future<void> checkExistEmailPhoneApi() async {
    try {
      Map<String, String> queryParameters = {
        ApiKeyConstants.type: type.value,
        ApiKeyConstants.email: destinationController.text.toString(),
      };
      inAsyncCall.value = true;
      ExistEmailPhoneModel? existEmailPhoneModel =
          await ApiMethods.checkEmailPhoneExistApi(
              queryParameters: queryParameters);
      if (existEmailPhoneModel != null &&
          existEmailPhoneModel.status == "1" &&
          existEmailPhoneModel.data != null) {
        CommonWidgets.showMyToastMessage(existEmailPhoneModel.message!);
      } else {
        CommonWidgets.showMyToastMessage(existEmailPhoneModel!.message!);
      }
    } catch (e) {
      CommonWidgets.showMyToastMessage('This user is not registered ....');
    }
    inAsyncCall.value = false;
  }

  selectType() {
    showModalBottomSheet(
      context: Get.context!,
      constraints: BoxConstraints(maxHeight: 400.px, minHeight: 250.px),
      builder: (BuildContext context) {
        return Padding(
          padding: EdgeInsets.only(left: 20.px, right: 20.px),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                height: 20.px,
              ),
              Text(
                StringConstants.selectType,
                style: Theme.of(context).textTheme.displayMedium?.copyWith(
                      fontSize: 18.px,
                    ),
              ),
              SizedBox(
                height: 50.px,
              ),
              ListTile(
                onTap: () {
                  type.value = 'email';
                  Get.back();
                },
                contentPadding:
                    EdgeInsets.symmetric(horizontal: 10.px, vertical: 2.px),
                shape: RoundedRectangleBorder(
                  side: BorderSide(
                    color: type.value == "email" ? Colors.teal : Colors.grey,
                    width: 1.px,
                  ),
                  borderRadius: BorderRadius.circular(10.px),
                ),
                title: Text(
                  StringConstants.email,
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        fontSize: 16.px,
                      ),
                ),
              ),
              SizedBox(
                height: 20.px,
              ),
              ListTile(
                onTap: () {
                  type.value = 'mobile';
                  Get.back();
                },
                contentPadding:
                    EdgeInsets.symmetric(horizontal: 10.px, vertical: 2.px),
                shape: RoundedRectangleBorder(
                  side: BorderSide(
                    color: type.value == "mobile" ? Colors.teal : Colors.grey,
                    width: 1.px,
                  ),
                  borderRadius: BorderRadius.circular(10.px),
                ),
                title: Text(
                  StringConstants.phoneNumber,
                  style: Theme.of(context).textTheme.displayMedium?.copyWith(
                        fontSize: 16.px,
                      ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
