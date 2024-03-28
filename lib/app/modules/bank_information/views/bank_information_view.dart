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
        bottomNavigationBar: Container(
          height: 40.px,
          alignment: Alignment.center,
          margin: const EdgeInsets.only(bottom: 20, right: 80, left: 80),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20.px),
            border: Border.all(
              color: Theme.of(context).primaryColor.withOpacity(.4.px),
              width: .4.px,
            ),
          ),
          child: InkWell(
            onTap: () => controller.clickOnAddNewCard(),
            child: Padding(
              padding: EdgeInsets.all(8.px),
              child: Text(
                "+   ${StringConstants.addNewCard.tr}",
                style: Theme.of(context).textTheme.displayMedium?.copyWith(
                    fontSize: 16.px, color: Theme.of(context).primaryColor),
              ),
            ),
          ),
        ),
        body: Obx(
          () => controller.showLoading.value
              ? const Center(child: CircularProgressIndicator())
              : ListView(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(
                          left: 15.px, top: 10.px, bottom: 5.px),
                      child: Text(
                        "Credit or Debit Card",
                        style: Theme.of(Get.context!)
                            .textTheme
                            .displayMedium
                            ?.copyWith(
                                fontSize: 16.px, fontWeight: FontWeight.bold),
                      ),
                    ),
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
                                  child: Obx(() {
                                    controller.count.value;
                                    return controller.showCardStatus[index]
                                        ? Stack(
                                            children: [
                                              CommonWidgets.appIcons(
                                                  assetName: index % 2 == 0
                                                      ? ImageConstants
                                                          .imageCard1
                                                      : ImageConstants
                                                          .imageCard2,
                                                  width: MediaQuery.of(context)
                                                      .size
                                                      .width,
                                                  height: 200.px,
                                                  borderRadius: 15.px),
                                              Padding(
                                                padding:
                                                    const EdgeInsets.all(15),
                                                child: Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      children: [
                                                        Text(
                                                          'Visa',
                                                          style: Theme.of(
                                                                  Get.context!)
                                                              .textTheme
                                                              .displayMedium
                                                              ?.copyWith(
                                                                  fontSize:
                                                                      20.px,
                                                                  color: Colors
                                                                      .white),
                                                        ),
                                                        Row(
                                                          children: [
                                                            CommonWidgets.appIcons(
                                                                assetName:
                                                                    'assets/un_used_images/logos_visa.png',
                                                                width: 35.px,
                                                                height: 20.px,
                                                                color: Colors
                                                                    .white,
                                                                fit: BoxFit
                                                                    .fill),
                                                            SizedBox(
                                                              width: 8.px,
                                                            ),
                                                            GestureDetector(
                                                              onTap: () {
                                                                controller.showCardStatus[
                                                                        index] =
                                                                    false;
                                                                controller
                                                                    .increment();
                                                              },
                                                              child: Container(
                                                                height: 30,
                                                                width: 30,
                                                                alignment:
                                                                    Alignment
                                                                        .center,
                                                                decoration: BoxDecoration(
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            15),
                                                                    color: Colors
                                                                        .grey
                                                                        .withOpacity(
                                                                            0.6)),
                                                                child: const Icon(
                                                                    Icons
                                                                        .more_vert,
                                                                    size: 20,
                                                                    color: Colors
                                                                        .white),
                                                              ),
                                                            ),
                                                          ],
                                                        )
                                                      ],
                                                    ),
                                                    SizedBox(
                                                      height: 50.px,
                                                    ),
                                                    Text(
                                                      "*************${item.cardNumber.toString().substring(item.cardNumber!.length - 4, item.cardNumber!.length)}",
                                                      //'${item.cardNumber}',
                                                      style: Theme.of(
                                                              Get.context!)
                                                          .textTheme
                                                          .displayMedium
                                                          ?.copyWith(
                                                              fontSize: 16.px,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold,
                                                              color:
                                                                  Colors.white),
                                                    ),
                                                    SizedBox(
                                                      height: 10.px,
                                                    ),
                                                    Text(
                                                      item.expireDate ?? '',
                                                      style: Theme.of(
                                                              Get.context!)
                                                          .textTheme
                                                          .displayMedium
                                                          ?.copyWith(
                                                              fontSize: 14.px,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .normal,
                                                              color:
                                                                  Colors.white),
                                                    ),
                                                    SizedBox(
                                                      height: 15.px,
                                                    ),
                                                    Text(
                                                      item.cardHolderName ?? '',
                                                      style: Theme.of(
                                                              Get.context!)
                                                          .textTheme
                                                          .displayMedium
                                                          ?.copyWith(
                                                              fontSize: 16.px,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold,
                                                              color:
                                                                  Colors.white),
                                                    ),
                                                  ],
                                                ),
                                              )
                                            ],
                                          )
                                        : Stack(
                                            children: [
                                              Container(
                                                  height: 180.px,
                                                  width: MediaQuery.of(context)
                                                      .size
                                                      .width,
                                                  margin: EdgeInsets.all(10.px),
                                                  decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            15),
                                                    gradient:
                                                        const LinearGradient(
                                                      begin: Alignment.topLeft,
                                                      end:
                                                          Alignment.bottomRight,
                                                      colors: [
                                                        Colors.blueAccent,
                                                        Colors.teal
                                                      ],
                                                    ),
                                                  ),
                                                  child: Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .center,
                                                    children: [
                                                      Container(
                                                        height: 50.px,
                                                        color: Colors.black,
                                                        margin: EdgeInsets.only(
                                                            top: 30.px,
                                                            bottom: 40.px),
                                                      ),
                                                      GestureDetector(
                                                        onTap: () {
                                                          controller.deleteCard(
                                                              item.id
                                                                  .toString());
                                                        },
                                                        child: Container(
                                                          height: 40.px,
                                                          width: 150.px,
                                                          alignment:
                                                              Alignment.center,
                                                          decoration:
                                                              BoxDecoration(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        25.px),
                                                            color: Colors.white,
                                                          ),
                                                          child: const Text(
                                                            'Delete Card',
                                                            style: TextStyle(
                                                                fontSize: 16,
                                                                color: Colors
                                                                    .black87),
                                                            textAlign: TextAlign
                                                                .center,
                                                          ),
                                                        ),
                                                      )
                                                    ],
                                                  )),
                                              Positioned(
                                                  top: 0,
                                                  left: 0,
                                                  child: GestureDetector(
                                                    onTap: () {
                                                      controller.showCardStatus[
                                                          index] = true;
                                                      controller.increment();
                                                    },
                                                    child: Container(
                                                      height: 36.px,
                                                      width: 36.px,
                                                      alignment:
                                                          Alignment.center,
                                                      decoration: BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(18),
                                                        color: Colors.grey
                                                            .withOpacity(0.8),
                                                      ),
                                                      child: const Icon(
                                                        Icons.arrow_back,
                                                        color: Colors.white,
                                                        size: 30,
                                                      ),
                                                    ),
                                                  ))
                                            ],
                                          );
                                  }));
                            },
                          )
                        : SizedBox(
                            height: 300.px,
                            child: CommonWidgets.dataNotFound())),
                    SizedBox(height: 5.px),
                    Padding(
                      padding: EdgeInsets.only(
                          left: 15.px, top: 10.px, bottom: 5.px),
                      child: Text(
                        "Bank Account",
                        style: Theme.of(Get.context!)
                            .textTheme
                            .displayMedium
                            ?.copyWith(
                                fontSize: 16.px, fontWeight: FontWeight.bold),
                      ),
                    ),
                    SizedBox(height: 15.px),
                    SizedBox(height: 24.px),
                  ],
                ),
        ));
  }
}
