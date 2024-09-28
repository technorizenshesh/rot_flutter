import 'dart:async';
import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:http/http.dart' as http;
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:rot_application/app/data/apis/api_constants/api_key_constants.dart';
import 'package:rot_application/app/data/apis/api_models/get_product_details_model.dart';
import 'package:rot_application/common/common_widgets.dart';

import '../../../../common/common_pickImage.dart';
import '../../../data/apis/api_methods/api_methods.dart';
import '../../../data/apis/api_models/get_delete_product_model.dart';
import '../../../data/apis/api_models/get_simple_model.dart';
import '../../../data/constants/string_constants.dart';
import '../../../routes/app_pages.dart';

class MyAddProductDetailController extends GetxController {
  final Completer<GoogleMapController> mapController =
      Completer<GoogleMapController>();
  final count = 0.obs;
  final lat = 22.7196.obs;
  final lon = 75.8577.obs;
  final cardIndex = 0.obs;
  String productId = '';
  String userId = '';
  Map<String, String?> parameters = Get.parameters;
  final inAsyncCall = false.obs;
  Map<String, dynamic> queryParameters = {};
  Map<String, dynamic> getPublicProfileQueryParams = {};

  GetProductDetailsModel? getProductDetailsModel;

  Data? data;

  @override
  Future<void> onInit() async {
    userId = parameters[ApiKeyConstants.userId] ?? '';
    productId = parameters[ApiKeyConstants.productId] ?? '';
    super.onInit();
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

  bool checkProductExpired(String createDate) {
    try {
      final DateTime expiryDate = DateTime.parse(createDate);
      final DateTime now = DateTime.now();
      final bool isExpired = now.isAfter(expiryDate);
      return isExpired;
    } catch (e) {
      return false;
    }
  }

  clickOnBackIcon() {
    Get.back();
  }

  int getRandomView() {
    Random random = Random();
    int randomNumber = random.nextInt(20);
    return randomNumber;
  }

  clickOnSellFasterButton() {}

  clickOnReportProduct() {}

  clickOnLearnMoreButton() {
    Get.toNamed(Routes.ROT_PROTECTION);
  }

  Future<void> onInitWork() async {
    await getProductDetailApi();
  }

  Future<void> getProductDetailApi() async {
    queryParameters = {
      ApiKeyConstants.productId: productId,
      ApiKeyConstants.userId: userId,
    };
    getProductDetailsModel =
        await ApiMethods.getProductDetail(queryParameters: queryParameters);
    if (getProductDetailsModel != null &&
        getProductDetailsModel!.data != null) {
      data = getProductDetailsModel!.data!;
      try {
        lat.value = double.parse(data!.productLat ?? '22.7196');
        lon.value = double.parse(data!.productLon ?? '75.8577');
      } catch (e) {
        lat.value = 22.7196;
        lon.value = 75.8577;
        print('Error :- lat long error');
      }
      increment();
    }
  }

  Future<void> deleteProduct() async {
    Map<String, String> deleteQueryParameters = {
      ApiKeyConstants.productId: productId
    };
    print("queryParameters $deleteQueryParameters");
    DeleteProductModel? model = await ApiMethods.deleteProductByProductId(
        queryParameters: deleteQueryParameters);
    if (model != null && model.status == '1') {
      CommonWidgets.showMyToastMessage('Product successfully deleted.');
      Get.back();
      Get.back();
    } else {
      CommonWidgets.showMyToastMessage('Failed.....');
    }
  }

  Future<void> changeProductStatus() async {
    Map<String, String> changeProductStatusQueryParameters = {
      ApiKeyConstants.productId: productId,
      ApiKeyConstants.status: data!.status == 'Active' ? 'Deactive' : 'Active'
    };
    print("queryParameters $changeProductStatusQueryParameters");
    SimpleResponseModel? model =
        await ApiMethods.changeProductStatusByProductId(
            queryParameters: changeProductStatusQueryParameters);
    if (model != null && model.status == '1') {
      CommonWidgets.showMyToastMessage('Change Product Status successfully .');
      getProductDetailApi();
    } else {
      CommonWidgets.showMyToastMessage(model!.messages ?? '');
    }
  }

  Future<void> soldReservedProduct(String type) async {
    Map<String, String> deleteQueryParameters = {
      ApiKeyConstants.productId: productId,
      ApiKeyConstants.availableAt: type,
    };
    print("queryParameters $deleteQueryParameters");
    http.Response? response =
        await ApiMethods.changeProductStatusSoldOrReserved(
            queryParameters: deleteQueryParameters);
    if (response != null) {
      Get.back();
      CommonWidgets.showMyToastMessage('Product successfully $type ...');
    } else {
      CommonWidgets.showMyToastMessage('Failed.....');
    }
  }

  void showAlertDialog(String type) {
    showDialog(
      context: Get.context!,
      barrierDismissible: true,
      builder: (BuildContext context) {
        return MyAlertDialog(
          actions: [
            CupertinoDialogAction(
              isDefaultAction: true,
              child: Text(
                StringConstants.yes,
                style: Theme.of(Get.context!)
                    .textTheme
                    .titleSmall
                    ?.copyWith(fontSize: 10.px, color: Colors.redAccent),
              ),
              onPressed: () {
                Get.back();
                soldReservedProduct(type);
              },
            ),
            CupertinoDialogAction(
              isDefaultAction: true,
              child: Text(
                StringConstants.no,
                style: Theme.of(Get.context!).textTheme.titleSmall?.copyWith(
                    fontSize: 10.px,
                    color: Theme.of(Get.context!).primaryColor),
              ),
              onPressed: () {
                Get.back();
              },
            ),
          ],
          title: Text(
            'Product $type',
            style: Theme.of(Get.context!)
                .textTheme
                .displayMedium
                ?.copyWith(fontSize: 18.px),
          ),
          content: Text(
            'Do you want to $type',
            style: Theme.of(Get.context!)
                .textTheme
                .titleSmall
                ?.copyWith(fontSize: 14.px),
          ),
        );
      },
    );
  }

  openEditProductScreen(String categoryId) {
    print('Category id:-$categoryId');
    switch (categoryId) {
      case '1':

        /// For Car....
        Get.toNamed(Routes.EDIT_CAR_PRODUCT, arguments: getProductDetailsModel);
        break;
      case '2':
        {
          /// For Motorcycle....
          Get.toNamed(Routes.EDIT_CAR_PRODUCT,
              arguments: getProductDetailsModel);
        }
        break;
      case '3':
        {
          /// For Real and estate....
          Get.toNamed(Routes.EDIT_REAL_ESTATE,
              arguments: getProductDetailsModel);
        }
        break;
      case '7':
        {
          /// For Computer....
          Get.toNamed(Routes.EDIT_CAR_PRODUCT,
              arguments: getProductDetailsModel);
        }
        break;
      case '8':
        {
          /// For Phone....
          Get.toNamed(Routes.EDIT_CAR_PRODUCT,
              arguments: getProductDetailsModel);
        }
        break;
      case '9':
        {
          /// For Baby....
          Get.toNamed(Routes.EDIT_CAR_PRODUCT,
              arguments: getProductDetailsModel);
        }
        break;
      case '10':
        {
          /// For Game....
          Get.toNamed(Routes.EDIT_CAR_PRODUCT,
              arguments: getProductDetailsModel);
        }
        break;
      case '11':
        {
          /// For Fation....
          Get.toNamed(Routes.EDIT_CAR_PRODUCT,
              arguments: getProductDetailsModel);
        }
        break;
      case '14':
        {
          /// For Agriculture and pets....
          Get.toNamed(Routes.EDIT_HOBBIES, arguments: getProductDetailsModel);
        }
        break;
      case '16':
        {
          /// For Training And Books....
          Get.toNamed(Routes.EDIT_HOBBIES, arguments: getProductDetailsModel);
        }
        break;
      case '17':
        {
          /// For Image and Sound....
          Get.toNamed(Routes.EDIT_HOBBIES, arguments: getProductDetailsModel);
        }
        break;
      case '18':
        {
          /// For Sport and nautical....
          Get.toNamed(Routes.EDIT_CAR_PRODUCT,
              arguments: getProductDetailsModel);
        }
      case '19':
        {
          /// For Electronic....
          Get.toNamed(Routes.EDIT_CAR_PRODUCT,
              arguments: getProductDetailsModel);
        }
      case '21':
        {
          /// For Engine and accessories....
          Get.toNamed(Routes.EDIT_CAR_PRODUCT,
              arguments: getProductDetailsModel);
        }
      case '22':
        {
          /// For Home and garden....
          Get.toNamed(Routes.EDIT_CAR_PRODUCT,
              arguments: getProductDetailsModel);
        }
      case '20':
        {
          /// For Hobbies and Ieisure....
          Get.toNamed(Routes.EDIT_HOBBIES, arguments: getProductDetailsModel);
        }
        break;
      case '23':
        {
          /// For Collecting....
          Get.toNamed(Routes.EDIT_COIN_PRODUCT,
              arguments: getProductDetailsModel);
        }
        break;
      case '29':
        {
          /// For Employment....
          Get.toNamed(Routes.EDIT_HOBBIES, arguments: getProductDetailsModel);
        }
        break;
      case '30':
        {
          /// For Services....
          Get.toNamed(Routes.EDIT_HOBBIES, arguments: getProductDetailsModel);
        }
        break;

      default:
        {
          print('By default.....');
          Get.toNamed(Routes.EDIT_CAR_PRODUCT,
              arguments: getProductDetailsModel);
        }
        break;
    }
  }

  Future<void> extendExpirationDate() async {
    Map<String, String> extendDateQueryParameters = {
      ApiKeyConstants.productId: productId,
    };
    print("queryParameters $extendDateQueryParameters");
    http.Response? response = await ApiMethods.extendExpirationDateApi(
        queryParameters: extendDateQueryParameters);
    if (response != null) {
      Get.back();
    } else {
      CommonWidgets.showMyToastMessage('Failed.....');
    }
  }
}
