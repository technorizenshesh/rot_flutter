import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../../common/common_widgets.dart';
import '../../../data/constants/string_constants.dart';
import '../controllers/my_qr_code_controller.dart';

class MyQrCodeView extends GetView<MyQrCodeController> {
  const MyQrCodeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
                  Image.asset(
                    'assets/un_used_images/my_qr_code.png',
                    height: 250.px,
                    width: 250.px,
                    fit: BoxFit.fill,
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
