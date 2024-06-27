import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../../common/common_widgets.dart';
import '../../../data/constants/string_constants.dart';
import '../controllers/scan_qr_code_controller.dart';

class ScanQrCodeView extends GetView<ScanQrCodeController> {
  const ScanQrCodeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Colors.grey,
        appBar: CommonWidgets.appBar(title: StringConstants.receivePayment),
        body: Obx(() {
          controller.count.value;
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              controller.showAddManualCode.value
                  ? Container(
                      width: double.infinity,
                      padding: EdgeInsets.only(left: 20.px, right: 20.px),
                      decoration: const BoxDecoration(color: Colors.white),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(height: 20.px),
                          Text(
                            StringConstants.secureAndVerifiedPayment,
                            style: Theme.of(context)
                                .textTheme
                                .displayMedium
                                ?.copyWith(
                                  fontSize: 14.px,
                                ),
                          ),
                          SizedBox(
                            height: 5.px,
                          ),
                          Text(
                            StringConstants.havingTroubleScanning,
                            style: Theme.of(context)
                                .textTheme
                                .titleSmall
                                ?.copyWith(
                                  fontSize: 14.px,
                                ),
                          ),
                          SizedBox(
                            height: 5.px,
                          ),
                          GestureDetector(
                            onTap: () {
                              controller.showAlertBox();
                            },
                            child: Text(
                              StringConstants.addManualCode,
                              style: Theme.of(context)
                                  .textTheme
                                  .titleSmall
                                  ?.copyWith(
                                      fontSize: 14.px,
                                      fontWeight: FontWeight.bold,
                                      color: Theme.of(context).primaryColor),
                            ),
                          ),
                          SizedBox(
                            height: 10.px,
                          ),
                        ],
                      ))
                  : Container(
                      width: double.infinity,
                      padding: EdgeInsets.only(left: 20.px, right: 20.px),
                      decoration: const BoxDecoration(color: Colors.white),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(height: 20.px),
                          Text(
                            StringConstants.secureAndVerifiedPayment,
                            style: Theme.of(context)
                                .textTheme
                                .displayMedium
                                ?.copyWith(
                                  fontSize: 14.px,
                                ),
                          ),
                          SizedBox(
                            height: 5.px,
                          ),
                          Text(
                            StringConstants
                                .ifTheSenderHasNotVerifiedThisTransaction,
                            style: Theme.of(context)
                                .textTheme
                                .titleSmall
                                ?.copyWith(
                                  fontSize: 14.px,
                                ),
                          ),
                          SizedBox(
                            height: 5.px,
                          ),
                          GestureDetector(
                            onTap: () {
                              controller.showAlertBoxForReceivePayment();
                            },
                            child: Text(
                              StringConstants.confirmBeforeContinuing,
                              style: Theme.of(context)
                                  .textTheme
                                  .titleSmall
                                  ?.copyWith(
                                      fontSize: 14.px,
                                      fontWeight: FontWeight.bold,
                                      color: Theme.of(context).primaryColor),
                            ),
                          ),
                          SizedBox(
                            height: 10.px,
                          ),
                        ],
                      )),
              SizedBox(
                height: 80.px,
              ),
              Align(
                alignment: Alignment.center,
                child: Container(
                  height: 250.px,
                  width: 250.px,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.white, width: 2.px)),
                  clipBehavior: Clip.hardEdge,
                  child: QRView(
                    key: controller.qrKey,
                    onQRViewCreated: controller.onQRViewCreated,
                  ),
                ),
              ),
            ],
          );
        }));
  }
}
