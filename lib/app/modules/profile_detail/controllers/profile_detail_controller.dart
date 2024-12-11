import 'dart:io';

import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';
import 'package:rot_application/app/routes/app_pages.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../common/common_widgets.dart';
import '../../../data/apis/api_constants/api_key_constants.dart';
import '../../../data/apis/api_methods/api_methods.dart';
import '../../../data/apis/api_models/get_my_address_model.dart';
import '../../../data/apis/api_models/get_sells_country_model.dart';
import '../../../data/apis/api_models/user_model.dart';
import '../../../data/constants/string_constants.dart';

class ProfileDetailController extends GetxController
    with GetSingleTickerProviderStateMixin {
  final count = 0.obs;
  late TabController tabController;
  final showGander = false.obs;
  final tabs = [
    const Tab(text: StringConstants.profile),
    const Tab(text: StringConstants.account),
    const Tab(text: StringConstants.reviews),
  ];

  ///PROFILE VIEW MANAGE
  FocusNode focusFirstName = FocusNode();
  FocusNode focusLastName = FocusNode();
  FocusNode focusFullName = FocusNode();
  FocusNode focusSellersAddress = FocusNode();
  final isFirstName = false.obs;
  final isLastName = false.obs;
  final isFullName = false.obs;
  final isSellersAddress = false.obs;
  TextEditingController fullNameController = TextEditingController();
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController sellersAddressController = TextEditingController();

  ///ACCOUNT VIEW MANAGE
  FocusNode focusDob = FocusNode();
  FocusNode focusGender = FocusNode();
  FocusNode focusEmail = FocusNode();
  FocusNode focusPhone = FocusNode();
  FocusNode focusWhatsApp = FocusNode();
  final isDob = false.obs;
  final isGender = false.obs;
  final isEmail = false.obs;
  final icPhone = false.obs;
  final icWhatsApp = false.obs;
  final countryCode = 'IN'.obs;
  final whatsAppCountryCode = 'IN'.obs;
  TextEditingController dobController = TextEditingController();
  TextEditingController genderController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController whatsAppController = TextEditingController();
  File? selectedFile;
  String userId = '';

  final inAsyncCall = false.obs;
  Map<String, String> queryParameters = {};

  UserData? userData;

  Map<String, dynamic> bodyParams = {};
  List<SellsCountryData> countryList = [];

  @override
  Future<void> onInit() async {
    tabController = TabController(length: 3, vsync: this);
    SharedPreferences sp = await SharedPreferences.getInstance();
    userId = sp.getString(ApiKeyConstants.userId) ?? '';
    super.onInit();
    startListener();
    inAsyncCall.value = true;
    await onInitWork();
    inAsyncCall.value = false;
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
    focusFullName.addListener(onFocusChange);
    focusSellersAddress.addListener(onFocusChange);
    focusDob.addListener(onFocusChange);
    focusGender.addListener(onFocusChange);
    focusEmail.addListener(onFocusChange);
    focusPhone.addListener(onFocusChange);
    focusWhatsApp.addListener(onFocusChange);
  }

  void onFocusChange() {
    isFirstName.value = focusFirstName.hasFocus;
    isFullName.value = focusFullName.hasFocus;
    isLastName.value = focusLastName.hasFocus;
    isSellersAddress.value = focusSellersAddress.hasFocus;
    isDob.value = focusDob.hasFocus;
    isGender.value = focusGender.hasFocus;
    isEmail.value = focusEmail.hasFocus;
    icPhone.value = focusPhone.hasFocus;
    icWhatsApp.value = focusWhatsApp.hasFocus;
  }

  Future<void> onInitWork() async {
    await getProfileApi();
    await getMyAddress();
    await getCountrySell();
  }

  Future<void> getProfileApi() async {
    queryParameters = {
      ApiKeyConstants.userId: userId,
    };
    UserModel? userModel =
        await ApiMethods.getProfile(queryParameters: queryParameters);
    if (userModel != null) {
      userData = userModel.userData;
      if (userData != null) {
        fullNameController.text = userData!.userName ?? '';
        //sellersAddressController.text = userData!.sellerAddress ?? '';
        dobController.text = userData!.dob ?? '';
        genderController.text = userData!.gender ?? '';
        emailController.text = userData!.email ?? '';
        phoneController.text = userData!.mobile ?? '';
        whatsAppController.text = userData!.whatsappNumber ?? '';
        countryCode.value = userData!.countryCode ?? 'IN';
        whatsAppCountryCode.value = userData!.whatsappCountryCode ?? 'IN';
      }
      increment();
    }
  }

  clickOnCountryCode({required CountryCode value, required index}) {
    if (index == 0) {
      countryCode.value = value.code.toString();
    } else {
      whatsAppCountryCode.value = value.code.toString();
    }
    print('Code' + value.code.toString());
  }

  clickOnSubmitButton() async {
    if (fullNameController.text.trim().isNotEmpty &&
        sellersAddressController.text.trim().isNotEmpty) {
      inAsyncCall.value = true;
      bodyParams = {
        ApiKeyConstants.userId: userId,
        ApiKeyConstants.email: emailController.text,
        ApiKeyConstants.gender: genderController.text,
        ApiKeyConstants.countryCode: countryCode.value,
        ApiKeyConstants.mobile: phoneController.text,
        ApiKeyConstants.whatsappNumber: whatsAppController.text,
        ApiKeyConstants.whatsappCountryCode: whatsAppCountryCode.value,
        ApiKeyConstants.dob: dobController.text,
        ApiKeyConstants.userName: fullNameController.text,
        ApiKeyConstants.sellerAddress: sellersAddressController.text,
      };
      http.Response? response = await ApiMethods.updateProfile(
          bodyParams: bodyParams, imageFile: selectedFile
          // imageMap: {ApiKeyConstants.image:selectedFile}
          );
      if (response != null) {}
      inAsyncCall.value = false;
    } else {
      CommonWidgets.snackBarView(title: StringConstants.allFieldsRequired);
    }
  }

  Future getImage() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      print("Image :-${pickedFile.path}");
      selectedFile = File(pickedFile.path);
      increment();
    } else {
      print('No image selected ...');
    }
  }

  clickOnSellerAddress() async {
    dynamic result = await Get.toNamed(Routes.EDIT_ADDRESS);
    if (result != null) {
      sellersAddressController.text = result.toString();
      increment();
    }
  }

  getMyAddress() async {
    Map<String, dynamic> bodyParams = {
      ApiKeyConstants.userId: userId,
    };
    MyAddressModel? myAddressModel =
        await ApiMethods.getAddressApi(bodyParams: bodyParams);
    if (myAddressModel != null &&
        myAddressModel.status == '1' &&
        myAddressModel.data != null) {
      sellersAddressController.text =
          '${myAddressModel.data![0].street},${myAddressModel.data![0].city},${myAddressModel.data![0].zipcode},'
          '${myAddressModel.data![0].state},${myAddressModel.data![0].country}';
    }
  }

  getCountrySell() async {
    Map<String, dynamic> bodyParams = {
      ApiKeyConstants.userId: userId,
    };
    SellsCountryModel? sellsCountryModel =
        await ApiMethods.getMyProductSellCountryApi(bodyParams: bodyParams);
    if (sellsCountryModel != null &&
        sellsCountryModel.status == '1' &&
        sellsCountryModel.data != null) {
      // countryList = sellsCountryModel.data!;
      for (int i = 0; i < sellsCountryModel.data!.length; i++) {
        if (sellsCountryModel.data!.length > 1) {
          print('index......$i');
          if (i == 0) {
            countryList.add(sellsCountryModel.data![0]);
          } else {
            for (int j = 0; j < countryList.length; j++) {
              if (countryList[j].countryCode ==
                  sellsCountryModel.data![i].countryCode) {
                break;
              } else {
                if (i == countryList.length - 1) {
                  countryList.add(sellsCountryModel.data![i]);
                }
              }
            }
          }
        } else {
          countryList.add(sellsCountryModel.data![0]);
        }
      }
    }
    increment();
  }
}
