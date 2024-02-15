import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rot/app/data/constants/string_constants.dart';

class ProfileDetailController extends GetxController
    with GetSingleTickerProviderStateMixin {
  final count = 0.obs;
  late TabController tabController;
  final tabs = [
    const Tab(text: StringConstants.profile),
    const Tab(text: StringConstants.account),
    const Tab(text: StringConstants.reviews),
  ];

  ///PROFILE VIEW MANAGE
  FocusNode focusFirstName = FocusNode();
  FocusNode focusLastName = FocusNode();
  FocusNode focusSellersAddress = FocusNode();
  final isFirstName = false.obs;
  final isLastName = false.obs;
  final isSellersAddress = false.obs;
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController sellersAddressController = TextEditingController();

  ///ACCOUNT VIEW MANAGE
  FocusNode focusDob = FocusNode();
  FocusNode focusGender = FocusNode();
  FocusNode focusEmail = FocusNode();
  FocusNode focusPhone = FocusNode();
  final isDob = false.obs;
  final isGender = false.obs;
  final isEmail = false.obs;
  final icPhone = false.obs;
  TextEditingController dobController = TextEditingController();
  TextEditingController genderController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();

  @override
  void onInit() {
    tabController = TabController(length: 3, vsync: this);
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
    focusFirstName.addListener(onFocusChange);
    focusLastName.addListener(onFocusChange);
    focusSellersAddress.addListener(onFocusChange);
    focusDob.addListener(onFocusChange);
    focusGender.addListener(onFocusChange);
    focusEmail.addListener(onFocusChange);
    focusPhone.addListener(onFocusChange);
  }

  void onFocusChange() {
    isFirstName.value = focusFirstName.hasFocus;
    isLastName.value = focusLastName.hasFocus;
    isSellersAddress.value = focusSellersAddress.hasFocus;
    isDob.value = focusDob.hasFocus;
    isGender.value = focusGender.hasFocus;
    isEmail.value = focusEmail.hasFocus;
    icPhone.value = focusPhone.hasFocus;
  }
}
