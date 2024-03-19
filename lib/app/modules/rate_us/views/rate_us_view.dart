import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../../common/common_widgets.dart';
import '../../../data/constants/image_constants.dart';
import '../../../data/constants/string_constants.dart';
import '../controllers/rate_us_controller.dart';

class RateUsView extends GetView<RateUsController> {
  const RateUsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 15.px),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: 40.px),
                CommonWidgets.appBarView(
                    title: StringConstants.submitYourReview.tr),
                SizedBox(height: 20.px),
                Padding(
                  padding: EdgeInsets.all(20.px),
                  child: SizedBox(
                    width: double.infinity,
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              StringConstants.rateYourExperienceWithPedro.tr,
                              style: Theme.of(context)
                                  .textTheme
                                  .displayMedium
                                  ?.copyWith(fontSize: 12.px),
                            ),
                            const Icon(
                              Icons.check_circle,
                              size: 25,
                              color: Colors.teal,
                            )
                          ],
                        ),
                        SizedBox(height: 20.px),
                        Image.asset(
                          ImageConstants.imageReview,
                          height: 200.px,
                          width: double.infinity,
                          fit: BoxFit.cover,
                        ),
                        SizedBox(height: 20.px),
                        Text(
                          StringConstants.clickOnStarLeave.tr,
                          textAlign: TextAlign.center,
                          style: Theme.of(context)
                              .textTheme
                              .titleMedium
                              ?.copyWith(fontSize: 12.px),
                        ),
                        SizedBox(height: 20.px),
                        SizedBox(height: 50.px, child: customRatingBar()),
                        SizedBox(height: 20.px),
                        Container(
                          padding: EdgeInsets.symmetric(
                              vertical: 4.px, horizontal: 10.px),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12.px),
                            color: Theme.of(context)
                                .colorScheme
                                .onSecondary
                                .withOpacity(0.2), // Background color
                          ),
                          child: TextField(
                            maxLines: 3,
                            controller: controller.commentController,
                            style: Theme.of(Get.context!)
                                .textTheme
                                .titleMedium
                                ?.copyWith(
                                    color: Theme.of(Get.context!).primaryColor),
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: "Type Here",
                              hintStyle:
                                  Theme.of(Get.context!).textTheme.titleMedium,
                            ),
                          ),
                        ),
                        SizedBox(height: 20.px),
                        CommonWidgets.commonElevatedButton(
                            onPressed: () => controller.clickOnSendButton(),
                            childText: Obx(
                              () => controller.bntLoading.value
                                  ? const Center(
                                      child: CircularProgressIndicator(
                                      color: Colors.white,
                                    ))
                                  : Text(
                                      StringConstants.submit.tr,
                                      style: Theme.of(context)
                                          .textTheme
                                          .headlineSmall
                                          ?.copyWith(
                                              fontWeight: FontWeight.w700),
                                    ),
                            )),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget customRatingBar() {
    return Obx(() {
      controller.rating.value;
      return ListView.builder(
          itemCount: 5,
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          physics: const NeverScrollableScrollPhysics(),
          itemBuilder: (BuildContext context, int index) {
            return GestureDetector(
              onTap: () {
                controller.rating.value = index + 1;
              },
              child: Container(
                width: 45.px,
                height: 45.px,
                margin: EdgeInsets.only(left: 5.px, right: 5.px),
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    border: Border.all(
                        color: controller.rating.value > index
                            ? Colors.orangeAccent
                            : Colors.grey,
                        width: 1),
                    borderRadius: BorderRadius.circular(10)),
                child: Icon(
                  Icons.star,
                  size: 30,
                  color: controller.rating.value > index
                      ? Colors.orangeAccent
                      : Colors.grey,
                ),
              ),
            );
          });
    });
  }
}
