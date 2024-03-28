import 'package:get/get.dart';
import 'package:rot_application/app/data/apis/api_models/get_card_list_model.dart';

import '../../../../common/common_widgets.dart';
import '../../../data/apis/api_constants/api_key_constants.dart';
import '../../../data/apis/api_methods/api_methods.dart';
import '../../../data/apis/api_models/get_delete_card_model.dart';
import '../../../routes/app_pages.dart';

class BankInformationController extends GetxController {
  final count = 0.obs;
  Map<String, String?> parameters = Get.parameters;
  List<CardListData> cardList = [];
  List<bool> showCardStatus = [];
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

  Future<void> deleteCard(String cardId) async {
    showLoading.value = true;
    try {
      Map<String, dynamic> deleteCardParameters = {
        //ApiKeyConstants.userId: parameters[ApiKeyConstants.userId],
        ApiKeyConstants.cardId: cardId,
      };
      print("bodyParam:-$deleteCardParameters");
      DeleteCardModel? deleteCardModel =
          await ApiMethods.deleteCardApi(bodyParams: deleteCardParameters);
      if (deleteCardModel != null && deleteCardModel.status == "1") {
        getMyCardList();
        CommonWidgets.showMyToastMessage(
            'Successfully complete delete card ...');
      } else {
        CommonWidgets.showMyToastMessage('delete card failed ...');
        showLoading.value = false;
      }
    } catch (e) {
      print('Error:- ${e.toString()}');
      CommonWidgets.showMyToastMessage('delete card failed ...');
      showLoading.value = false;
    }
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
        showCardStatus = List<bool>.generate(cardList.length, (index) => true);
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
