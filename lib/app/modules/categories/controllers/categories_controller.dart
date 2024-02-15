import 'package:get/get.dart';
import 'package:rot/app/data/constants/icons_constant.dart';
import 'package:rot/app/data/constants/string_constants.dart';
import 'package:rot/app/data/constants/string_constants.dart';
import 'package:rot/app/data/constants/string_constants.dart';
import 'package:rot/app/data/constants/string_constants.dart';
import 'package:rot/app/data/constants/string_constants.dart';
import 'package:rot/app/data/constants/string_constants.dart';
import 'package:rot/app/data/constants/string_constants.dart';
import 'package:rot/app/data/constants/string_constants.dart';
import 'package:rot/app/data/constants/string_constants.dart';
import 'package:rot/app/data/constants/string_constants.dart';
import 'package:rot/app/data/constants/string_constants.dart';
import 'package:rot/app/data/constants/string_constants.dart';
import 'package:rot/app/data/constants/string_constants.dart';
import 'package:rot/app/data/constants/string_constants.dart';
import 'package:rot/app/data/constants/string_constants.dart';
import 'package:rot/app/data/constants/string_constants.dart';
import 'package:rot/app/data/constants/string_constants.dart';
import 'package:rot/app/data/constants/string_constants.dart';
import 'package:rot/app/data/constants/string_constants.dart';
import 'package:rot/app/data/constants/string_constants.dart';
import 'package:rot/app/data/constants/string_constants.dart';
import 'package:rot/app/data/constants/string_constants.dart';
import 'package:rot/app/data/constants/string_constants.dart';
import 'package:rot/app/data/constants/string_constants.dart';

class CategoriesController extends GetxController {
  final count = 0.obs;

  List list = [
    {'title': StringConstants.cars, 'icon': IconConstants.icCar},
    {'title': StringConstants.motorcycle, 'icon': IconConstants.icBike},
    {'title': StringConstants.realEstate, 'icon': IconConstants.icRealEstate},
    {'title': StringConstants.employment, 'icon': IconConstants.icEmployment},
    {'title': StringConstants.business, 'icon': IconConstants.icBusiness},
    {'title': StringConstants.services, 'icon': IconConstants.icServices},
    {'title': StringConstants.computer, 'icon': IconConstants.icComputer},
    {'title': StringConstants.phone, 'icon': IconConstants.icPhoneCategory},
    {'title': StringConstants.baby, 'icon': IconConstants.icBaby},
    {'title': StringConstants.games, 'icon': IconConstants.icGame},
    {'title': StringConstants.fashion, 'icon': IconConstants.icFashion},
    {'title': StringConstants.sports, 'icon': IconConstants.icSports},
    {'title': StringConstants.leisure, 'icon': IconConstants.icLeisure},
    {'title': StringConstants.agriculture, 'icon': IconConstants.icAgriculture},
    {'title': StringConstants.community, 'icon': IconConstants.icCommunity},
    {'title': StringConstants.training, 'icon': IconConstants.icTraining},
    {'title': StringConstants.imageAndSound, 'icon': IconConstants.icImageAndSound},
    {'title': StringConstants.sportsAndNautical, 'icon': IconConstants.icSportsAndNautical},
    {'title': StringConstants.computerAndElectronic,'icon': IconConstants.icComputerAndElectronic},
    {'title': StringConstants.hobbiesAndLeisure, 'icon': IconConstants.icHobbies},
    {'title': StringConstants.engineAndAccessories, 'icon': IconConstants.icEngineAndAccessories},
    {'title': StringConstants.homeAndGarden, 'icon': IconConstants.icHomeAndGarden},
    {'title': StringConstants.collecting, 'icon': IconConstants.icCollecting},
    {'title': StringConstants.tourism, 'icon': IconConstants.icTourism},
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
