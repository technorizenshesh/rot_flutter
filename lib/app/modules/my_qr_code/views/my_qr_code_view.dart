import 'dart:ui' as ui;

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../../common/common_widgets.dart';
import '../../../data/apis/api_constants/api_key_constants.dart';
import '../../../data/constants/string_constants.dart';
import '../controllers/my_qr_code_controller.dart';

class MyQrCodeView extends GetView<MyQrCodeController> {
  const MyQrCodeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final FutureBuilder<ui.Image> qrFutureBuilder = FutureBuilder<ui.Image>(
      future: controller.loadOverlayImage(),
      builder: (BuildContext ctx, AsyncSnapshot<ui.Image> snapshot) {
        const double size = 230.0;
        if (!snapshot.hasData) {
          return const SizedBox(width: size, height: size);
        }
        return CustomPaint(
          size: const Size.square(size),
          painter: QrPainter(
            data: controller.parameters[ApiKeyConstants.userId] ?? '0',
            version: QrVersions.auto,
            eyeStyle: const QrEyeStyle(
              eyeShape: QrEyeShape.square,
              color: Color(0xff1f1f1f),
            ),
            dataModuleStyle: const QrDataModuleStyle(
              dataModuleShape: QrDataModuleShape.circle,
              color: Color(0xff1f1f1f),
            ),
            // size: 320.0,
            embeddedImage: snapshot.data,
            embeddedImageStyle: const QrEmbeddedImageStyle(
              size: Size.square(20),
            ),
          ),
        );
      },
    );
    return Scaffold(
        appBar: CommonWidgets.appBar(title: StringConstants.myQRCode),
        body: Obx(() {
          controller.count.value;
          return Align(
            alignment: Alignment.center,
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(height: 40.px),
                  Container(
                    width: 250.px,
                    height: 250.px,
                    padding: EdgeInsets.all(10.px),
                    margin: EdgeInsets.all(20.px),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(10.px)),
                        border: Border.all(
                            color: Colors.teal.withOpacity(0.5), width: 2.px),
                        color: Colors.white),
                    child: qrFutureBuilder,
                  ),
                  Text(
                    'QR number :${controller.qrNumber.value}',
                    style: Theme.of(context).textTheme.displayMedium?.copyWith(
                          fontSize: 14.px,
                        ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 20.px),
                  GestureDetector(
                      onTap: () {
                        controller.clickOnShareButton();
                        // Get.toNamed(Routes.MY_REVIEW);
                        //Get.toNamed(Routes.MY_SAVED);
                      },
                      child: Container(
                        width: 100.px,
                        height: 40.px,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.px),
                          color: Theme.of(context).primaryColor,
                        ),
                        child: Text(StringConstants.shareQR,
                            style: Theme.of(context)
                                .textTheme
                                .displayMedium
                                ?.copyWith(
                                    fontSize: 14.px, color: Colors.white)),
                      )),
                ],
              ),
            ),
          );
        }));
  }
}
