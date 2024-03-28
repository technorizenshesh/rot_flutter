import 'package:get/get.dart';
import 'package:rot_application/app/data/apis/api_models/get_add_wallet_model.dart';
import 'package:rot_application/app/data/apis/api_models/get_token_model.dart';

import '../../../../common/common_widgets.dart';
import '../../../data/apis/api_constants/api_key_constants.dart';
import '../../../data/apis/api_methods/api_methods.dart';
import '../../../data/apis/api_models/get_card_list_model.dart';
import '../../../routes/app_pages.dart';

class RechargeSummaryController extends GetxController {
  final count = 0.obs;
  Map<String, String?> parameters = Get.parameters;
  final btnLoading = false.obs;
  CardListData cardListData = Get.arguments;
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

  clickOnRecharge() {
    // Get.toNamed(Routes.RECHARGE_DONE);
    btnLoading.value = true;
    getTokenForRecharge();
  }

  Future<void> getTokenForRecharge() async {
    try {
      Map<String, dynamic> getTokenParameters = {
        ApiKeyConstants.cardNumber: cardListData.cardNumber,
        ApiKeyConstants.expiryMonth:
            cardListData.expireDate.toString().substring(0, 2),
        ApiKeyConstants.expiryYear:
            '20${cardListData.expireDate.toString().substring(3, 5)}',
        ApiKeyConstants.cvcCode: cardListData.cvc,
      };
      print("bodyParamForToken:-$getTokenParameters");
      TokenModel? tokenModel =
          await ApiMethods.getTokenApi(bodyParams: getTokenParameters);
      if (tokenModel != null &&
          tokenModel.status == '1' &&
          tokenModel.data != null) {
        submitRecharge(tokenModel.data!.id!);
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

  Future<void> submitRecharge(String token) async {
    try {
      Map<String, dynamic> submitRechargeParameters = {
        ApiKeyConstants.userId: parameters[ApiKeyConstants.userId],
        ApiKeyConstants.token: token,
        ApiKeyConstants.amount: parameters[ApiKeyConstants.amount] ?? '0',
        ApiKeyConstants.cardId: cardListData.id,
      };
      print("bodyParamForSubmitRecharge:-$submitRechargeParameters");
      AddWalletModel? addWalletModel = await ApiMethods.addToWalletAmountApi(
          bodyParams: submitRechargeParameters);
      if (addWalletModel != null && addWalletModel.status == '1') {
        print('Successfully  payment completed....');
        CommonWidgets.showMyToastMessage(
            'Successfully completed add to wallet money....');
        Get.offAndToNamed(Routes.RECHARGE_DONE);
      } else {
        print('Failed to recharge....');
        CommonWidgets.showMyToastMessage('Failed add to wallet amount ...');
      }
    } catch (e) {
      print('Error:- ${e.toString()}');
      CommonWidgets.showMyToastMessage('Failed add to wallet amount ...');
    }
    btnLoading.value = false;
  }
}
