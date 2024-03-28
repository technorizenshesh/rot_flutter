import 'package:get/get.dart';
import 'package:rot_application/app/data/constants/icons_constant.dart';

class ConverterController extends GetxController {
  final count = 0.obs;
  List<String> flagIconList = [
    IconConstants.icFlagEur,
    IconConstants.icFlagUsd,
    IconConstants.icFlagGpd,
    IconConstants.icFlagBtc
  ];
  List<String> titleList = [
    'Euro',
    'American Dollar',
    'British Pound',
    'Bitcoin'
  ];
  List<Map<String, String>> items = [
    {
      "title": "Euro",
      "subTitle": "EUR",
      "icon": IconConstants.icFlagEur,
      "amount": "100"
    },
    {
      "title": "American Dollar",
      "subTitle": "USD",
      "icon": IconConstants.icFlagUsd,
      "amount": "109.45"
    },
    {
      "title": "British Pound",
      "subTitle": "GPD",
      "icon": IconConstants.icFlagGpd,
      "amount": "85.95"
    },
    {
      "title": "Bitcoin",
      "subTitle": "BTC",
      "icon": IconConstants.icFlagBtc,
      "amount": "100"
    }
  ];
  List<String> subTitleList = ['EUR', 'USD', 'GPD', 'BTC'];
  List<String> amountList = ['100', '109.45', '85.95', '100'];
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

  void clickOnSave() {}
}
