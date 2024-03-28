import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rot_application/app/data/apis/api_models/get_wallet_history_model.dart';

import '../../../../common/common_widgets.dart';
import '../../../data/apis/api_constants/api_key_constants.dart';
import '../../../data/apis/api_methods/api_methods.dart';
import '../../../data/constants/string_constants.dart';

class HistoryOfMovementsController extends GetxController
    with GetSingleTickerProviderStateMixin {
  final count = 0.obs;
  late TabController tabController;
  final showProgress = true.obs;
  final presentData = true.obs;
  Map<String, String?> parameters = Get.parameters;

  List<WalletHistoryData> walletHistoryList = [];
  final tabs = [
    Tab(text: StringConstants.all.tr),
    Tab(text: StringConstants.appetizer.tr),
    Tab(text: StringConstants.departures.tr),
  ];

  @override
  void onInit() {
    tabController = TabController(length: 3, vsync: this);
    super.onInit();
    getPaymentHistory();
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

  Future<void> getPaymentHistory() async {
    try {
      Map<String, dynamic> getPaymentHistoryParameters = {
        ApiKeyConstants.userId: parameters[ApiKeyConstants.userId],
      };
      print("bodyParamForSubmitRecharge:-$getPaymentHistoryParameters");
      WalletHistoryModel? walletHistoryModel =
          await ApiMethods.getWalletHistoryApi(
              bodyParams: getPaymentHistoryParameters);
      if (walletHistoryModel != null &&
          walletHistoryModel.status == '1' &&
          walletHistoryModel.data != null) {
        walletHistoryList = walletHistoryModel.data!;
      } else {
        print('Failed to wallet history....');
      }
    } catch (e) {
      print('Error:- ${e.toString()}');
      CommonWidgets.showMyToastMessage('Failed to wallet history ...');
    }
    showProgress.value = false;
  }
}
