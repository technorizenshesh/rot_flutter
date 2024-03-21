import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:rot_application/app/data/constants/image_constants.dart';

import '../../../../common/common_widgets.dart';
import '../../../data/apis/api_constants/api_key_constants.dart';
import '../../../data/apis/api_methods/api_methods.dart';
import '../../../data/apis/api_models/get_card_list_model.dart';
import '../../../data/constants/string_constants.dart';
import '../../../routes/app_pages.dart';

class RechargeController extends GetxController {
  TextEditingController amountController = TextEditingController();
  final count = 0.obs;
  Map<String, String?> parameters = Get.parameters;
  List<CardListData> cardList = [];
  final showLoading = true.obs;
  final presentData = true.obs;
  List listOfListTile = [
    {
      'title': 'Axis Bank **** **** **** 8395',
      'icon': 'assets/un_used_images/logos_mastercard.png'
    },
    {
      'title': 'HDFC Bank **** **** **** 6246',
      'icon': 'assets/un_used_images/logos_visa.png'
    },
  ];

  final cardIndex = 0.obs;

  List listOfData = [
    {
      'image': ImageConstants.imageYouCanNow,
      'title': 'You can now recharge your ROT wallet',
      'subTitle': 'Recharge the money you want for when you need it',
    },
    {
      'image': ImageConstants.imageWithAFullWallet,
      'title': 'With a full wallet you pay better',
      'subTitle':
          'You will not need to carry cash or give your cell phone when you shop at person, because the money will already be in your wallet',
    },
    {
      'image': ImageConstants.imageCardOrPayPal,
      'title': 'Use card or PayPal and receive the recharge instantly',
      'subTitle':
          'Choose how you want to recharge and receive the money instantly in your wallet',
    },
  ];

  @override
  void onInit() {
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

  clickOnListTile({required int index}) {
    if (amountController.text.isNotEmpty) {
      Map<String, String> data = {
        ApiKeyConstants.userId: parameters[ApiKeyConstants.userId]!,
        ApiKeyConstants.amount: amountController.text.isNotEmpty
            ? amountController.text.toString()
            : '0'
      };
      Get.toNamed(Routes.RECHARGE_SUMMARY,
          parameters: data, arguments: cardList[index]);
    } else {
      CommonWidgets.showMyToastMessage('Please enter recharge amount');
    }
  }

  clickOnReloadWallet() {
    showDialog(
      context: Get.context!,
      builder: (context) {
        return AlertDialog(
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          surfaceTintColor: Theme.of(context).scaffoldBackgroundColor,
          content: SizedBox(
            height: MediaQuery.of(context).size.height / 1.5,
            width: MediaQuery.of(context).size.width,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Align(
                  alignment: Alignment.topRight,
                  child: GestureDetector(
                    onTap: () {
                      Get.back();
                    },
                    child: Icon(Icons.highlight_remove_outlined,
                        color: Theme.of(context).primaryColor),
                  ),
                ),
                CarouselSlider(
                  items: List.generate(
                    listOfData.length,
                    (index) => Column(
                      children: [
                        CommonWidgets.appIcons(
                          assetName: listOfData[index]['image'],
                          height: 220.px,
                          width: double.infinity,
                        ),
                        Column(
                          children: [
                            Text(
                              listOfData[index]['title'],
                              textAlign: TextAlign.center,
                              style: Theme.of(context)
                                  .textTheme
                                  .displayMedium
                                  ?.copyWith(fontSize: 18.px),
                            ),
                            SizedBox(height: 20.px),
                            Text(
                              listOfData[index]['subTitle'],
                              textAlign: TextAlign.center,
                              style: Theme.of(context)
                                  .textTheme
                                  .titleMedium
                                  ?.copyWith(fontSize: 14.px),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  options: CarouselOptions(
                    height: 400.px,
                    onPageChanged: (index, reason) {
                      cardIndex.value = index;
                    },
                    initialPage: 0,
                    enableInfiniteScroll: true,
                    reverse: false,
                    autoPlay: true,
                    enlargeStrategy: CenterPageEnlargeStrategy.scale,
                    autoPlayInterval: const Duration(seconds: 3),
                    autoPlayAnimationDuration:
                        const Duration(milliseconds: 1200),
                    autoPlayCurve: Curves.easeIn,
                    scrollDirection: Axis.horizontal,
                    enlargeCenterPage: true,
                    viewportFraction: 1,
                  ),
                ),
                Obx(
                  () {
                    count.value;
                    return Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Wrap(
                          children: List.generate(
                            listOfData.length,
                            (index) => Padding(
                              padding: EdgeInsets.all(2.px),
                              child: Center(
                                child: Container(
                                  width: 8.px,
                                  height: 8.px,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(4.px),
                                    color: cardIndex.value == index
                                        ? Theme.of(context).primaryColor
                                        : Theme.of(context)
                                            .colorScheme
                                            .onSecondaryContainer,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    );
                  },
                ),
                CommonWidgets.commonElevatedButton(
                  onPressed: () => clickOnFollowing(),
                  childText: Text(
                    StringConstants.following,
                    style: Theme.of(context)
                        .textTheme
                        .headlineSmall
                        ?.copyWith(fontWeight: FontWeight.w700),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  clickOnFollowing() {}
}
