import 'package:carousel_slider/carousel_slider.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../../common/common_widgets.dart';
import '../../../../common/progress_bar.dart';
import '../../../data/constants/icons_constant.dart';
import '../../../data/constants/string_constants.dart';
import '../controllers/edit_real_estate_controller.dart';

class EditRealEstateView extends GetView<EditRealEstateController> {
  const EditRealEstateView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Obx(() {
      controller.count.value;
      return Scaffold(
        body: ProgressBar(
          inAsyncCall: controller.inAsyncCall.value,
          child: ListView(
            children: [
              if (controller.getProductDetailsModel.data!.productImage !=
                      null &&
                  controller
                      .getProductDetailsModel.data!.productImage!.isNotEmpty)
                Container(
                  color: Theme.of(context).primaryColor.withOpacity(.1.px),
                  child: Stack(
                    children: [
                      Stack(
                        alignment: Alignment.bottomRight,
                        children: [
                          CarouselSlider(
                            items: List.generate(
                              controller.getProductDetailsModel.data!
                                  .productImage!.length,
                              (index) => Container(
                                // height: 200.px,
                                // width: 200.px,
                                height: 250.px,
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    width: .4.px,
                                    color: Theme.of(Get.context!)
                                        .scaffoldBackgroundColor
                                        .withOpacity(0.2),
                                  ),
                                ),
                                child: CommonWidgets.imageView(
                                  image: controller.getProductDetailsModel.data!
                                          .productImage![index].image ??
                                      '',
                                ),
                              ),
                            ),
                            options: CarouselOptions(
                              height: 250.px,
                              onPageChanged: (index, reason) {
                                controller.cardIndex.value = index;
                              },
                              initialPage: 0,
                              enableInfiniteScroll: true,
                              reverse: false,
                              autoPlay: true,
                              enlargeStrategy: CenterPageEnlargeStrategy.zoom,
                              autoPlayInterval: const Duration(seconds: 3),
                              autoPlayAnimationDuration:
                                  const Duration(milliseconds: 1200),
                              autoPlayCurve: Curves.easeOutSine,
                              scrollDirection: Axis.horizontal,
                              enlargeCenterPage: true,
                              viewportFraction: 1,
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.symmetric(
                              vertical: 20.px,
                              horizontal: 16.px,
                            ),
                            padding: EdgeInsets.all(4.px),
                            decoration: BoxDecoration(
                              color: Theme.of(context)
                                  .scaffoldBackgroundColor
                                  .withOpacity(.6.px),
                              borderRadius: BorderRadius.circular(12.px),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Obx(
                                  () => Wrap(
                                    children: List.generate(
                                      controller.getProductDetailsModel.data!
                                          .productImage!.length,
                                      (index) => Padding(
                                        padding: EdgeInsets.all(2.px),
                                        child: Center(
                                          child: Container(
                                            width: 6.px,
                                            height: 6.px,
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(4.px),
                                              color:
                                                  controller.cardIndex.value ==
                                                          index
                                                      ? Theme.of(context)
                                                          .primaryColor
                                                      : Theme.of(context)
                                                          .colorScheme
                                                          .onSecondaryContainer,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                            left: 20.px, top: 20.px, right: 10.px),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            GestureDetector(
                              onTap: () {
                                Get.back();
                              },
                              child: CommonWidgets.appIcons(
                                  assetName: IconConstants.icBack,
                                  height: 32.px,
                                  width: 32.px,
                                  borderRadius: 0.px),
                            ),
                            const Spacer(),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.px),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      StringConstants.adDetails.tr,
                      style: Theme.of(context)
                          .textTheme
                          .displayMedium
                          ?.copyWith(
                              fontSize: 18.px,
                              color: Theme.of(context).primaryColor),
                    ),
                    SizedBox(height: 20.px),
                    textFormField(
                        hintText: StringConstants.title.tr,
                        controller: controller.titleController),
                    SizedBox(height: 10.px),
                    dropDown(
                      hintText: controller.bedRoom.value,
                      onChanged: (value) =>
                          controller.onChangedBedRoomField(value: value),
                      items: List.generate(controller.bedRoomList.length,
                          (index) => controller.bedRoomList[index]),
                    ),
                    SizedBox(height: 10.px),
                    dropDown(
                      hintText: controller.bathRoom.value,
                      onChanged: (value) =>
                          controller.onChangedBathRoomField(value: value),
                      items: List.generate(controller.bathRoomList.length,
                          (index) => controller.bathRoomList[index]),
                    ),
                    SizedBox(
                      height: 10.px,
                    ),
                    dropDown(
                      hintText: controller.parking.value,
                      onChanged: (value) =>
                          controller.onChangedPackingField(value: value),
                      items: List.generate(controller.parkingList.length,
                          (index) => controller.parkingList[index]),
                    ),
                    SizedBox(height: 10.px),
                    textFormField(
                      hintText: StringConstants.size.tr,
                      controller: controller.sizeController,
                    ),
                    SizedBox(height: 10.px),
                    textFormField(
                      hintText: StringConstants.storage.tr,
                      controller: controller.storageController,
                    ),
                    SizedBox(
                      height: 10.px,
                    ),
                    textFormField(
                      hintText: StringConstants.terrace.tr,
                      controller: controller.terraceController,
                    ),
                    SizedBox(height: 10.px),
                    textFormField(
                      hintText: StringConstants.productsStatus.tr,
                      readOnly: true,
                      showSuffix: true,
                      controller: controller.productConditionController,
                      onTap: () => controller.clickOnProductsStatus(),
                    ),
                    SizedBox(height: 10.px),
                    textFormField(
                        hintText: StringConstants.description.tr,
                        controller: controller.descriptionController,
                        maxLines: 4),
                    SizedBox(height: 10.px),
                    textFormField(
                        hintText: StringConstants.whatsAppOptional.tr,
                        controller: controller.whatsAppCodeController),
                    SizedBox(height: 10.px),
                    textFormField(
                        hintText: StringConstants.telPhoneOptional.tr,
                        controller: controller.telPhoneCodeController),
                    SizedBox(height: 5.px),
                    Row(
                      children: [
                        CupertinoCheckbox(
                            value: controller.publicPhoneValue.value,
                            side: BorderSide(color: Colors.teal, width: 1.px),
                            onChanged: (value) {
                              print('Press...${value.toString()}');
                              controller.publicPhoneValue.value = value!;
                              controller.increment();
                            }),
                        Text(
                          StringConstants.makeMyPhonePublicInTheAd.tr,
                          style: Theme.of(context)
                              .textTheme
                              .titleSmall
                              ?.copyWith(
                                  fontSize: 12.px, color: Colors.black54),
                        ),
                      ],
                    ),
                    SizedBox(height: 10.px),
                    textFormField(
                        hintText: StringConstants.productIsOtherLocation.tr,
                        controller: controller.productLocationController,
                        showSuffix: true,
                        readOnly: true,
                        onTap: () {
                          controller.setLocation();
                        }),
                    SizedBox(height: 2.px),
                    Text(
                      StringConstants
                          .toPreserveYourPrivacyYourExactLocationWillNeverBePublic
                          .tr,
                      style: Theme.of(context)
                          .textTheme
                          .titleSmall
                          ?.copyWith(fontSize: 12.px, color: Colors.black38),
                    ),
                    SizedBox(height: 15.px),
                    Row(
                      children: [
                        Expanded(
                          child: textFormField(
                              hintText: StringConstants.price.tr,
                              controller: controller.priceController,
                              currencySymbol: controller.currencySymbol.value,
                              showPrefix: true),
                        ),
                        SizedBox(width: 10.px),
                        if (controller.currencyData.isNotEmpty)
                          Expanded(
                            child: dropDown(
                              hintText: controller.currencyName.value,
                              onChanged: (value) =>
                                  controller.onChangedCurrencyField(
                                      value: value, nameType: true),
                              items: List.generate(
                                  controller.currencyData.length,
                                  (index) => controller
                                      .currencyData[index].currencyName
                                      .toString()),
                            ),
                          ),
                      ],
                    ),
                    SizedBox(height: 20.px),
                    CommonWidgets.commonElevatedButton(
                      onPressed: () => controller.clickOnPostAddButton(),
                      childText: Text(
                        StringConstants.edit.tr,
                        style: Theme.of(context)
                            .textTheme
                            .headlineSmall
                            ?.copyWith(fontWeight: FontWeight.w700),
                      ),
                    ),
                    SizedBox(height: 10.px),
                  ],
                ),
              ),
            ],
          ),
        ),
      );
    });
  }

  textFormField({
    required String hintText,
    required TextEditingController controller,
    int? maxLines,
    bool? readOnly,
    TextInputType? textInputType,
    bool showSuffix = false,
    bool showPrefix = false,
    String? currencySymbol,
    GestureTapCallback? onTap,
    ValueChanged<String>? onChanged,
  }) {
    return TextField(
      maxLines: maxLines ?? 1,
      onTap: onTap,
      onChanged: onChanged,
      readOnly: readOnly ?? false,
      controller: controller,
      keyboardType: textInputType,
      style: Theme.of(Get.context!)
          .textTheme
          .headlineMedium
          ?.copyWith(fontSize: 14.px),
      decoration: InputDecoration(
        disabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
              color: Theme.of(Get.context!).colorScheme.onSurface, width: 2.px),
          borderRadius: BorderRadius.circular(14.px),
        ),
        border: OutlineInputBorder(
            borderSide: BorderSide(
                color: Theme.of(Get.context!).primaryColor, width: 2.px),
            borderRadius: BorderRadius.circular(14.px)),
        enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
                color: Theme.of(Get.context!).colorScheme.onSecondaryContainer,
                width: 2.px),
            borderRadius: BorderRadius.circular(14.px)),
        errorBorder: OutlineInputBorder(
            borderSide: BorderSide(
                color: Theme.of(Get.context!).colorScheme.onError, width: 2.px),
            borderRadius: BorderRadius.circular(14.px)),
        hintText: hintText,
        labelText: hintText,
        hintStyle: Theme.of(Get.context!).textTheme.titleMedium,
        labelStyle: Theme.of(Get.context!).textTheme.titleMedium,
        suffixIcon: showSuffix
            ? Icon(
                Icons.arrow_forward_ios,
                size: 15,
                color: Theme.of(Get.context!).primaryColor,
              )
            : null,
        prefixIconConstraints:
            BoxConstraints(maxWidth: 25.px, maxHeight: 25.px),
        prefixIcon: showPrefix
            ? Padding(
                padding: EdgeInsets.only(left: 7.px, top: 0.px, right: 3.px),
                child: Text(
                  currencySymbol ?? '\$',
                  style: Theme.of(Get.context!).textTheme.titleMedium,
                ),
              )
            : null,
      ),
    );
  }

  dropDown(
      {required String hintText,
      required List<String> items,
      ValueChanged? onChanged}) {
    return DropdownSearch<String>(
      dropdownButtonProps: DropdownButtonProps(
        color: Theme.of(Get.context!).primaryColor,
        icon: Icon(
          Icons.keyboard_arrow_down_rounded,
          size: 24.px,
        ),
      ),
      popupProps: PopupProps.menu(
        showSelectedItems: true,
        showSearchBox: true,
        menuProps: MenuProps(borderRadius: BorderRadius.circular(20.px)),
        searchFieldProps: TextFieldProps(
          decoration: InputDecoration(
            disabledBorder: OutlineInputBorder(
              borderSide: BorderSide(
                  color: Theme.of(Get.context!).colorScheme.onSurface,
                  width: 2.px),
              borderRadius: BorderRadius.circular(14.px),
            ),
            border: OutlineInputBorder(
                borderSide: BorderSide(
                    color: Theme.of(Get.context!).primaryColor, width: 2.px),
                borderRadius: BorderRadius.circular(14.px)),
            enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(
                    color:
                        Theme.of(Get.context!).colorScheme.onSecondaryContainer,
                    width: 2.px),
                borderRadius: BorderRadius.circular(14.px)),
            errorBorder: OutlineInputBorder(
                borderSide: BorderSide(
                    color: Theme.of(Get.context!).colorScheme.onError,
                    width: 2.px),
                borderRadius: BorderRadius.circular(14.px)),
            hintText: StringConstants.search.tr,
            labelText: StringConstants.search.tr,
            hintStyle: Theme.of(Get.context!).textTheme.titleMedium,
            labelStyle: Theme.of(Get.context!).textTheme.titleMedium,
          ),
        ),
        itemBuilder: (context, item, isSelected) {
          return ListTile(
            title: Text(
              item,
              style: Theme.of(Get.context!).textTheme.displayMedium?.copyWith(
                  fontSize: 14.px,
                  color:
                      isSelected ? Theme.of(Get.context!).primaryColor : null),
            ),
          );
        },
        title: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.px, vertical: 20.px),
          child: Text(
            hintText,
            style: Theme.of(Get.context!).textTheme.displayMedium?.copyWith(
                fontSize: 18.px, color: Theme.of(Get.context!).primaryColor),
          ),
        ),
        // disabledItemFn: (String s) => s.startsWith('I'),
      ),
      items: items,
      dropdownDecoratorProps: DropDownDecoratorProps(
        baseStyle: Theme.of(Get.context!)
            .textTheme
            .headlineMedium
            ?.copyWith(fontSize: 14.px),
        dropdownSearchDecoration: InputDecoration(
          disabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
                color: Theme.of(Get.context!).colorScheme.onSurface,
                width: 2.px),
            borderRadius: BorderRadius.circular(14.px),
          ),
          border: OutlineInputBorder(
              borderSide: BorderSide(
                  color: Theme.of(Get.context!).primaryColor, width: 2.px),
              borderRadius: BorderRadius.circular(14.px)),
          enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(
                  color:
                      Theme.of(Get.context!).colorScheme.onSecondaryContainer,
                  width: 2.px),
              borderRadius: BorderRadius.circular(14.px)),
          errorBorder: OutlineInputBorder(
              borderSide: BorderSide(
                  color: Theme.of(Get.context!).colorScheme.onError,
                  width: 2.px),
              borderRadius: BorderRadius.circular(14.px)),
          hintText: hintText,
          labelText: hintText,
          hintStyle: Theme.of(Get.context!).textTheme.titleMedium,
          labelStyle: Theme.of(Get.context!)
              .textTheme
              .titleMedium
              ?.copyWith(color: Colors.black87),
        ),
      ),
      onChanged: onChanged,
    );
  }
}
