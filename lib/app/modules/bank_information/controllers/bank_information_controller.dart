import 'package:get/get.dart';
import 'package:rot_application/app/data/apis/api_models/get_card_list_model.dart';

import '../../../../common/common_widgets.dart';
import '../../../data/apis/api_constants/api_key_constants.dart';
import '../../../data/apis/api_methods/api_methods.dart';
import '../../../routes/app_pages.dart';

class BankInformationController extends GetxController {
  final count = 0.obs;
  Map<String, String?> parameters = Get.parameters;
  List<CardListData> cardList = [];
  final showLoading = true.obs;
  final presentData = true.obs;
  List listOfCard = [
    'assets/un_used_images/card01.png',
    'assets/un_used_images/card02.png'
  ];

  @override
  void onInit() async {
    super.onInit();
    getMyCardList();
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

  clickOnAddNewCard() {
    Map<String, String> data = {
      ApiKeyConstants.userId: parameters[ApiKeyConstants.userId]!
    };
    Get.toNamed(Routes.ADD_NEW_CARD, parameters: data);
  }

  Future<void> getMyCardList() async {
    try {
      Map<String, dynamic> addNewCardParameters = {
        ApiKeyConstants.userId: parameters[ApiKeyConstants.userId],
      };
      print("bodyParam:-$addNewCardParameters");
      CardListModel? cardListModel =
          await ApiMethods.getCardListApi(bodyParams: addNewCardParameters);
      if (cardListModel != null && cardListModel.status == '1') {
        cardList = cardListModel.data!;
        presentData.value = true;
      } else {
        presentData.value = false;
        CommonWidgets.showMyToastMessage('Card are not added till now ...');
      }
    } catch (e) {
      presentData.value = false;
      print('Error:- ${e.toString()}');
      CommonWidgets.showMyToastMessage('Add new card failed ...');
    }
    showLoading.value = false;
  }
}
