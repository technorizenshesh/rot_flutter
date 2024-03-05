import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:rot_application/app/data/constants/icons_constant.dart';
import 'package:rot_application/app/data/constants/string_constants.dart';

class PaymentMethodController extends GetxController {
  final count = 0.obs;
  final upValue = 0.obs;

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
      'title': StringConstants.wallet,
      'icon': IconConstants.icWalletPayment,
    },
    {
      'title': StringConstants.cardPayment,
      'icon': IconConstants.icCardPayment,
    },
    {
      'title': StringConstants.payMyFriend,
      'icon': IconConstants.icPayMyFriends,
    }
  ];

  @override
  void onInit() {
    super.onInit();
    startListener();
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

  clickOnContinueButton() {}

  clickOnEyeButton() {}

  clickOnShareButton() {}

  clickOnListTile({required int index}) {
    upValue.value = index;
    increment();
    print(' upValue.value:::::::::::::${ upValue.value}');
  }
}
