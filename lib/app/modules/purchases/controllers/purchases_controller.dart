import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:rot_application/app/data/apis/api_models/get_product_delivery_model.dart';

import '../../../../common/common_widgets.dart';
import '../../../data/apis/api_constants/api_key_constants.dart';
import '../../../data/apis/api_methods/api_methods.dart';
import '../../../data/apis/api_models/get_simple_model.dart';
import '../../../data/constants/icons_constant.dart';
import '../../../data/constants/string_constants.dart';
import '../../../routes/app_pages.dart';

class PurchasesController extends GetxController
    with GetSingleTickerProviderStateMixin {
  Map<String, String?> parameters = Get.parameters;
  final count = 0.obs;
  final showLoading = true.obs;
  String userId = '';
  late TabController tabController;
  final tabs = [
    const Tab(text: StringConstants.completed),
    const Tab(text: StringConstants.ongoing),
  ];

  GetProductDeliveryModel? getProductDeliveryModel;
  List<GetProductDeliveryData> pendingDeliveryList = [];
  List<GetProductDeliveryData> completeDeliveryList = [];

  @override
  void onInit() async {
    tabController = TabController(length: 2, vsync: this);
    super.onInit();
    userId = parameters[ApiKeyConstants.userId]!;
    await getCompleteDeliveryApi();
    await getPendingDeliveryApi();
    changeShowLoading(false);
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

  bool isDateWithinFiveDays(String givenDate) {
    DateTime parsedGivenDate = DateTime.parse(givenDate);

    DateTime currentDate = DateTime.now();

    Duration difference = currentDate.difference(parsedGivenDate);
    return difference.inDays.abs() < 2;
  }

  void changeShowLoading(bool value) {
    showLoading.value = value;
  }

  void clickOnIReceived(int index, String type) {
    CommonWidgets.showAlertDialog(
      title: 'Order Received',
      content: 'Are you sure you received order ?',
      onPressedYes: () {
        Get.back();
        callAcceptReceivedOrderApi(index, type);
      },
    );
  }

  void clickOnCancel(int index, String type) {
    CommonWidgets.showAlertDialog(
      title: 'Order Cancel',
      content: 'Are you sure you want to cancel order?',
      onPressedYes: () {
        Get.back();
        callAcceptReceivedOrderApi(index, type);
      },
    );
  }

  void clickOnReturn(int index) {
    CommonWidgets.showAlertDialog(
      title: 'Return Order ',
      content: 'Are you sure you want to return order?',
      onPressedYes: () {
        Get.back();
        callReturnOrderApi(
          index,
        );
      },
    );
  }

  void clickOnFeedback(int index) {
    Map<String, String> detailForChat = {
      'userName': completeDeliveryList[index].userName ?? '',
      'userImage': completeDeliveryList[index].image ?? '',
      'userAmount': completeDeliveryList[index].amount ?? '',
      'otherUserId': completeDeliveryList[index].productUserId ?? '',
      'userId': userId,
      'request_id': completeDeliveryList[index].productId ?? '',
      'product_status':
          completeDeliveryList[index].productUserId == userId ? 'Yes' : 'No',
    };
    Get.toNamed(Routes.CHAT_DETAIL, parameters: detailForChat);
  }

  Future<void> callAcceptReceivedOrderApi(int index, String type) async {
    Map<String, dynamic> getQueryParameters = {
      ApiKeyConstants.userId: userId,
      ApiKeyConstants.productId: pendingDeliveryList[index].productId,
      ApiKeyConstants.orderId: pendingDeliveryList[index].id,
      ApiKeyConstants.type: type //index==0?'Cancel':'Complete'
    };
    SimpleResponseModel? simpleResponseModel =
        await ApiMethods.acceptRejectApi(bodyParams: getQueryParameters);

    if (simpleResponseModel != null && simpleResponseModel.status == 1) {
      CommonWidgets.showMyToastMessage('Successfully order delivered ....');
      Get.back();
    } else {
      CommonWidgets.showMyToastMessage(simpleResponseModel!.messages ?? '');
    }
  }

  Future<void> callReturnOrderApi(int index) async {
    Map<String, dynamic> getQueryParameters = {
      ApiKeyConstants.userId: userId,
      ApiKeyConstants.productId: completeDeliveryList[index].productId,
      ApiKeyConstants.orderId: completeDeliveryList[index].id,
      ApiKeyConstants.type: 'Return'
    };
    SimpleResponseModel? simpleResponseModel =
        await ApiMethods.acceptRejectApi(bodyParams: getQueryParameters);

    if (simpleResponseModel != null && simpleResponseModel.status == 1) {
      CommonWidgets.showMyToastMessage('Successfully order delivered ....');
      Get.back();
    } else {
      CommonWidgets.showMyToastMessage(simpleResponseModel!.messages ?? '');
    }
  }

  clickOnOngoing(int index) {
    showModalBottomSheet(
      context: Get.context!,
      isScrollControlled: true,
      builder: (context) => Container(
        height: MediaQuery.of(Get.context!).size.height - 150.px,
        padding: EdgeInsets.symmetric(horizontal: 16.px),
        child: Column(
          children: [
            SizedBox(height: 20.px),
            Text(
              StringConstants.orderDetails,
              style: Theme.of(context).textTheme.displayMedium?.copyWith(
                    fontSize: 18.px,
                  ),
            ),
            Expanded(
              child: ListView(
                children: [
                  Column(
                    children: [
                      SizedBox(height: 20.px),
                      ListTile(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.px)),
                        leading: CommonWidgets.imageView(
                          image: pendingDeliveryList[index].image ?? '',
                          height: 50.px,
                          width: 50.px,
                          fit: BoxFit.fill,
                          radius: 0.px,
                        ),
                        title: Text(
                          'Item',
                          maxLines: 1,
                          style: Theme.of(Get.context!)
                              .textTheme
                              .displayMedium
                              ?.copyWith(
                                fontSize: 12.px,
                              ),
                        ),
                        subtitle: Text(
                          pendingDeliveryList[index].productName ?? '',
                          maxLines: 3,
                          style: Theme.of(Get.context!)
                              .textTheme
                              .titleMedium
                              ?.copyWith(
                                fontSize: 12.px,
                              ),
                        ),
                      ),
                      SizedBox(height: 10.px),
                      Divider(
                        height: 2.px,
                        color: Theme.of(Get.context!).colorScheme.onSecondary,
                        thickness: .2.px,
                      ),
                    ],
                  ),
                  listTile(
                      assetName: IconConstants.icTotal,
                      title: 'Total',
                      subtitle: '${pendingDeliveryList[index].amount} €'),
                  listTile(
                      assetName: IconConstants.icUserImage,
                      title: 'Sold by:',
                      subtitle: '${pendingDeliveryList[index].userName}'),
                  listTile(
                      assetName: IconConstants.icAddressPin,
                      title: 'Shipping address:',
                      subtitle: '${pendingDeliveryList[index].location}'),
                  listTile(
                      assetName: IconConstants.icBankCard,
                      title: 'Payment method: ',
                      subtitle: '${pendingDeliveryList[index].paymentType}'),
                  SizedBox(height: 20.px),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  listTile({String title = '', String assetName = '', String subtitle = ''}) {
    return Column(
      children: [
        SizedBox(height: 20.px),
        ListTile(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.px)),
          leading: CommonWidgets.appIcons(
            assetName: assetName,
            height: 44.px,
            width: 44.px,
            fit: BoxFit.contain,
            borderRadius: 0.px,
          ),
          title: Text(
            title,
            maxLines: 2,
            style: Theme.of(Get.context!).textTheme.displayMedium?.copyWith(
                  fontSize: 12.px,
                ),
          ),
          subtitle: Text(
            subtitle,
            maxLines: 3,
            style: Theme.of(Get.context!).textTheme.titleMedium?.copyWith(
                  fontSize: 12.px,
                ),
          ),
        ),
        SizedBox(height: 10.px),
        Divider(
          height: 2.px,
          color: Theme.of(Get.context!).colorScheme.onSecondary,
          thickness: .2.px,
        ),
      ],
    );
  }

  Future<void> getCompleteDeliveryApi() async {
    Map<String, dynamic> getQueryParameters = {
      ApiKeyConstants.userId: userId,
      ApiKeyConstants.status: 'Complete'
    };
    getProductDeliveryModel = await ApiMethods.getProductDelivery(
        queryParameters: getQueryParameters);

    if (getProductDeliveryModel != null &&
        getProductDeliveryModel!.data!.isNotEmpty) {
      completeDeliveryList = getProductDeliveryModel!.data!;
    } else {
      print("Failed.....");
    }
  }

  Future<void> getPendingDeliveryApi() async {
    Map<String, dynamic> getQueryParameters = {
      ApiKeyConstants.userId: userId,
      ApiKeyConstants.status: 'Pending'
    };
    getProductDeliveryModel = await ApiMethods.getProductDelivery(
        queryParameters: getQueryParameters);

    if (getProductDeliveryModel != null &&
        getProductDeliveryModel!.data!.isNotEmpty) {
      pendingDeliveryList = getProductDeliveryModel!.data!;
    } else {
      print("Failed.....");
    }
  }
}
