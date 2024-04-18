import 'package:currency_picker/currency_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:rot_application/app/data/constants/string_constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../common/common_widgets.dart';
import '../../../data/apis/api_constants/api_key_constants.dart';
import '../../../data/apis/api_methods/api_methods.dart';
import '../../../data/apis/api_models/get_card_list_model.dart';
import '../../../data/constants/icons_constant.dart';
import '../../../routes/app_pages.dart';

class ChangeController extends GetxController {
  final inAsyncCall = false.obs;
  final upValue = 0.obs;
  TextEditingController sendMoneyController = TextEditingController();
  TextEditingController recipientMoneyController = TextEditingController();
  final sendCurrencyName = 'EUR'.obs;
  final recipientCurrencyName = 'USD'.obs;
  List<CardListData> cardList = [];
  String userId = '';
  final deliverBankAccount = ''.obs;
  final totalPayMoney = ''.obs;
  final cardDataPresent = false.obs;
  final selectedPayCard = 0.obs;
  final selectedReceivedCard = 0.obs;
  Map<String, String?> parameter = Get.parameters;
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

  void clickOnDeliverBank() {
    Get.toNamed(Routes.ACCOUNTS);
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
      onSelect: (Currency currency) {
        if (index == 0) {
          sendCurrencyName.value = currency.code;
        } else {
          recipientCurrencyName.value = currency.code;
        }
        print('Select currency: ${currency.code}');
      },
    );
  }
}
