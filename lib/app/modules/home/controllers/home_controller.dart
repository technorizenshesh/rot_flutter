import 'package:get/get.dart';
import 'package:rot/app/routes/app_pages.dart';
import 'package:rot/common/common_methods.dart';

import '../../../data/constants/icons_constant.dart';

class HomeController extends GetxController {
  final count = 0.obs;

  final cardIndex = 0.obs;

  List list = [
    {'title': 'Fashion', 'icon': IconConstants.icFashion},
    {'title': 'Electronics', 'icon': IconConstants.icComputerAndElectronic},
    {'title': 'Sports', 'icon': IconConstants.icSports},
    {'title': 'Furniture', 'icon': IconConstants.icFurniture},
  ];

  List listOfCards = [
    {
      'title': 'electric kettle',
      'price': '${CommonMethods.cur}29.00',
      'subTitle': 'Via del corso Rome 305, 98168 Villaggio..',
      'icon1': IconConstants.icMoneyReceived,
      'icon2': IconConstants.icTruck,
      'image': 'assets/un_used_images/image1.png',
    },
    {
      'title': 'boAt Rockerz 551 ANC...',
      'price': '${CommonMethods.cur}20.00',
      'subTitle': 'Via del corso Rome 305, 98168 Villaggio..',
      'icon1': IconConstants.icSaving,
      'icon2': IconConstants.icTruck,
      'image': 'assets/un_used_images/image2.png',
    },
    {
      'title': 'Badminton',
      'price': '${CommonMethods.cur}05.00',
      'subTitle': 'Rua dos Ingleses, 355 - Bela Vista 01327-000',
      'icon1': IconConstants.icHands,
      'icon2': IconConstants.icTruck,
      'image': 'assets/un_used_images/image3.png',
    },
    {
      'title': 'Canon D7500 DSLR Camera Body',
      'price': '${CommonMethods.cur}449.00',
      'subTitle': 'Via del corso Rome 305, 98168 Villaggio..',
      'icon1': IconConstants.icHands,
      'icon2': IconConstants.icTruck,
      'image': 'assets/un_used_images/image4.png',
    },
  ];

  List listOfCards2 = [
    {
      'title': 'electric kettle',
      'price': '${CommonMethods.cur}29.00',
      'subTitle': 'Via del corso Rome 305, 98168 Villaggio..',
      'icon1': IconConstants.icMoneyReceived,
      'icon2': IconConstants.icTruck,
      'image': 'assets/un_used_images/image5.png',
    },
    {
      'title': 'boAt Rockerz 551 ANC...',
      'price': '${CommonMethods.cur}20.00',
      'subTitle': 'Via del corso Rome 305, 98168 Villaggio..',
      'icon1': IconConstants.icSaving,
      'icon2': IconConstants.icTruck,
      'image': 'assets/un_used_images/image6.png',
    },
    {
      'title': 'Badminton',
      'price': '${CommonMethods.cur}05.00',
      'subTitle': 'Rua dos Ingleses, 355 - Bela Vista 01327-000',
      'icon1': IconConstants.icHands,
      'icon2': IconConstants.icTruck,
      'image': 'assets/un_used_images/image3.png',
    },
  ];
  List listOfCards3 = [
    {
      'title': 'electric kettle',
      'price': '${CommonMethods.cur}29.00',
      'subTitle': 'Via del corso Rome 305, 98168 Villaggio..',
      'icon1': IconConstants.icMoneyReceived,
      'icon2': IconConstants.icTruck,
      'image': 'assets/un_used_images/image7.png',
    },
    {
      'title': 'boAt Rockerz 551 ANC...',
      'price': '${CommonMethods.cur}20.00',
      'subTitle': 'Via del corso Rome 305, 98168 Villaggio..',
      'icon1': IconConstants.icSaving,
      'icon2': IconConstants.icTruck,
      'image': 'assets/un_used_images/image8.png',
    },
    {
      'title': 'Badminton',
      'price': '${CommonMethods.cur}05.00',
      'subTitle': 'Rua dos Ingleses, 355 - Bela Vista 01327-000',
      'icon1': IconConstants.icHands,
      'icon2': IconConstants.icTruck,
      'image': 'assets/un_used_images/image5.png',
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

  clickOnCard({required int index}) {
    Get.toNamed(Routes.PRODUCT_DETAIL);
  }

  seeAll() {
    Get.toNamed(Routes.CATEGORIES);
  }

  clickOnSearchTextField() {
    Get.toNamed(Routes.SEARCH);
  }
}
