import 'package:country_picker/country_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:rot_application/app/data/apis/api_constants/api_key_constants.dart';
import 'package:rot_application/app/data/apis/api_models/get_admin_address_model.dart';
import 'package:rot_application/app/data/apis/api_models/get_my_address_model.dart';
import 'package:rot_application/app/data/apis/api_models/get_place_by_zipcode_model.dart';
import 'package:rot_application/app/data/apis/api_models/get_simple_model.dart';
import 'package:rot_application/app/data/constants/string_constants.dart';
import 'package:rot_application/common/common_widgets.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../data/apis/api_methods/api_methods.dart';
import '../../../data/apis/api_models/get_country_model.dart';

class EditAddressController extends GetxController {
  final count = 0.obs;
  final lat = '22.7196'.obs;
  final lon = '75.8577'.obs;
  final countryCode = 'IN'.obs;
  final countryId = '101'.obs;
  FocusNode focusNumber = FocusNode();
  FocusNode focusState = FocusNode();
  FocusNode focusStreetName = FocusNode();
  FocusNode focusZipCode = FocusNode();
  FocusNode focusCity = FocusNode();
  FocusNode focusCountry = FocusNode();
  FocusNode focusFloor = FocusNode();
  FocusNode focusDoor = FocusNode();

  final isNumber = false.obs;
  final isState = false.obs;
  final isStreetName = false.obs;
  final isZipCode = false.obs;
  final isCity = false.obs;
  final isFloor = false.obs;
  final isDoor = false.obs;
  final isCountry = false.obs;
  final isLoading = false.obs;

  TextEditingController numberController = TextEditingController();
  TextEditingController floorController = TextEditingController();
  TextEditingController doorController = TextEditingController();
  TextEditingController streetNameAndNumberController = TextEditingController();
  TextEditingController zipCodeController = TextEditingController();
  TextEditingController stateController = TextEditingController();
  TextEditingController cityController = TextEditingController();
  TextEditingController countryController = TextEditingController();
  TextEditingController searchController = TextEditingController();

  String userId = '';

  List<CountryData> countryList = [];
  List<CountryData> filterCountryList = [];

  @override
  void onInit() async {
    super.onInit();
    SharedPreferences sp = await SharedPreferences.getInstance();
    userId = sp.getString(ApiKeyConstants.userId) ?? '';
    getCountryApi();
    getMyAddress();
    startListener();
    countryController.text = 'India';
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
    focusNumber.addListener(onFocusChange);
    focusState.addListener(onFocusChange);
    focusStreetName.addListener(onFocusChange);
    focusZipCode.addListener(onFocusChange);
    focusCountry.addListener(onFocusChange);
    focusFloor.addListener(onFocusChange);
    focusDoor.addListener(onFocusChange);
  }

  void onFocusChange() {
    isNumber.value = focusNumber.hasFocus;
    isState.value = focusState.hasFocus;
    isStreetName.value = focusStreetName.hasFocus;
    isZipCode.value = focusZipCode.hasFocus;
    isCountry.value = focusCountry.hasFocus;
    isFloor.value = focusFloor.hasFocus;
    isDoor.value = focusDoor.hasFocus;
  }

  clickOnSaveButton() async {
    await submitAddressFromApi();
    String address =
        '${streetNameAndNumberController.text},${cityController.text},${doorController.text},${zipCodeController.text},'
        '${stateController.text},${countryController.text},';

    Get.back(result: address);
  }

  Future<void> getPlaceFromApi() async {
    GetPlacesByZipcodeModel? getPlacesByZipcodeModel =
        await ApiMethods.getPlaceByZipCodeApi(
            countryCode: countryCode.value, zipcode: zipCodeController.text);
    if (getPlacesByZipcodeModel != null &&
        getPlacesByZipcodeModel.places != null &&
        getPlacesByZipcodeModel.places!.isNotEmpty) {
      streetNameAndNumberController.text =
          getPlacesByZipcodeModel.places![0].placeName ?? '';
      stateController.text = getPlacesByZipcodeModel.places![0].state ?? '';
      cityController.text = getPlacesByZipcodeModel.places![0].placeName ?? '';
      lat.value =
          getPlacesByZipcodeModel.places![0].latitude.toString() ?? '22.7196';
      lon.value =
          getPlacesByZipcodeModel.places![0].longitude.toString() ?? '75.8577';
    } else {
      print('Invalid zipcode...');
      //CommonWidgets.showMyToastMessage('Invalid zipcode...');
    }
  }

  Future<void> getAdminLocationApi() async {
    Map<String, String> queryParameter = {
      ApiKeyConstants.country: countryId.value,
      ApiKeyConstants.zipCode: zipCodeController.text,
    };
    AdminAddressModel? adminAddressModel =
        await ApiMethods.getPlaceByCountryCodeAndZipCode(
            bodyParams: queryParameter);
    if (adminAddressModel != null &&
        adminAddressModel.data != null &&
        adminAddressModel.data!.isNotEmpty) {
      streetNameAndNumberController.text =
          adminAddressModel.data![0].location ?? '';
      stateController.text = adminAddressModel.data![0].state ?? '';
      cityController.text = adminAddressModel.data![0].city ?? '';
      lat.value = adminAddressModel.data![0].lat.toString() ?? '22.7196';
      lon.value = adminAddressModel.data![0].lon.toString() ?? '75.8577';
    } else {
      stateController.text = '';
      cityController.text = '';
      streetNameAndNumberController.text = '';
      print('Invalid zipcode...');
      CommonWidgets.showMyToastMessage(
          'Not location present at this zipcode,please contact with support ...');
    }
  }

