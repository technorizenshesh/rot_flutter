import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import '../../../../common/common_widgets.dart';
import '../../../data/constants/icons_constant.dart';
import '../../../data/constants/image_constants.dart';
import '../../../data/constants/string_constants.dart';

class WithdrawController extends GetxController {
  final count = 0.obs;

  @override
  void onInit() {
    super.onInit();
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

  clickOnTransferToBank() {
    showDialog(
      context: Get.context!,
      builder: (context) {
        return AlertDialog(
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          surfaceTintColor: Theme.of(context).scaffoldBackgroundColor,
          content: SizedBox(
            height: MediaQuery.of(context).size.height / 1.2.px,
            width: MediaQuery.of(context).size.width,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Align(
                  alignment: Alignment.topRight,
                  child: GestureDetector(
                    onTap: () {
                      Get.back();
                    },
                    child: Icon(Icons.highlight_remove_outlined,
                        color: Theme.of(context).primaryColor),
                  ),
                ),
                Column(
                  children: [
                    CommonWidgets.appIcons(
                      assetName: ImageConstants.imageWalletToYourBankAccount,
                      height: 180.px,
                      width: double.infinity,
                    ),
                    Column(
                      children: [
                        Text(
                          'You are going to transfer \$ 5.00 from the wallet to your bank account',
                          textAlign: TextAlign.center,
                          style: Theme.of(context)
                              .textTheme
                              .displayMedium
                              ?.copyWith(fontSize: 18.px),
                        ),
                        SizedBox(height: 20.px),
                        Text(
                          'The money will reflect in your account within 2 to 5 business days, depending on your bank.',
                          textAlign: TextAlign.center,
                          style: Theme.of(context)
                              .textTheme
                              .titleMedium
                              ?.copyWith(fontSize: 14.px),
                        ),
                      ],
                    ),
                  ],
                ),
                Column(
                  children: [
                    CommonWidgets.commonElevatedButton(
                      buttonColor: Theme.of(context).scaffoldBackgroundColor,
                      onPressed: () => clickOnCancel(),
                      border: Border.all(
                        color: Theme.of(Get.context!).primaryColor,
                        width: 2.px,
                      ),
                      childText: Text(
                        StringConstants.cancel,
                        style:
                            Theme.of(context).textTheme.headlineSmall?.copyWith(
                                  fontWeight: FontWeight.w700,
                                  color: Theme.of(Get.context!).primaryColor,
                                ),
                      ),
                    ),
                    SizedBox(height: 10.px),
                    CommonWidgets.commonElevatedButton(
                      onPressed: () => clickOnConfirm(),
                      childText: Text(
                        StringConstants.confirm,
                        style: Theme.of(context)
                            .textTheme
                            .headlineSmall
                            ?.copyWith(fontWeight: FontWeight.w700),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  clickOnCancel() {}

  clickOnConfirm() {
    Get.back();
    showDialog(
      context: Get.context!,
      builder: (context) {
        return AlertDialog(
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          surfaceTintColor: Theme.of(context).scaffoldBackgroundColor,
          content: SizedBox(
            height: MediaQuery.of(context).size.height / 1.2.px,
            width: MediaQuery.of(context).size.width,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Align(
                  alignment: Alignment.topRight,
                  child: GestureDetector(
                    onTap: () {
                      Get.back();
                    },
                    child: Icon(Icons.highlight_remove_outlined,
                        color: Theme.of(context).primaryColor),
                  ),
                ),
                CommonWidgets.appIcons(
                  assetName: ImageConstants.imageUsingTheWallet,
                  height: 180.px,
                  width: double.infinity,
                ),
                Column(
                  children: [
                    Text(
                      'Discover the advantages of using the wallet',
                      textAlign: TextAlign.center,
                      style: Theme.of(context)
                          .textTheme
                          .displayMedium
                          ?.copyWith(fontSize: 18.px),
                    ),
                    SizedBox(height: 20.px),
                    ListTile(
                      contentPadding: EdgeInsets.zero,
                      leading: Container(
                        height: 40.px,
                        width: 40.px,
                        decoration: BoxDecoration(
                          color: Theme.of(context)
                              .colorScheme
                              .onSecondary
                              .withOpacity(.2.px),
                          borderRadius: BorderRadius.circular(8.px),
                        ),
                        child: Center(
                          child: CommonWidgets.appIcons(
                            assetName: IconConstants.icLocation,
                            height: 24.px,
                            width: 24.px,
                            borderRadius: 0.px,
                          ),
                        ),
                      ),
                      title: Text(
                        'Pay in person and for shipments Use the wallet for all ',
                        maxLines: 1,
                        style: Theme.of(context)
                            .textTheme
                            .displayMedium
                            ?.copyWith(fontSize: 18.px),
                      ),
                      subtitle: Text(
                        'purchases you make in the app.',
                        style:
                            Theme.of(context).textTheme.titleMedium?.copyWith(
                                  fontSize: 12.px,
                                ),
                        maxLines: 1,
                      ),
                    ),
                    SizedBox(height: 6.px),
                    ListTile(
                      contentPadding: EdgeInsets.zero,
                      leading: Container(
                        height: 40.px,
                        width: 40.px,
                        decoration: BoxDecoration(
                          color: Theme.of(context)
                              .colorScheme
                              .onSecondary
                              .withOpacity(.2.px),
                          borderRadius: BorderRadius.circular(8.px),
                        ),
                        child: Center(
                          child: CommonWidgets.appIcons(
                            assetName: IconConstants.icEmptyWallet,
                            height: 24.px,
                            width: 24.px,
                            borderRadius: 0.px,
                          ),
                        ),
                      ),
                      title: Text(
                        'Faster refunds Receive refunds',
                        maxLines: 1,
                        style: Theme.of(context)
                            .textTheme
                            .displayMedium
                            ?.copyWith(fontSize: 18.px),
                      ),
                      subtitle: Text(
                        'instantly.',
                        style:
                            Theme.of(context).textTheme.titleMedium?.copyWith(
                                  fontSize: 12.px,
                                ),
                        maxLines: 1,
                      ),
                    ),
                    SizedBox(height: 6.px),
                    ListTile(
                      contentPadding: EdgeInsets.zero,
                      leading: Container(
                        height: 40.px,
                        width: 40.px,
                        decoration: BoxDecoration(
                          color: Theme.of(context)
                              .colorScheme
                              .onSecondary
                              .withOpacity(.2.px),
                          borderRadius: BorderRadius.circular(8.px),
                        ),
                        child: Center(
                          child: CommonWidgets.appIcons(
                            assetName: IconConstants.icElectricity,
                            height: 24.px,
                            width: 24.px,
                            borderRadius: 0.px,
                          ),
                        ),
                      ),
                      title: Text(
                        'Do you have a low balance?',
                        maxLines: 1,
                        style: Theme.of(context)
                            .textTheme
                            .displayMedium
                            ?.copyWith(fontSize: 18.px),
                      ),
                      subtitle: Text(
                        'Make a mixed payment and complete the payment with your card or PayPal.',
                        style:
                            Theme.of(context).textTheme.titleMedium?.copyWith(
                                  fontSize: 12.px,
                                ),
                        maxLines: 1,
                      ),
                    ),
                  ],
                ),
                Column(
                  children: [
                    CommonWidgets.commonElevatedButton(
                      buttonColor: Theme.of(context).scaffoldBackgroundColor,
                      onPressed: () => clickOnKeepInWallet(),
                      border: Border.all(
                        color: Theme.of(Get.context!).primaryColor,
                        width: 2.px,
                      ),
                      childText: Text(
                        StringConstants.keepInWallet,
                        style:
                            Theme.of(context).textTheme.headlineSmall?.copyWith(
                                  fontWeight: FontWeight.w700,
                                  color: Theme.of(Get.context!).primaryColor,
                                ),
                      ),
                    ),
                    SizedBox(height: 10.px),
                    CommonWidgets.commonElevatedButton(
                      onPressed: () => clickOnWithdrawBalance(),
                      childText: Text(
                        StringConstants.withdrawBalance,
                        style: Theme.of(context)
                            .textTheme
                            .headlineSmall
                            ?.copyWith(fontWeight: FontWeight.w700),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  clickOnKeepInWallet() {}

  clickOnWithdrawBalance() {}
}
