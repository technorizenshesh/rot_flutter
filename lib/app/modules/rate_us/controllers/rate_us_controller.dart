import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:rot_application/app/data/apis/api_models/get_simple_model.dart';
import 'package:rot_application/common/common_widgets.dart';

import '../../../data/apis/api_constants/api_key_constants.dart';
import '../../../data/apis/api_methods/api_methods.dart';

class RateUsController extends GetxController {
  //TODO: Implement RateUsController
  TextEditingController commentController = TextEditingController();
  final count = 0.obs;
  final rating = 3.obs;
  final bntLoading = false.obs;
  Map<String, String?> parameters = Get.parameters;
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

  clickOnSendButton() {
    bntLoading.value = true;
    addReviewApi();
  }

  Future<void> addReviewApi() async {
    try {
      Map<String, dynamic> addReviewQueryParam = {
        ApiKeyConstants.userId: parameters[ApiKeyConstants.userId],
        ApiKeyConstants.review: commentController.text.toString(),
        ApiKeyConstants.rating: rating.value.toString(),
        ApiKeyConstants.sellerId: parameters[ApiKeyConstants.otherUserId],
      };
      print("body param:---${addReviewQueryParam}");
      SimpleResponseModel? simpleResponseModel =
          await ApiMethods.addReview(queryParameters: addReviewQueryParam);
      if (simpleResponseModel!.status == 1) {
        CommonWidgets.showMyToastMessage('Thanks for add your review...');
      } else {
        CommonWidgets.showMyToastMessage('Failed add your review...');
      }
    } catch (e) {
      print("Error:- ${e.toString()}");
    }
    bntLoading.value = false;
  }
}
