import 'package:get/get.dart';
import 'package:rot_application/app/data/apis/api_models/get_card_list_model.dart';

import '../../../../common/common_widgets.dart';
import '../../../data/apis/api_constants/api_key_constants.dart';
import '../../../data/apis/api_methods/api_methods.dart';
import '../../../data/apis/api_models/get_account_model.dart';
import '../../../data/apis/api_models/get_delete_account_model.dart';
import '../../../data/apis/api_models/get_delete_card_model.dart';
import '../../../routes/app_pages.dart';

class BankInformationController extends GetxController {
  final count = 0.obs;
  Map<String, String?> parameters = Get.parameters;
  List<CardListData> cardList = [];
  List<bool> showCardStatus = [];
  final showLocalCard = false.obs;
  final showInternationalCard = false.obs;
  final showLoading = true.obs;
  final accountCard1 = true.obs;
  final accountCard2 = true.obs;
  final presentData = true.obs;
  List listOfCard = [
    'assets/un_used_images/card01.png',
    'assets/un_used_images/card02.png'
  ];
  GetAccountModel? localAccount;
  GetAccountModel? internationalAccount;

  @override
  void onInit() async {
    super.onInit();
    getMyCardList();
    getLocalAccount();
    getInternationAccount();
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

  Future<void> deleteAccount(int index) async {
    String type = index == 0 ? 'local' : 'international';
    showLoading.value = true;
    try {
      Map<String, dynamic> deleteAccountParameters = {
        ApiKeyConstants.id: type == 'local'
            ? localAccount!.data!.id
            : internationalAccount!.data!.id
      };
      print("bodyParam:-$deleteAccountParameters");
      DeleteAccountModel? deleteAccountModel =
          await ApiMethods.deleteLocalInternationalAccountApi(
              queryParameters: deleteAccountParameters);
      if (deleteAccountModel != null && deleteAccountModel.status == "1") {
        type == 'local'
            ? showLocalCard.value = false
            : showInternationalCard.value = false;
        CommonWidgets.showMyToastMessage(
            'Successfully complete delete account ...');
      } else {
        CommonWidgets.showMyToastMessage('delete account  failed ...');
      }
      showLoading.value = false;
      increment();
    } catch (e) {
      print('Error:- ${e.toString()}');
      CommonWidgets.showMyToastMessage('delete account failed ...');
      showLoading.value = false;
    }
  }

  editAccount(int index) {
    if (index == 0) {
      Map<String, String> data = {
        ApiKeyConstants.type: 'local',
      };

      Get.toNamed(Routes.ACCOUNTS, parameters: data);
    } else {
      Map<String, String> data = {
        ApiKeyConstants.type: 'international',
      };

      Get.toNamed(Routes.ACCOUNTS, parameters: data);
    }
  }

  getLocalAccount() async {
    Map<String, dynamic> bodyParams = {
      ApiKeyConstants.userId: parameters[ApiKeyConstants.userId],
      ApiKeyConstants.type: 'local',
    };
    GetAccountModel? getAccountModel =
        await ApiMethods.getAccountApi(queryParameters: bodyParams);
    if (getAccountModel != null &&
        getAccountModel.status == '1' &&
        getAccountModel.data != null) {
      localAccount = getAccountModel;
      showLocalCard.value = true;
      CommonWidgets.showMyToastMessage(
          'Successfully create  international account.');
    }
    increment();
  }

  getInternationAccount() async {
    Map<String, dynamic> bodyParams = {
      ApiKeyConstants.userId: parameters[ApiKeyConstants.userId],
      ApiKeyConstants.type: 'international',
    };
    GetAccountModel? getAccountModel =
        await ApiMethods.getAccountApi(queryParameters: bodyParams);
    if (getAccountModel != null &&
        getAccountModel.status == '1' &&
        getAccountModel.data != null) {
      internationalAccount = getAccountModel;
      showInternationalCard.value = true;
      CommonWidgets.showMyToastMessage(
          'Successfully create  international account.');
    }
    increment();
  }
}
