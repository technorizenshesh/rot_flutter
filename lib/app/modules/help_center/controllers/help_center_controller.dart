import 'package:get/get.dart';
import 'package:rot_application/app/data/apis/api_models/get_help_center_model.dart';

import '../../../../common/common_widgets.dart';
import '../../../data/apis/api_constants/api_key_constants.dart';
import '../../../data/apis/api_methods/api_methods.dart';

class HelpCenterController extends GetxController {
  final count = 0.obs;
  final showProgress = true.obs;
  String title = '';
  Map<String, String?> parameters = Get.parameters;
  List<HelpCenterData> helpCenterData = [];

  @override
  void onInit() {
    title = parameters['title'] ?? '';
    super.onInit();
    getHelpCenter();
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

  Future<void> getHelpCenter() async {
    try {
      Map<String, dynamic> getQueryParameters = {
        ApiKeyConstants.type: getApiType(parameters['title'] ?? ''),
      };
      print("bodyParamForHelpCenter:-$getQueryParameters");
      HelpCenterModel? helpCenterModel =
          await ApiMethods.getHelpCenterApi(bodyParams: getQueryParameters);
      if (helpCenterModel != null &&
          helpCenterModel.status == '1' &&
          helpCenterModel.data != null) {
        helpCenterData = helpCenterModel.data!;
      } else {
        print('Failed to wallet history....');
      }
    } catch (e) {
      print('Error:- ${e.toString()}');
      CommonWidgets.showMyToastMessage('Failed to wallet history ...');
    }
    showProgress.value = false;
  }

  getApiType(String value) {
    switch (value) {
      case 'Help Center':
        return 'help_center';
      case 'Consultation in progress':
        return 'consultation_progress';
      case 'Security advice':
        return 'security_advice';
      case 'Coexistence rules':
        return 'coexistence_rules';
      case 'Legal warning':
        return 'legal_warning';
      case 'Terms and Conditions':
        return 'terms_conditions';
      case 'Privacy policies':
        return 'privacy_policy';
      case 'Change of consent':
        return 'change_consent';
      default:
        return '';
    }
  }
}
