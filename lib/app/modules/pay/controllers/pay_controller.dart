import 'dart:io';
import 'dart:math';
import 'dart:typed_data';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:path_provider/path_provider.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:rot_application/app/data/apis/api_constants/api_key_constants.dart';
import 'package:rot_application/app/data/apis/api_models/response_model.dart';
import 'package:rot_application/common/common_widgets.dart';
import 'package:share_plus/share_plus.dart';

import '../../../data/apis/api_methods/api_methods.dart';
import '../../../data/apis/api_models/get_wallet_list_model.dart';
import '../../../routes/app_pages.dart';

class PayController extends GetxController {
  final chars =
      'AaBbCcDdEeFfGgHhIiJjKkLlMmNnOoPpQqRrSsTtUuVvWwXxYyZz1234567890';
  Random rnd = Random();
  TextEditingController amountController = TextEditingController();
  final count = 0.obs;
  final qrNumber = ''.obs;
  final walletId = '0'.obs;
  Uint8List? qrCodeBytes;
  Map<String, String?> parameters = Get.parameters;
  List<GetWalletListData> myWalletList = [];
  final currencyName = 'USD'.obs;
  @override
  void onInit() {
    super.onInit();
    qrNumber.value = getRandomString(15);
    print('Qr Number:- ${qrNumber.value}');
    walletId.value = parameters[ApiKeyConstants.walletId] ?? '0';
    currencyName.value = parameters[ApiKeyConstants.currency] ?? 'USD';
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

  String getRandomString(int length) => String.fromCharCodes(Iterable.generate(
      length, (_) => chars.codeUnitAt(rnd.nextInt(chars.length))));

  clickOnShareButton() {
    if (amountController.text.isNotEmpty) {
      sendQrCodeApi();
    } else {
      CommonWidgets.showMyToastMessage('Please enter amount first.');
    }

    //Share.share("122356e5kjikk", subject: 'QR Code');
  }

  clickOnTransactionButton() {
    Map<String, String> data = {
      ApiKeyConstants.userId: parameters[ApiKeyConstants.userId]!
    };
    Get.toNamed(Routes.HISTORY_OF_MOVEMENTS, parameters: data);
  }

  void generateQrCode() {
    QrPainter(
      data: qrNumber.value,
      version: 20,
      gapless: false,
      color: const Color(0xFFFFFFFF),
    ).toImageData(300).then((value) {
      qrCodeBytes = value!.buffer.asUint8List();
      shareQrCode();
    });
  }

  void shareQrCode() async {
    if (qrCodeBytes != null) {
      final tempDir = await getTemporaryDirectory();
      final file = File('${tempDir.path}/qr_code.png');
      await file.writeAsBytes(qrCodeBytes!);
      Share.shareFiles([file.path],
          subject: 'Received Payment By using this qr code',
          text: 'Manual Code:- ${qrNumber.value}');
    }
  }

  Future<void> sendQrCodeApi() async {
    Map<String, String> queryParameters = {
      ApiKeyConstants.userId: parameters[ApiKeyConstants.userId]!,
      ApiKeyConstants.amount: amountController.text.toString(),
      ApiKeyConstants.walletId: walletId.value,
      ApiKeyConstants.qrCode: qrNumber.value
    };
    ResponseModel? responseModel =
        await ApiMethods.sendQrCodeApi(queryParameters: queryParameters);
    if (responseModel != null && responseModel.status == 1) {
      generateQrCode();
    }
  }

  Future<void> getWalletListApi() async {
    Map<String, String> queryParameters = {
      ApiKeyConstants.userId: parameters[ApiKeyConstants.userId]!,
    };
    GetWalletListModel? getWalletListModel =
        await ApiMethods.getMyWalletListApi(queryParameters: queryParameters);
    if (getWalletListModel != null &&
        getWalletListModel.status == "1" &&
        getWalletListModel.data!.isNotEmpty) {
      myWalletList = getWalletListModel.data!;
      currencyName.value = myWalletList[0].name ?? 'USD';
      walletId.value = myWalletList[0].id ?? '0';
      increment();
    }
  }
}
