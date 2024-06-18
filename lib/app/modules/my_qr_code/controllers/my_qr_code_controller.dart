import 'dart:io';
import 'dart:math';
import 'dart:typed_data';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:path_provider/path_provider.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:share_plus/share_plus.dart';

class MyQrCodeController extends GetxController {
  final chars =
      'AaBbCcDdEeFfGgHhIiJjKkLlMmNnOoPpQqRrSsTtUuVvWwXxYyZz1234567890';
  Random rnd = Random();
  final count = 0.obs;
  final qrNumber = ''.obs;
  Uint8List? qrCodeBytes;
  Map<String, String?> parameters = Get.parameters;
  @override
  void onInit() {
    super.onInit();
    qrNumber.value = getRandomString(15);
    print('Qr Number:- ${qrNumber.value}');
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
    generateQrCode();
  }

  void generateQrCode() {
    QrPainter(
      data: qrNumber.value,
      version: QrVersions.auto,
      gapless: false,
      eyeStyle: const QrEyeStyle(
          eyeShape: QrEyeShape.square, color: Color(0xFF000000)),
      //color: const Color(0xFFFFFFFF),
    ).toImageData(200).then((value) {
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
}