  void showMyCurrencyPicker() {
    showCountryPicker(
        context: Get.context!,
        countryListTheme: CountryListThemeData(
            flagSize: 25,
            backgroundColor: Colors.white,
            textStyle: const TextStyle(fontSize: 16, color: Colors.blueGrey),
            bottomSheetHeight: 500, // Optional. Country list modal height
            //Optional. Sets the border radius for the bottomsheet.
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(20.0),
              topRight: Radius.circular(20.0),
            ),
            //Optional. Styles the search field.
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
                  color:
                      Theme.of(Get.context!).colorScheme.onSecondaryContainer,
                ),
              ),
            )),
        onSelect: (Country country) {
          print(
              'Select country: ${country.displayName}  ,${country.countryCode}');
          countryController.text = country.name;
          countryCode.value = country.countryCode;
          zipCodeController.text = '';
          stateController.text = '';
          cityController.text = '';
          streetNameAndNumberController.text = '';
          numberController.text = '';
          floorController.text = '';
          doorController.text = '';
        });
  }

  void filterCountry(String text) {
    filterCountryList = countryList
        .where((country) =>
            country.name.toString().toLowerCase().contains(text.toLowerCase()))
        .toList();
  }

  void showBottomSheetForCountry() {
    filterCountryList = countryList;
    showModalBottomSheet(
      context: Get.context!,
      constraints: BoxConstraints(maxHeight: 600.px, minHeight: 450.px),
      isScrollControlled: true,
      builder: (BuildContext context) {
        return StatefulBuilder(
            builder: (BuildContext context, StateSetter state) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                height: 20.px,
              ),
              Padding(
                padding: EdgeInsets.only(left: 10.px, right: 10.px),
                child: CommonWidgets.commonTextFieldForLoginSignUP(
                    controller: searchController,
                    hintText: StringConstants.search,
                    isCard: true,
                    onChanged: (value) {
                      state(() {
                        filterCountry(value);
                      });
                    }),
              ),
              Expanded(
                child: SingleChildScrollView(
                  child: ListView.builder(
                    itemCount: filterCountryList.length,
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    padding: EdgeInsets.all(10.px),
                    itemBuilder: (context, index) {
                      CountryData item = filterCountryList[index];
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ListTile(
                          onTap: () {
                            countryId.value = item.id ?? '101';
                            countryCode.value = item.sortname ?? 'IN';
                            countryController.text = item.name ?? 'India';
                            searchController.text = '';
                            zipCodeController.text = '';
                            stateController.text = '';
                            cityController.text = '';
                            streetNameAndNumberController.text = '';
                            numberController.text = '';
                            floorController.text = '';
                            doorController.text = '';
                            Get.back();
                          },
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.px),
                            side: BorderSide(color: Colors.grey, width: 1.px),
                          ),
                          // leading: CommonWidgets.appIcons(
                          //     assetName: IconConstants.icMyEvent),
                          title: Text(
                            item.name ?? '',
                            style: Theme.of(Get.context!)
                                .textTheme
                                .titleMedium!
                                .copyWith(color: Colors.black87),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),
            ],
          );
        });
      },
    );
  }

  Future<void> submitAddressFromApi() async {
    if (countryController.text.isNotEmpty &&
        cityController.text.isNotEmpty &&
        zipCodeController.text.isNotEmpty &&
        stateController.text.isNotEmpty &&
        streetNameAndNumberController.text.isNotEmpty) {
      Map<String, dynamic> bodyParam = {
        ApiKeyConstants.userId: userId,
        ApiKeyConstants.country: countryController.text,
        ApiKeyConstants.countryCode: countryCode.value,
        'zipcode': zipCodeController.text,
        'state': stateController.text,
        'city': cityController.text,
        'street': streetNameAndNumberController.text,
        'number': numberController.text,
        'floor': floorController.text,
        'door': doorController.text,
        'lat': lat.value.toString(),
        'lon': lon.value.toString(),
      };

      isLoading.value = true;

      SimpleResponseModel? simpleResponseModel =
          await ApiMethods.addAddressApi(bodyParams: bodyParam);
      if (simpleResponseModel != null && simpleResponseModel.status == 1) {
        CommonWidgets.showMyToastMessage(simpleResponseModel.messages ?? '');
      }
    } else {
      CommonWidgets.showMyToastMessage('Please enter all fields');
    }
    isLoading.value = false;
  }

  Future<void> getCountryApi() async {
    GetCountryModel? getCountryModel = await ApiMethods.getCountry();
    if (getCountryModel != null &&
        getCountryModel.data != null &&
        getCountryModel.data!.isNotEmpty) {
      countryList = getCountryModel.data ?? [];
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
      countryCode.value = myAddressModel.data![0].countryCode ?? 'IN';
      streetNameAndNumberController.text = myAddressModel.data![0].street ?? '';
      countryController.text = myAddressModel.data![0].country ?? '';
      zipCodeController.text = myAddressModel.data![0].zipcode ?? '';
      stateController.text = myAddressModel.data![0].state ?? '';
      cityController.text = myAddressModel.data![0].city ?? '';
      numberController.text = myAddressModel.data![0].number ?? '';
      floorController.text = myAddressModel.data![0].floor ?? '';
      doorController.text = myAddressModel.data![0].door ?? '';

      CommonWidgets.showMyToastMessage('Successfully get address.');
    }
    increment();
  }
}
