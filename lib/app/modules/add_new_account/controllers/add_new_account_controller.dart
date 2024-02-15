import 'package:get/get.dart';
import 'package:rot/app/data/constants/icons_constant.dart';
import 'package:rot/app/data/constants/string_constants.dart';

class AddNewAccountController extends GetxController {
  final count = 0.obs;

  List list = [
    {
      'title': StringConstants.currencyAccount,
      'subtitle': StringConstants.moreThanThirtyCurrencies,
      'icon': IconConstants.icCurrencyAccount
    },
    {
      'title': StringConstants.flexibleAccount,
      'subtitle': StringConstants.getUpTo,
      'icon': IconConstants.icFlexibleAccount
    },
    {
      'title': StringConstants.pockets,
      'subtitle': StringConstants.saveMoneyAndManage,
      'icon': IconConstants.icPockets
    },
    {
      'title': StringConstants.jointAccount,
      'subtitle': StringConstants.anAccountForAllTypes,
      'icon': IconConstants.icJointAccount
    },
    {
      'title': StringConstants.proAccount,
      'subtitle': StringConstants.discoverLoansAndCreditCards,
      'icon': IconConstants.icProAccount
    },
    {
      'title': StringConstants.credit,
      'subtitle': StringConstants.discoverLoansAndCreditCards,
      'icon': IconConstants.icCredit
    },
    {
      'title': StringConstants.accountGreaterThanEighteen,
      'subtitle': StringConstants.accountsForChildren,
      'icon': IconConstants.icAccountEighteen
    },
    {
      'title': StringConstants.linkedDevices,
      'subtitle': StringConstants.checkAllYourBankAccountsInOnePlace,
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
