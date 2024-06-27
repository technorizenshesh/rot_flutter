import 'package:get/get.dart';
import 'package:rot_application/app/routes/app_pages.dart';

import '../../../../common/common_widgets.dart';
import '../../../data/apis/api_constants/api_key_constants.dart';
import '../../../data/apis/api_methods/api_methods.dart';
import '../../../data/apis/api_models/get_account_model.dart';
import '../../../data/apis/api_models/get_simple_model.dart';
import '../../../data/apis/api_models/user_model.dart';

class AccountVerificationTypeController extends GetxController {
  final inAsyncCall = false.obs;
  Map<String, String?> parameters = Get.parameters;
  GetAccountModel getAccountModel = Get.arguments;
  UserData? userData;
  final count = 0.obs;
  final email = ''.obs;
  final phone = ''.obs;
  @override
  void onInit() {
    super.onInit();
    getProfileApi();
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
  Future<void> getProfileApi() async {
    Map<String, dynamic> queryParameters = {
      ApiKeyConstants.userId: getAccountModel.data!.userId ?? '',
    };
    UserModel? userModel =
        await ApiMethods.getProfile(queryParameters: queryParameters);
    if (userModel != null) {
      userData = userModel.userData;
      email.value = userData!.email ?? '';
      phone.value = userData!.mobile ?? '';
      increment();
    }
  }

  clickOnCard(int index) {
    if (email.value.isNotEmpty && phone.value.isNotEmpty) {
      sendOtpApi(index);
    }
  }

  Future<void> sendOtpApi(int index) async {
    Map<String, dynamic> bodyParam = {
      ApiKeyConstants.userId: getAccountModel.data!.userId ?? '',
      ApiKeyConstants.email:
          index == 3 ? '${userData!.email}' : '${userData!.mobile}',
      ApiKeyConstants.type: index == 3 ? 'Email' : 'Sms',
    };

    inAsyncCall.value = true;
    SimpleResponseModel? simpleResponseModel =
        await ApiMethods.sendOtpForAccountVerificationApi(
            bodyParams: bodyParam);
    if (simpleResponseModel != null && simpleResponseModel.status == 1) {
      CommonWidgets.showMyToastMessage(simpleResponseModel.messages ?? '');
      Map<String, String> data = {
        ApiKeyConstants.userId: parameters[ApiKeyConstants.userId] ?? '',
        ApiKeyConstants.id: parameters[ApiKeyConstants.id] ?? '',
        ApiKeyConstants.recipient: parameters[ApiKeyConstants.recipient] ?? '',
        ApiKeyConstants.were: parameters[ApiKeyConstants.were] ?? '',
        ApiKeyConstants.swiptCode: parameters[ApiKeyConstants.swiptCode] ?? '',
        ApiKeyConstants.bankName: parameters[ApiKeyConstants.bankName] ?? '',
        ApiKeyConstants.phone: parameters[ApiKeyConstants.phone] ?? '',
        ApiKeyConstants.countryCode:
            parameters[ApiKeyConstants.countryCode] ?? '',
        ApiKeyConstants.email: parameters[ApiKeyConstants.email] ?? '',
        ApiKeyConstants.type: parameters[ApiKeyConstants.type] ?? '',
      };
      Get.toNamed(Routes.ACCOUNT_VERIFICATION_OTP, parameters: data);
    } else {
      CommonWidgets.showMyToastMessage(simpleResponseModel!.messages ?? '');
    }
    inAsyncCall.value = false;
  }
}
