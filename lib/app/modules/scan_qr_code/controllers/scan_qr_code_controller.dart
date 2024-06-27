import 'package:currency_symbols/currency_symbols.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:rot_application/app/data/apis/api_methods/api_methods.dart';
import 'package:rot_application/app/data/constants/string_constants.dart';
import 'package:rot_application/common/common_widgets.dart';

import '../../../data/apis/api_constants/api_key_constants.dart';
import '../../../data/apis/api_models/get_check_qrcode_model.dart';

class ScanQrCodeController extends GetxController {
  Barcode? result;
  QRViewController? controller;
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
  TextEditingController manualCodeController = TextEditingController();
  TextEditingController receiveAmountController = TextEditingController();
  final count = 0.obs;
  final resultCount = 0.obs;
  final showAddManualCode = true.obs;
  Map<String, String?> parameters = Get.parameters;
  final currencyName = 'USD'.obs;
  @override
  void onInit() {
    super.onInit();
    currencyName.value = parameters[ApiKeyConstants.currency] ?? 'USD';
    receiveAmountController.text = '${cSymbol(currencyName.value)}  20';
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
    controller?.dispose();
    super.dispose();
  }

  void increment() => count.value++;

  void onQRViewCreated(QRViewController controller) {
    this.controller = controller;
    controller.scannedDataStream.listen((scanData) {
      result = scanData;
      resultCount.value++;
      if (result != null) {
        if (resultCount.value == 1) {
          print('Qr Code:- ${result!.code}');
          checkQrCodeNumberApi(result!.code ?? '');
          CommonWidgets.showMyToastMessage('Scanned ...');
        }
      }
    });
  }

  void showAlertBox() {
    showDialog(
      context: Get.context!,
      builder: (context) {
        return AlertDialog(
          title: Text(
            StringConstants.addTheManualCodeLocatedInTheQrCode,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.displayMedium?.copyWith(
                  fontSize: 14.px,
                ),
          ),
          content: Container(
            height: 82.px,
            padding: EdgeInsets.only(top: 10.px, bottom: 10.px),
            child: CommonWidgets.commonTextFieldForLoginSignUP(
              controller: manualCodeController,
              hintText: StringConstants.manualCode,
              title: StringConstants.manualCode,
              maxLines: 1,
              maxHeight: 80.px,
              titleStyle: Theme.of(context).textTheme.displayMedium?.copyWith(
                  fontSize: 14.px, color: Theme.of(context).primaryColor),
            ),
          ),
          actions: <Widget>[
            CommonWidgets.commonElevatedButton(
                onPressed: () {
                  if (manualCodeController.text.isNotEmpty) {
                    Get.back();
                    checkQrCodeNumberApi(manualCodeController.text);
                  } else {
                    CommonWidgets.showMyToastMessage(
                        'Please enter manual code ...');
                  }
                },
                childText: Text(
                  StringConstants.add,
                  style: Theme.of(context).textTheme.displayMedium?.copyWith(
                      fontSize: 14.px, color: Theme.of(context).cardColor),
                ))
          ],
        );
      },
    );
  }

  void showAlertBoxForReceivePayment() {
    showDialog(
      context: Get.context!,
      builder: (context) {
        return AlertDialog(
          title: Text(
            StringConstants.receivePaymentFromPedroPerez,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.displayMedium?.copyWith(
                  fontSize: 14.px,
                ),
          ),
          content: Container(
            height: 82.px,
            padding: EdgeInsets.only(top: 10.px, bottom: 10.px),
            child: CommonWidgets.commonTextFieldForLoginSignUP(
              controller: receiveAmountController,
              title: StringConstants.youWillReceive,
              maxLines: 1,
              readOnly: true,
              maxHeight: 80.px,
              titleStyle: Theme.of(context).textTheme.displayMedium?.copyWith(
                  fontSize: 14.px, color: Theme.of(context).primaryColor),
            ),
          ),
          actions: <Widget>[
            CommonWidgets.commonElevatedButton(
                onPressed: () {
                  Get.back();
                },
                childText: Text(
                  StringConstants.accept,
                  style: Theme.of(context).textTheme.displayMedium?.copyWith(
                      fontSize: 14.px, color: Theme.of(context).cardColor),
                ))
          ],
        );
      },
    );
  }

  Future<void> checkQrCodeNumberApi(String qrNumber) async {
    Map<String, String> queryParameters = {
      ApiKeyConstants.qrCode: qrNumber,
    };
    try {
      CheckQrCodeModel? checkQrCodeModel =
          await ApiMethods.checkQrCodeApi(queryParameters: queryParameters);
      if (checkQrCodeModel != null &&
          checkQrCodeModel.status == "1" &&
          checkQrCodeModel.data != null) {
        receiveAmountController.text =
            '${cSymbol(currencyName.value)} ${checkQrCodeModel.data!.amount}';
        showAddManualCode.value = false;
        increment();
        showAlertBoxForReceivePayment();
      } else {
        CommonWidgets.showMyToastMessage('Invalid Qr Code ...');
      }
    } catch (e) {
      CommonWidgets.showMyToastMessage('Invalid Qr Code ...');
    }
  }
}
