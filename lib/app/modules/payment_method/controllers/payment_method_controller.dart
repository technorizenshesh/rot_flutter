import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:rot_application/app/data/constants/icons_constant.dart';
import 'package:rot_application/app/data/constants/string_constants.dart';
import 'package:rot_application/app/routes/app_pages.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../common/common_widgets.dart';
import '../../../data/apis/api_constants/api_key_constants.dart';
import '../../../data/apis/api_methods/api_methods.dart';
import '../../../data/apis/api_models/get_card_list_model.dart';
import '../../../data/apis/api_models/get_product_details_model.dart';
import '../../../data/apis/api_models/user_model.dart';

class PaymentMethodController extends GetxController {
  final count = 0.obs;
  final upValue = 0.obs;
  final selectedCard = 0.obs;
  final walletAmount = '0'.obs;
  final cardDataPresent = false.obs;
  GetProductDetailsModel productDetailsModel = Get.arguments;
  List<CardListData> cardList = [];
  String userId = '';

  ///TODO Card
  FocusNode focusCardNumber = FocusNode();
  FocusNode focusCardHoldersName = FocusNode();
  FocusNode focusMonth = FocusNode();
  FocusNode focusYear = FocusNode();
  FocusNode focusCvv = FocusNode();

  TextEditingController cardNumberController = TextEditingController();
  TextEditingController cardHoldersNameController = TextEditingController();
  TextEditingController monthController = TextEditingController();
  TextEditingController yearController = TextEditingController();
  TextEditingController cvvController = TextEditingController();

  final isCardNumber = false.obs;
  final isCardHoldersName = false.obs;
  final isMonth = false.obs;
  final isYear = false.obs;
  final isCvv = false.obs;
  final hideCvv = false.obs;

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
    startListener();
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

  void startListener() {
    focusCardNumber.addListener(onFocusChange);
    focusCardHoldersName.addListener(onFocusChange);
    focusMonth.addListener(onFocusChange);
    focusYear.addListener(onFocusChange);
    focusCvv.addListener(onFocusChange);
    focusFullName.addListener(onFocusChange);
    focusPhoneNumber.addListener(onFocusChange);
    focusEmail.addListener(onFocusChange);
  }

  void onFocusChange() {
    isCardNumber.value = focusCardNumber.hasFocus;
    isCardHoldersName.value = focusCardHoldersName.hasFocus;
    isMonth.value = focusMonth.hasFocus;
    isYear.value = focusYear.hasFocus;
    isCvv.value = focusCvv.hasFocus;
    isFullName.value = focusFullName.hasFocus;
    isPhoneNumber.value = focusPhoneNumber.hasFocus;
    isEmail.value = focusEmail.hasFocus;
  }

  clickOnContinueButton() {
    switch (upValue.value) {
      case 0:
        {
          Map<String, String> data = {
            'method': 'Card',
            'card_id': cardList[selectedCard.value].id.toString(),
            'card_number': cardList[selectedCard.value].cardNumber.toString()
          };
          Get.toNamed(Routes.DELIVERY_SUMMARY,
              arguments: productDetailsModel, parameters: data);
        }
        break;
      case 1:
        {}
        break;
      case 2:
        {
          Map<String, String> data = {
            'method': 'Wallet',
            'amount': walletAmount.toString()
          };
          Get.toNamed(Routes.DELIVERY_SUMMARY,
              arguments: productDetailsModel, parameters: data);
        }
        break;
    }
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

  void clickOnNewCard() {
    Get.toNamed(Routes.ADD_NEW_CARD);
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
}
