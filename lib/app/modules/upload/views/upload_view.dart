import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:rot_application/common/progress_bar.dart';

import '../../../../common/common_widgets.dart';
import '../../../data/constants/icons_constant.dart';
import '../../../data/constants/string_constants.dart';
import '../controllers/upload_controller.dart';

class UploadView extends GetView<UploadController> {
  const UploadView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      controller.count.value;
      return Scaffold(
        body: ProgressBar(
          inAsyncCall: controller.inAsyncCall.value,
          child: ListView(
            children: [
              SizedBox(height: 20.px),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.px),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      StringConstants.upload.tr,
                      style: Theme.of(context)
                          .textTheme
                          .displayMedium
                          ?.copyWith(
                              fontSize: 24.px,
                              color: Theme.of(context).primaryColor),
                    ),
                    /*  SizedBox(height: 30.px),
                    CommonWidgets.commonTextField(
                      hintText: StringConstants.search.tr,
                      borderRadius: 24.px,
                      prefixIcon: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          CommonWidgets.appIcons(
                            assetName: IconConstants.icSearch,
                            height: 20.px,
                            width: 20.px,
                          ),
                        ],
                      ),
                    ),*/
                    SizedBox(height: 20.px),
                    SingleChildScrollView(
                      child: Wrap(
                        children: List.generate(10, (index) {
                          return SizedBox(
                            width: MediaQuery.of(context).size.width / 5.5,
                            child: InkWell(
                              onTap: () => controller.clickOnCard(index: index),
                              borderRadius: BorderRadius.circular(8.px),
                              child: Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 2.px, vertical: 4.px),
                                child: Center(
                                  child: CommonWidgets.appIcons(
                                    height: 60.px,
                                    width: 60.px,
                                    assetName: IconConstants.icAddDotted,
                                  ),
                                ),
                              ),
                            ),
                          );
                        }),
                      ),
                    ),
                    SizedBox(height: 20.px),
                    textFormField(hintText: StringConstants.title.tr),
                    SizedBox(height: 10.px),
                    textFormField(
                        hintText: StringConstants.description.tr, maxLines: 4),
                    SizedBox(height: 10.px),
                    if (controller.data.isNotEmpty)
                      dropDown(
                        hintText: StringConstants.category.tr,
                        onChanged: (value) =>
                            controller.onChangedCategoryField(value: value),
                        items: List.generate(
                            controller.data.length,
                            (index) =>
                                controller.data[index].categoryName.toString()),
                      ),
                    if (controller.data.isNotEmpty) SizedBox(height: 10.px),
                    if (controller.getSubCategoryData.isNotEmpty)
                      dropDown(
                        hintText: StringConstants.subCategory.tr,
                        onChanged: (value) =>
                            controller.onChangedCategoryField(value: value),
                        items: List.generate(
                            controller.getSubCategoryData.length,
                            (index) => controller
                                .getSubCategoryData[index].subCatName
                                .toString()),
                      ),
                    if (controller.getSubCategoryData.isNotEmpty)
                      SizedBox(height: 10.px),
                    textFormField(hintText: StringConstants.productLocation.tr),
                    SizedBox(height: 10.px),
                    if (controller.countryData.isNotEmpty)
                      dropDown(
                        hintText: StringConstants.country.tr,
                        onChanged: (value) =>
                            controller.onChangedCountryField(value: value),
                        items: List.generate(
                            controller.countryData.length,
                            (index) =>
                                controller.countryData[index].name.toString()),
                      ),
                    if (controller.countryData.isNotEmpty)
                      SizedBox(height: 10.px),
                    if (controller.stateData.isNotEmpty)
                      dropDown(
                        hintText: StringConstants.state.tr,
                        onChanged: (value) =>
                            controller.onChangedStateField(value: value),
                        items: List.generate(
                            controller.stateData.length,
                            (index) =>
                                controller.stateData[index].name.toString()),
                      ),
                    if (controller.stateData.isNotEmpty)
                      SizedBox(height: 10.px),
                    if (controller.cityData.isNotEmpty)
                      dropDown(
                        hintText: StringConstants.city.tr,
                        onChanged: (value) =>
                            controller.onChangedCityField(value: value),
                        items: List.generate(
                            controller.cityData.length,
                            (index) =>
                                controller.cityData[index].name.toString()),
                      ),
                    if (controller.cityData.isNotEmpty) SizedBox(height: 10.px),
                    textFormField(hintText: StringConstants.zipCode.tr),
                    SizedBox(height: 10.px),
                    textFormField(
                      hintText: StringConstants.productsStatus.tr,
                      readOnly: true,
                      onTap: () => controller.clickOnProductsStatus(),
                    ),
                    SizedBox(height: 10.px),
                    textFormField(
                      hintText: StringConstants.hashtag.tr,
                      readOnly: true,
                      onTap: () => controller.clickOnHashtag(),
                    ),
                    SizedBox(height: 10.px),
                    Row(
                      children: [
                        Expanded(
                          child:
                              textFormField(hintText: StringConstants.price.tr),
                        ),
                        SizedBox(width: 10.px),
                        if (controller.currencyData.isNotEmpty)
                          Expanded(
                            child: dropDown(
                              hintText: StringConstants.currency.tr,
                              onChanged: (value) => controller
                                  .onChangedCurrencyField(value: value),
                              items: List.generate(
                                  controller.currencyData.length,
                                  (index) => controller
                                      .currencyData[index].currencySymbols
                                      .toString()),
                            ),
                          ),
                      ],
                    ),
                    SizedBox(height: 20.px),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          StringConstants.enableShipping.tr,
                          style: Theme.of(context)
                              .textTheme
                              .headlineSmall
                              ?.copyWith(color: Theme.of(context).primaryColor),
                        ),
                        CupertinoSwitch(
                          value: controller.switchValue.value,
                          activeColor: Theme.of(context).primaryColor,
                          onChanged: (bool? value) {
                            controller.switchValue.value = value ?? false;
                          },
                        ),
                      ],
                    ),
                    SizedBox(height: 20.px),
                    ListView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) {
                        return Obx(() {
                          controller.count.value;
                          return Padding(
                            padding: EdgeInsets.symmetric(vertical: 4.px),
                            child: Theme(
                              data: ThemeData(
                                unselectedWidgetColor: Theme.of(Get.context!)
                                    .primaryColor, // Set the inactive color here
                              ),
                              child: RadioListTile(
                                controlAffinity:
                                    ListTileControlAffinity.trailing,
                                shape: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(16.px),
                                  borderSide: BorderSide(
                                    color: Theme.of(Get.context!)
                                        .colorScheme
                                        .surface,
                                    width: .4.px,
                                  ),
                                ),
                                activeColor: Theme.of(context).primaryColor,
                                onChanged: (value) {
                                  controller.selectedValue.value =
                                      controller.list[index];
                                },
                                title: Text(
                                  controller.list[index],
                                  style: Theme.of(Get.context!)
                                      .textTheme
                                      .displayMedium
                                      ?.copyWith(
                                          fontSize: 14.px,
                                          color: Theme.of(Get.context!)
                                              .primaryColor),
                                ),
                                value: controller.selectedValue.value,
                                groupValue: controller.list[index],
                              ),
                            ),
                          );
                        });
                      },
                      itemCount: controller.list.length,
                    ),
                    SizedBox(height: 10.px),
                    CommonWidgets.commonElevatedButton(
                      onPressed: () => controller.clickOnPostAddButton(),
                      childText: Text(
                        StringConstants.postAdd.tr,
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

  textFormField(
      {required String hintText,
      int? maxLines,
      bool? readOnly,
      GestureTapCallback? onTap}) {
    return TextField(
      maxLines: maxLines ?? 1,
      onTap: onTap,
      readOnly: readOnly ?? false,
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
          labelStyle: Theme.of(Get.context!).textTheme.titleMedium,
        ),
      ),
      onChanged: onChanged,
    );
  }
}
