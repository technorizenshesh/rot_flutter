import 'dart:convert';

import 'package:currency_picker/currency_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:rot_application/app/data/constants/icons_constant.dart';

import '../../../../common/common_widgets.dart';
import '../../../../common/convert_currency_to_countrycode.dart';
import '../../../data/apis/api_models/get_money_converter_rate_model.dart';
import '../../../data/constants/string_constants.dart';

class ConverterController extends GetxController {
  TextEditingController convertorController = TextEditingController();
  MoneyConverterRateModel? moneyConverterRateModel;
  final convertorCurrency = 'EUR'.obs;
  final convertorCountryName = 'Euro'.obs;
  final count = 0.obs;
  final dataPresent = false.obs;
  List<String> flagIconList = [
    IconConstants.icFlagEur,
    IconConstants.icFlagUsd,
    IconConstants.icFlagGpd,
    IconConstants.icFlagBtc
  ];
  List<String> titleList = [
    'Euro',
    'American Dollar',
    'British Pound',
    'Bitcoin'
  ];
  List<Map<String, String>> items = [
    {
      "title": "Euro",
      "subTitle": "EUR",
      "icon": IconConstants.icFlagEur,
      "amount": "100"
    },
    {
      "title": "American Dollar",
      "subTitle": "USD",
      "icon": IconConstants.icFlagUsd,
      "amount": "109.45"
    },
    {
      "title": "British Pound",
      "subTitle": "GPD",
      "icon": IconConstants.icFlagGpd,
      "amount": "85.95"
    },
    {
      "title": "Bitcoin",
      "subTitle": "BTC",
      "icon": IconConstants.icFlagBtc,
      "amount": "100"
    }
  ];
  List<String> subTitleList = ['EUR', 'USD', 'GBP', 'BIF'];
  List<String> amountList = ['100', '109.45', '85.95', '100'];
  @override
  void onInit() {
    super.onInit();
    convertorController.text = '100';
    getMoneyConverterApi(convertorCurrency.value);
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
  String getCountryCode() {
    String countryCodeName =
        convertCurrencyToCountryCode[convertorCurrency.value] ?? 'ERU';
    return countryCodeName;
  }

  void clickOnSave() {}

  void showMyCurrencyPicker() {
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
        convertorCurrency.value = currency.code;
        convertorCountryName.value = currency.name;
        await getMoneyConverterApi(convertorCurrency.value);
        increment();
        print('Select currency: ${currency.code}');
      },
    );
  }

  getMoneyConverterApi(String fromMoney) async {
    Map<String, String> authorization = {};
    authorization = {'Accept': 'application/json'};
    try {
      http.Response? response = await http.get(
        Uri.parse(
            'https://v6.exchangerate-api.com/v6/eb2c521ba8c86e9fc9fd15a6/latest/$fromMoney'),
        headers: authorization,
      );
      if (response != null) {
        moneyConverterRateModel =
            MoneyConverterRateModel.fromJson(jsonDecode(response.body));
        if (moneyConverterRateModel!.result != "error") {
          dataPresent.value = true;
          print("Successfully complete ...........");
        } else {
          dataPresent.value = false;
          print("Currency exchange not accept ...........");
        }
      } else {
        dataPresent.value = false;
        print(
            "ERROR::statusCode=${response.statusCode}: :response=${response.body}");
      }
    } catch (e) {
      dataPresent.value = false;
      print("EXCEPTION:: Server Down $e");
      CommonWidgets.showMyToastMessage(
          'Can not convert money to same currency....');
    }
    increment();
  }

  String getConversationRate(String toMoney) {
    return moneyConverterRateModel!.conversionRates!
        .toJson()[toMoney]
        .toString();
  }

  String getCurrentValue(String toMoney) {
    return (double.parse(convertorController.text) *
            double.parse(moneyConverterRateModel!.conversionRates!
                .toJson()[toMoney]
                .toString()))
        .toStringAsFixed(2);
  }
}
