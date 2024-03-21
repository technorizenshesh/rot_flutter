import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../common/common_widgets.dart';
import '../../../data/apis/api_constants/api_key_constants.dart';
import '../../../data/apis/api_methods/api_methods.dart';
import '../../../data/apis/api_models/response_model.dart';

class AddNewCardController extends GetxController {
  final count = 0.obs;
  final btnLoading = false.obs;
  bool isLightTheme = false;
  String cardNumber = '';
  String expiryDate = '';
  String cardHolderName = '';
  String cvvCode = '';
  bool isCvvFocused = false;
  bool useGlassMorphism = false;
  bool useBackgroundImage = false;
  bool useFloatingAnimation = true;
  final OutlineInputBorder border = OutlineInputBorder(
    borderSide: BorderSide(
      color: Colors.grey.withOpacity(0.7),
      width: 2.0,
    ),
  );
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  FocusNode focusCardNumber = FocusNode();
  FocusNode focusMonth = FocusNode();
  FocusNode focusYear = FocusNode();
  FocusNode focusCvv = FocusNode();
  FocusNode focusCardHoldersName = FocusNode();

  final isCardNumber = false.obs;
  final isMonth = false.obs;
  final isYear = false.obs;
  final isCvv = false.obs;
  final isCardHoldersName = false.obs;

  TextEditingController cardNumberController = TextEditingController();
  TextEditingController monthController = TextEditingController();
  TextEditingController yearController = TextEditingController();
  TextEditingController cvvController = TextEditingController();
  TextEditingController cardHoldersNameController = TextEditingController();
  Map<String, String?> parameters = Get.parameters;

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
    focusMonth.addListener(onFocusChange);
    focusYear.addListener(onFocusChange);
    focusCvv.addListener(onFocusChange);
    focusCardHoldersName.addListener(onFocusChange);
  }

  void onFocusChange() {
    isCardNumber.value = focusCardNumber.hasFocus;
    isMonth.value = focusMonth.hasFocus;
    isYear.value = focusYear.hasFocus;
    isCvv.value = focusCvv.hasFocus;
    isCardHoldersName.value = focusCardHoldersName.hasFocus;
  }

  clickOnSave() {
    if (cardHolderName.isNotEmpty &&
        expiryDate.isNotEmpty &&
        cvvCode.isNotEmpty &&
        cardNumber.isNotEmpty) {
      btnLoading.value = true;
      addNewCard();
    } else {
      CommonWidgets.showMyToastMessage('Fill all required field ...');
    }
  }

  Future<void> addNewCard() async {
    try {
      Map<String, dynamic> addNewCardParameters = {
        ApiKeyConstants.userId: parameters[ApiKeyConstants.userId],
        ApiKeyConstants.cardNumber: cardNumber,
        ApiKeyConstants.expireDate: expiryDate,
        ApiKeyConstants.cardHolderName: cardHolderName,
        ApiKeyConstants.cvc: cvvCode,
      };
      print("bodyParam:-$addNewCardParameters");
      ResponseModel? response =
          await ApiMethods.addNewCard(bodyParams: addNewCardParameters);
      if (response != null && response.status == 1) {
        CommonWidgets.showMyToastMessage('Successfully complete new card ...');
      } else {
        CommonWidgets.showMyToastMessage('Add new card failed ...');
      }
    } catch (e) {
      print('Error:- ${e.toString()}');
      CommonWidgets.showMyToastMessage('Add new card failed ...');
    }
    btnLoading.value = false;
  }
}
