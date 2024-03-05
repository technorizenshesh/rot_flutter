import 'package:get/get.dart';

import '../../../data/constants/icons_constant.dart';
import '../../../data/constants/string_constants.dart';

class AddNewAccountController extends GetxController {
  final count = 0.obs;

  List list = [
    {
      'title': StringConstants.currencyAccount.tr,
      'subtitle': StringConstants.moreThanThirtyCurrencies.tr,
      'icon': IconConstants.icCurrencyAccount.tr
    },
    {
      'title': StringConstants.flexibleAccount.tr,
      'subtitle': StringConstants.getUpTo.tr,
      'icon': IconConstants.icFlexibleAccount.tr
    },
    {
      'title': StringConstants.pockets.tr,
      'subtitle': StringConstants.saveMoneyAndManage.tr,
      'icon': IconConstants.icPockets.tr
    },
    {
      'title': StringConstants.jointAccount.tr,
      'subtitle': StringConstants.anAccountForAllTypes.tr,
      'icon': IconConstants.icJointAccount
    },
    {
      'title': StringConstants.proAccount.tr,
      'subtitle': StringConstants.discoverLoansAndCreditCards.tr,
      'icon': IconConstants.icProAccount
    },
    {
      'title': StringConstants.credit.tr,
      'subtitle': StringConstants.discoverLoansAndCreditCards.tr,
      'icon': IconConstants.icCredit
    },
    {
      'title': StringConstants.accountGreaterThanEighteen.tr,
      'subtitle': StringConstants.accountsForChildren.tr,
      'icon': IconConstants.icAccountEighteen
    },
    {
      'title': StringConstants.linkedDevices.tr,
      'subtitle': StringConstants.checkAllYourBankAccountsInOnePlace.tr,
      'icon': IconConstants.icLinkedDevices
    },
  ];

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
}
