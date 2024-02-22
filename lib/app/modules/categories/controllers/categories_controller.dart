import 'package:get/get.dart';

import '../../../data/constants/icons_constant.dart';
import '../../../data/constants/string_constants.dart';

class CategoriesController extends GetxController {
  final count = 0.obs;

  List list = [
    {'title': StringConstants.cars.tr, 'icon': IconConstants.icCar},
    {'title': StringConstants.motorcycle.tr, 'icon': IconConstants.icBike},
    {
      'title': StringConstants.realEstate.tr,
      'icon': IconConstants.icRealEstate
    },
    {
      'title': StringConstants.employment.tr,
      'icon': IconConstants.icEmployment
    },
    {'title': StringConstants.business.tr, 'icon': IconConstants.icBusiness},
    {'title': StringConstants.services.tr, 'icon': IconConstants.icServices},
    {'title': StringConstants.computer.tr, 'icon': IconConstants.icComputer},
    {'title': StringConstants.phone.tr, 'icon': IconConstants.icPhoneCategory},
    {'title': StringConstants.baby.tr, 'icon': IconConstants.icBaby},
    {'title': StringConstants.games.tr, 'icon': IconConstants.icGame},
    {'title': StringConstants.fashion.tr, 'icon': IconConstants.icFashion},
    {'title': StringConstants.sports.tr, 'icon': IconConstants.icSports},
    {'title': StringConstants.leisure.tr, 'icon': IconConstants.icLeisure},
    {
      'title': StringConstants.agriculture.tr,
      'icon': IconConstants.icAgriculture
    },
    {'title': StringConstants.community.tr, 'icon': IconConstants.icCommunity},
    {'title': StringConstants.training.tr, 'icon': IconConstants.icTraining},
    {
      'title': StringConstants.imageAndSound.tr,
      'icon': IconConstants.icImageAndSound
    },
    {
      'title': StringConstants.sportsAndNautical.tr,
      'icon': IconConstants.icSportsAndNautical
    },
    {
      'title': StringConstants.computerAndElectronic.tr,
      'icon': IconConstants.icComputerAndElectronic
    },
    {
      'title': StringConstants.hobbiesAndLeisure.tr,
      'icon': IconConstants.icHobbies
    },
    {
      'title': StringConstants.engineAndAccessories.tr,
      'icon': IconConstants.icEngineAndAccessories
    },
    {
      'title': StringConstants.homeAndGarden.tr,
      'icon': IconConstants.icHomeAndGarden
    },
    {
      'title': StringConstants.collecting.tr,
      'icon': IconConstants.icCollecting
    },
    {'title': StringConstants.tourism.tr, 'icon': IconConstants.icTourism},
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

  clickOnCard({required int index}) {}
}
