import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:rot_application/app/data/constants/image_constants.dart';

import '../../../../common/common_widgets.dart';
import '../../../data/apis/api_models/get_card_list_model.dart';
import '../../../data/constants/string_constants.dart';
import '../controllers/bank_information_controller.dart';

class BankInformationView extends GetView<BankInformationController> {
  const BankInformationView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: CommonWidgets.appBar(title: StringConstants.bankInformation.tr),
        body: Obx(
          () => controller.showLoading.value
              ? const Center(child: CircularProgressIndicator())
              : ListView(
                  children: [
                    Obx(() => controller.presentData.value
                        ? ListView.builder(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemCount: controller.cardList.length,
                            itemBuilder: (context, index) {
                              CardListData item = controller.cardList[index];
                              return Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 16.px, vertical: 10.px),
                                child: Stack(
                                  children: [
                                    CommonWidgets.appIcons(
                                        assetName: index % 2 == 0
                                            ? ImageConstants.imageCard1
                                            : ImageConstants.imageCard2,
                                        width:
                                            MediaQuery.of(context).size.width,
                                        height: 200.px,
                                        borderRadius: 15.px),
                                    Padding(
                                      padding: const EdgeInsets.all(15),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(
                                                'Visa',
                                                style: Theme.of(Get.context!)
                                                    .textTheme
                                                    .displayMedium
                                                    ?.copyWith(
                                                        fontSize: 20.px,
                                                        color: Colors.white),
                                              ),
                                              Container(
                                                height: 30,
                                                width: 30,
                                                alignment: Alignment.center,
                                                decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            15),
                                                    color: Colors.grey),
                                                child: const Icon(
                                                    Icons.more_vert,
                                                    size: 20,
                                                    color: Colors.white),
                                              )
                                            ],
                                          ),
                                          SizedBox(
                                            height: 50.px,
                                          ),
                                          Text(
                                            '${item.cardNumber}',
                                            style: Theme.of(Get.context!)
                                                .textTheme
                                                .displayMedium
                                                ?.copyWith(
                                                    fontSize: 16.px,
                                                    fontWeight: FontWeight.bold,
                                                    color: Colors.white),
                                          ),
                                          SizedBox(
                                            height: 10.px,
                                          ),
                                          Text(
                                            item.expireDate ?? '',
                                            style: Theme.of(Get.context!)
                                                .textTheme
                                                .displayMedium
                                                ?.copyWith(
                                                    fontSize: 14.px,
                                                    fontWeight:
                                                        FontWeight.normal,
                                                    color: Colors.white),
                                          ),
                                          SizedBox(
                                            height: 15.px,
                                          ),
                                          Text(
                                            item.cardHolderName ?? '',
                                            style: Theme.of(Get.context!)
                                                .textTheme
                                                .displayMedium
                                                ?.copyWith(
                                                    fontSize: 16.px,
                                                    fontWeight: FontWeight.bold,
                                                    color: Colors.white),
                                          ),
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              );
                            },
                          )
                        : SizedBox(
                            height: 300.px,
                            child: CommonWidgets.dataNotFound())),
                    SizedBox(height: 24.px),
                    Center(
                      child: InkWell(
                        onTap: () => controller.clickOnAddNewCard(),
                        borderRadius: BorderRadius.circular(20.px),
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20.px),
                            border: Border.all(
                              color: Theme.of(context)
                                  .primaryColor
                                  .withOpacity(.4.px),
                              width: .4.px,
                            ),
                          ),
                          child: Padding(
                            padding: EdgeInsets.all(8.px),
                            child: Text(
                              "+   ${StringConstants.addNewCard.tr}",
                              style: Theme.of(context)
                                  .textTheme
                                  .displayMedium
                                  ?.copyWith(
                                      fontSize: 16.px,
                                      color: Theme.of(context).primaryColor),
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 24.px),
                  ],
                ),
        ));
  }
}
