import 'dart:convert';

import 'package:currency_picker/currency_picker.dart';
import 'package:currency_symbols/currency_symbols.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:rot_application/app/data/constants/string_constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../common/common_widgets.dart';
import '../../../../common/convert_currency_to_countrycode.dart';
import '../../../../common/text_styles.dart';
import '../../../data/apis/api_constants/api_key_constants.dart';
import '../../../data/apis/api_methods/api_methods.dart';
import '../../../data/apis/api_models/get_card_list_model.dart';
import '../../../data/apis/api_models/get_money_converter_rate_model.dart';
import '../../../data/apis/api_models/get_wallet_by_currency_model.dart';
import '../../../data/apis/api_models/get_wallet_list_model.dart';
import '../../../data/constants/icons_constant.dart';
import '../../../routes/app_pages.dart';

class ChangeController extends GetxController {
  final inAsyncCall = false.obs;
  final upValue = 0.obs;
  TextEditingController sendMoneyController = TextEditingController();
  TextEditingController recipientMoneyController = TextEditingController();
  final sendCurrencyName = 'INR'.obs;
  final recipientCurrencyName = 'USD'.obs;
  final moneyConvertorRate = '0.0119'.obs;
  List<CardListData> cardList = [];
  String userId = '';
  final deliverWalletName = ''.obs;
  final totalPayMoney = ''.obs;
  final totalFeeMoney = ''.obs;
  final walletMoney = '0'.obs;
  final cardDataPresent = false.obs;
  final selectedPayCard = 0.obs;
  final selectedReceivedCard = 0.obs;
  Map<String, String?> parameter = Get.parameters;
  List<GetWalletListData> myWalletList = [];
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
  MoneyConverterRateModel? moneyConverterRateModel;

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
    getWalletListApi();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  String getCountryCode(int index) {
    String countryCodeName = convertCurrencyToCountryCode[index == 0
            ? sendCurrencyName.value
            : recipientCurrencyName.value] ??
        'US';
    print("CountryCodeName:-$countryCodeName");
    return countryCodeName;
  }

  clickOnReviewButton() {
    Map<String, String> reviewData = {
      ApiKeyConstants.userId: userId,
      'sendCurrencyName': sendCurrencyName.value,
      'sendCurrencyImage': getCountryCode(0),
      'recipientCurrencyName': recipientCurrencyName.value,
      'sendMoney': sendMoneyController.text.toString(),
      'recipientMoney': recipientMoneyController.text.toString(),
      'converterRate': moneyConvertorRate.value,
      'totalPayMoney': totalPayMoney.value,
      'totalFeeMoney': totalFeeMoney.value,
      'from': upValue.value == 0 ? 'card' : 'wallet',
      'walletAmount':
          upValue.value == 0 ? '0' : parameter[ApiKeyConstants.wallet] ?? '0',
      'cardNumber': upValue.value == 0
          ? '${cardList[selectedPayCard.value].cardNumber}'
          : '0',
    };
    Get.toNamed(Routes.SELL_MONEY_REVIEW, parameters: reviewData);
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

  void increment() => count.value++;

  clickOnListTile({required int index}) {
    upValue.value = index;
    increment();
    print(' upValue.value:::::::::::::${upValue.value}');
  }

  void changePaySelectedCardIndex({required int index}) {
    selectedPayCard.value = index;
    increment();
  }

  void changeReceivedSelectedCardIndex({required int index}) {
    selectedReceivedCard.value = index;
    increment();
  }

  void clickOnNewCard() async {
    await Get.toNamed(Routes.ADD_NEW_CARD);
    cardDataPresent.value = false;
    getMyCardList(userId);
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

  Future<void> getWalletListApi() async {
    Map<String, String> queryParameters = {
      ApiKeyConstants.userId: userId,
    };
    GetWalletListModel? getWalletListModel =
        await ApiMethods.getMyWalletListApi(queryParameters: queryParameters);
    if (getWalletListModel != null &&
        getWalletListModel.status == "1" &&
        getWalletListModel.data!.isNotEmpty) {
      myWalletList = getWalletListModel.data!;
      deliverWalletName.value = myWalletList[0].name ?? 'USD';
      increment();
    }
  }

  clickOnFundsDestination() {
    showModalBottomSheet(
      context: Get.context!,
      constraints: BoxConstraints(maxHeight: 600.px, minHeight: 300.px),
      builder: (BuildContext context) {
        return Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(
              height: 20.px,
            ),
            Text(
              StringConstants.availableWallets,
              style: Theme.of(context).textTheme.displayMedium?.copyWith(
                    color: Theme.of(context).primaryColor,
                    fontSize: 16.px,
                  ),
            ),
            ListView.builder(
              itemCount: myWalletList.length,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              padding: EdgeInsets.all(10.px),
              itemBuilder: (context, index) {
                GetWalletListData item = myWalletList[index];
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ListTile(
                    onTap: () {
                      deliverWalletName.value = item.name ?? '0';
                      Get.back();
                    },
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.px),
                      side: BorderSide(
                          color: Theme.of(context).primaryColor, width: 1.px),
                    ),
                    leading: CommonWidgets.appIcons(
                        assetName: IconConstants.icWalletPayment),
                    title: Text(
                      item.name ?? '',
                      style: MTextThemeStyle.titleMedium(
                        color: Colors.black87,
                      ),
                    ),
                    trailing: Text(
                      '${cSymbol(item.name ?? 'USD')} ${item.amount}',
                      style: MTextThemeStyle.titleMedium(
                        color: Colors.black87,
                      ),
                    ),
                  ),
                );
              },
            ),
          ],
        );
      },
    );
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
        if (index == 0) {
          sendCurrencyName.value = currency.code;
          await getMoneyConverterApi(sendCurrencyName.value);
          changeSendMoney(sendMoneyController.text);
          increment();
        } else {
          getConversationRate(currency.code, moneyConverterRateModel!);
          recipientCurrencyName.value = currency.code;
          changeSendMoney(sendMoneyController.text);
          increment();
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
}
