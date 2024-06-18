import 'package:currency_symbols/currency_symbols.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:rot_application/app/data/apis/api_constants/api_key_constants.dart';
import 'package:rot_application/app/data/apis/api_models/get_wallet_list_model.dart';
import 'package:rot_application/common/common_widgets.dart';
import 'package:rot_application/common/text_styles.dart';

import '../../../data/apis/api_methods/api_methods.dart';
import '../../../data/apis/api_models/user_model.dart';
import '../../../data/constants/icons_constant.dart';
import '../../../data/constants/string_constants.dart';
import '../../../routes/app_pages.dart';

class WalletController extends GetxController {
  final count = 0.obs;
  Map<String, String?> parameters = Get.parameters;
  final walletAmount = '0'.obs;
  final integerAmount = '00'.obs;
  final decimalAmount = '00'.obs;
  final walletId = '0'.obs;
  final currencyName = 'USD'.obs;
  List<GetWalletListData> myWalletList = [];
  List listOfListTile = [
    {
      'title': StringConstants.historyOfMovements,
      'icon': IconConstants.icHistoryOfMovements
    },
    {
      'title': StringConstants.bankInformation,
      'icon': IconConstants.icBankInformation
    },
    {'title': StringConstants.converter, 'icon': IconConstants.icConverter},
  ];

  @override
  void onInit() async {
    super.onInit();
    await getWalletListApi();
    //getProfileApi();
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

  clickOnListTile({required int index}) {
    Map<String, String> data = {
      ApiKeyConstants.userId: parameters[ApiKeyConstants.userId]!
    };
    switch (index) {
      case 0:
        Get.toNamed(Routes.HISTORY_OF_MOVEMENTS, parameters: data);
      case 1:
        Get.toNamed(Routes.BANK_INFORMATION, parameters: data);
      case 2:
        Get.toNamed(Routes.CONVERTER);
    }
  }

  clickOnSendMoney() {
    Map<String, String> data = {
      ApiKeyConstants.wallet: walletAmount.value,
      ApiKeyConstants.currency: currencyName.value
    };
    Get.toNamed(Routes.SEND_MONEY, parameters: data);
  }

  clickOnPay() {
    Map<String, String> data = {
      ApiKeyConstants.userId: parameters[ApiKeyConstants.userId]!,
      ApiKeyConstants.walletId: walletId.value,
      ApiKeyConstants.currency: currencyName.value,
    };
    Get.toNamed(Routes.PAY, parameters: data);
  }

  clickOnWithDraw() {
    Map<String, String> data = {
      ApiKeyConstants.wallet: walletAmount.value,
      ApiKeyConstants.currency: currencyName.value
    };
    Get.toNamed(Routes.WITHDRAW, parameters: data);
  }

  clickOnChange() {
    Map<String, String> data = {
      ApiKeyConstants.wallet: walletAmount.value,
      ApiKeyConstants.currency: currencyName.value
    };
    Get.toNamed(Routes.CHANGE, parameters: data);
  }

  clickOnRecharge() async {
    Map<String, String> data = {
      ApiKeyConstants.userId: parameters[ApiKeyConstants.userId]!,
      ApiKeyConstants.currency: currencyName.value,
      ApiKeyConstants.walletId: walletId.value
    };
    await Get.toNamed(Routes.RECHARGE, parameters: data);
    getWalletListApi();
  }

  clickOnThreeDots() {
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
                      currencyName.value = item.name ?? 'USD';
                      // walletAmount.value = item.amount ?? '0';
                      String amount =
                          double.parse(item.amount ?? '0.0').toStringAsFixed(2);
                      walletAmount.value = amount;
                      splitAmount(walletAmount.value);
                      walletId.value = item.id ?? '0';
                      Get.back();
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

  clickOnAccounts() {
    Get.toNamed(Routes.ACCOUNTS);
  }

  Future<void> getProfileApi() async {
    Map<String, String> queryParameters = {
      ApiKeyConstants.userId: parameters[ApiKeyConstants.userId]!,
    };
    UserModel? userModel =
        await ApiMethods.getProfile(queryParameters: queryParameters);
    if (userModel != null) {
      walletAmount.value = userModel.userData!.wallet ?? '0';
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
      // walletAmount.value = myWalletList[0].amount ?? '0';
      String amount =
          double.parse(myWalletList[0].amount ?? '0.0').toStringAsFixed(2);
      walletAmount.value = amount;
      splitAmount(amount);
      currencyName.value = myWalletList[0].name ?? 'USD';
      walletId.value = myWalletList[0].id ?? '0';
      increment();
    }
  }

  splitAmount(String amount) {
    List<String> parts = amount.split('.');
    integerAmount.value = parts[0];
    decimalAmount.value = parts.length > 1 ? parts[1] : '';
    increment();
  }
}
