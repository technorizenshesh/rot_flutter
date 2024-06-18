import 'dart:async';

import 'package:currency_symbols/currency_symbols.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:rot_application/app/routes/app_pages.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../common/common_widgets.dart';
import '../../../../common/text_styles.dart';
import '../../../data/apis/api_constants/api_key_constants.dart';
import '../../../data/apis/api_methods/api_methods.dart';
import '../../../data/apis/api_models/get_buy_product_model.dart';
import '../../../data/apis/api_models/get_my_address_model.dart';
import '../../../data/apis/api_models/get_product_details_model.dart';
import '../../../data/apis/api_models/get_token_model.dart';
import '../../../data/apis/api_models/get_wallet_list_model.dart';
import '../../../data/constants/icons_constant.dart';
import '../../../data/constants/string_constants.dart';

class DeliverySummaryController extends GetxController {
  TextEditingController promotionalCode = TextEditingController();
  final Completer<GoogleMapController> mapController =
      Completer<GoogleMapController>();
  List<GetWalletListData> myWalletList = [];
  final count = 0.obs;

  double lat = 22.702;
  double long = 75.869;
  String userId = '';
  final walletId = ''.obs;
  final walletAmount = ''.obs;
  final myAddress = ''.obs;
  GetProductDetailsModel productDetailsModel = Get.arguments;

  Map<String, dynamic> parameters = Get.parameters;
  final btnLoading = false.obs;
  Map<String, dynamic> buyQueryParameters = {};
  final selectedValue = StringConstants.inPerson.tr.obs;

  @override
  void onInit() async {
    super.onInit();
    SharedPreferences sp = await SharedPreferences.getInstance();
    userId = sp.getString(ApiKeyConstants.userId) ?? '';
    getMyAddress();
    walletId.value = parameters['wallet_id'];
    walletAmount.value = parameters['amount'];
    increment();
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

  void increment() => count.value++;

  clickOnContinueButton() {
    if (myAddress.value != '') {
      btnLoading.value = true;
      if (parameters['method'] == 'Card') {
        getTokenForBuyProduct();
      } else {
        buyProductDeliveryApi('');
      }
    } else {
      CommonWidgets.showMyToastMessage('Please select your address...');
    }
  }

  clickOnToEdit(int index) async {
    switch (index) {
      case 0:
        await Get.toNamed(Routes.EDIT_ADDRESS);
        getMyAddress();
        break;
      case 1:
        if (parameters['method'] == 'Card') {
          Get.back();
        } else {
          clickOnEditWallet();
        }
        break;
      case 2:
        break;
    }
  }

  Future<void> getTokenForBuyProduct() async {
    try {
      Map<String, dynamic> getTokenParameters = {
        ApiKeyConstants.cardNumber: parameters['card_number'],
        ApiKeyConstants.expiryMonth: parameters['expire_Date'].substring(0, 2),
        ApiKeyConstants.expiryYear:
            '20${parameters['expire_Date'].substring(3, 5)}',
        ApiKeyConstants.cvcCode: parameters['cvcCode'],
      };
      print("bodyParamForToken:-$getTokenParameters");
      TokenModel? tokenModel =
          await ApiMethods.getTokenApi(bodyParams: getTokenParameters);
      if (tokenModel != null &&
          tokenModel.status == '1' &&
          tokenModel.data != null) {
        buyProductDeliveryApi(tokenModel.data!.id!);
        print('Successfully completed....');
      } else {
        print('Failed to get token....');
        CommonWidgets.showMyToastMessage('Your card number is incorrect...');
        btnLoading.value = false;
      }
    } catch (e) {
      print('Error:- ${e.toString()}');
      CommonWidgets.showMyToastMessage('Your card number is incorrect...');
      btnLoading.value = false;
    }
  }

  Future<void> buyProductDeliveryApi(String token) async {
    try {
      buyQueryParameters = {
        ApiKeyConstants.productId: productDetailsModel.data!.id,
        ApiKeyConstants.userId: userId,
        ApiKeyConstants.amount: (int.parse(productDetailsModel.data!.price!) +
                double.parse(parameters['shipping_charge'] ?? '0') +
                3.39)
            .toString(), //productDetailsModel.data!.price,
        ApiKeyConstants.type: parameters['method'],
        ApiKeyConstants.location: myAddress.value.toString(),
        ApiKeyConstants.paymentType: parameters['method'],
        ApiKeyConstants.walletId: walletId.value,
        ApiKeyConstants.token: token
      };
      BuyProductModel? buyProductModel =
          await ApiMethods.buyProduct(queryParameters: buyQueryParameters);

      if (buyProductModel != null && buyProductModel.status == '1') {
        print("Buy Product Successfully complete.....");
        Map<String, String> data = {
          "shipping_id":
              buyProductModel.data!.productDeliveryId.toString() ?? '0',
          "shipping_charge": parameters['shipping_charge'] ?? '0'
        };
        Get.offAndToNamed(Routes.DELIVERY_PURCHASES_ON_THE_WAY,
            arguments: productDetailsModel, parameters: data);
      } else {
        print("Failed.....");
        CommonWidgets.showMyToastMessage(
            'Buy product failed due to some issues ....');
      }
    } catch (e) {
      print("Error:- ${e.toString()}");
    }
    btnLoading.value = false;
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
      myAddress.value =
          '${myAddressModel.data![0].street},${myAddressModel.data![0].city},'
          '${myAddressModel.data![0].zipcode},${myAddressModel.data![0].state},${myAddressModel.data![0].country}';
    }
    increment();
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
    }
  }

  clickOnEditWallet() {
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
                      String amount =
                          double.parse(item.amount ?? '0.0').toStringAsFixed(2);
                      walletAmount.value = amount;
                      walletId.value = item.id ?? '0';
                      Get.back();
                      increment();
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
}
