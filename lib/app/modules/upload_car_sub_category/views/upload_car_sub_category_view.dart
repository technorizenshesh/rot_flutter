import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:rot_application/app/data/apis/api_constants/api_key_constants.dart';

import '../../../../common/common_widgets.dart';
import '../../../../common/progress_bar.dart';
import '../../../data/constants/icons_constant.dart';
import '../../../data/constants/string_constants.dart';
import '../controllers/upload_car_sub_category_controller.dart';

class UploadCarSubCategoryView extends GetView<UploadCarSubCategoryController> {
  const UploadCarSubCategoryView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Obx(() {
      controller.count.value;
      return Scaffold(
        appBar: CommonWidgets.appBar(title: controller.title),
        body: ProgressBar(
          inAsyncCall: controller.inAsyncCall.value,
          child: ListView(
            children: [
              SizedBox(height: 10.px),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.px),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      StringConstants.photos.tr,
                      style: Theme.of(context)
                          .textTheme
                          .displayMedium
                          ?.copyWith(
                              fontSize: 20.px,
                              color: Theme.of(context).primaryColor),
                    ),
                    SizedBox(height: 10.px),
                    SingleChildScrollView(
                      child: Wrap(
                        children: List.generate(4, (index) {
                          return SizedBox(
                            width: MediaQuery.of(context).size.width / 4.5,
                            child: InkWell(
                              onTap: () => controller.clickOnCard(index: index),
                              borderRadius: BorderRadius.circular(8.px),
                              child: Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 2.px, vertical: 4.px),
                                child: controller.imageList[index] != null
                                    ? Container(
                                        height: 75.px,
                                        width: 75.px,
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(15.px)),
                                        clipBehavior: Clip.hardEdge,
                                        child: Image.file(
                                            controller.imageList[index]!,
                                            fit: BoxFit.fill),
                                      )
                                    : Center(
                                        child: CommonWidgets.appIcons(
                                          height: 75.px,
                                          width: 75.px,
                                          assetName: IconConstants.icAddDotted,
                                        ),
                                      ),
                              ),
                            ),
                          );
                        }),
                      ),
                    ),
                    SizedBox(height: 10.px),
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
                    if (controller.brandData.isNotEmpty)
                      dropDown(
                        hintText: StringConstants.brand.tr,
                        onChanged: (value) =>
                            controller.onChangedBrandField(value: value),
                        items: List.generate(
                            controller.brandData.length,
                            (index) => controller.brandData[index].brandName
                                .toString()),
                      ),
                    if (controller.getBrandModelData.isNotEmpty)
                      SizedBox(height: 10.px),
                    if (controller.getBrandModelData.isNotEmpty)
                      dropDown(
                        hintText: StringConstants.model.tr,
                        onChanged: (value) =>
                            controller.onChangedBrandModeField(value: value),
                        items: List.generate(
                            controller.getBrandModelData.length,
                            (index) => controller
                                .getBrandModelData[index].modelName
                                .toString()),
                      ),
                    if (controller.engineTypeData.isNotEmpty)
                      SizedBox(height: 10.px),
                    if (controller.parameters[ApiKeyConstants.categoryId] ==
                            '1' ||
                        controller.parameters[ApiKeyConstants.categoryId] ==
                            '2')
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          if (controller.engineTypeData.isNotEmpty)
                            dropDown(
                              hintText: StringConstants.typeOfEngines.tr,
                              onChanged: (value) => controller
                                  .onChangedEngineTypeField(value: value),
                              items: List.generate(
                                  controller.engineTypeData.length,
                                  (index) => controller
                                      .engineTypeData[index].name
                                      .toString()),
                            ),
                          if (controller.engineTypeData.isNotEmpty)
                            SizedBox(
                              height: 10.px,
                            ),
                          dropDown(
                            hintText: StringConstants.registrationYear.tr,
                            onChanged: (value) => controller
                                .onChangedRegistrationYearField(value: value),
                            items: List.generate(
                                controller.registrationYearList.length,
                                (index) =>
                                    controller.registrationYearList[index]),
                          ),
                          SizedBox(height: 10.px),
                          textFormField(
                            hintText: StringConstants.motor.tr,
                            controller: controller.motorController,
                          ),
                          SizedBox(height: 10.px),
                          textFormField(
                            hintText: StringConstants.kilometers.tr,
                            controller: controller.kiloMetersController,
                          ),
                          if (controller.transmissionData.isNotEmpty)
                            SizedBox(
                              height: 10.px,
                            ),
                          if (controller.transmissionData.isNotEmpty)
                            dropDown(
                              hintText: StringConstants.transmission.tr,
                              onChanged: (value) => controller
                                  .onChangedTransmissionField(value: value),
                              items: List.generate(
                                  controller.transmissionData.length,
                                  (index) =>
                                      controller.transmissionData[index].name ??
                                      ''),
                            ),
                        ],
                      ),
                    SizedBox(
                      height: 10.px,
                    ),
                    dropDown(
                      hintText: StringConstants.colorExterior.tr,
                      onChanged: (value) =>
                          controller.onChangedColorField(value: value),
                      items: List.generate(controller.colorsList.length,
                          (index) => controller.colorsList[index]),
                    ),
                    SizedBox(height: 10.px),
                    textFormField(
                      hintText: StringConstants.productsStatus.tr,
                      readOnly: true,
                      showSuffix: true,
                      controller: controller.productConditionController,
                      onTap: () => controller.clickOnProductsStatus(),
                    ),
                    if (controller.parameters[ApiKeyConstants.categoryId] !=
                            '11' &&
                        controller.parameters[ApiKeyConstants.categoryId] !=
                            '1' &&
                        controller.parameters[ApiKeyConstants.categoryId] !=
                            '2')
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          SizedBox(height: 10.px),
                          textFormField(
                              hintText: StringConstants.partNumber.tr,
                              controller: controller.partNumberController),
                        ],
                      ),
                    SizedBox(height: 10.px),
                    textFormField(
                        hintText: StringConstants.description.tr,
                        controller: controller.descriptionController,
                        maxLines: 4),
                    if (controller.parameters[ApiKeyConstants.categoryId] !=
                            '1' &&
                        controller.parameters[ApiKeyConstants.categoryId] !=
                            '2')
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          SizedBox(height: 10.px),
                          Row(
                            children: [
                              Expanded(
                                child: textFormField(
                                    hintText: StringConstants.length.tr,
                                    textInputType: TextInputType.number,
                                    controller: controller.lengthController),
                              ),
                              SizedBox(width: 10.px),
                              Expanded(
                                child: dropDown(
                                  hintText: StringConstants.dimension.tr,
                                  onChanged: (value) =>
                                      controller.onChangeDimensions(0, value),
                                  items: List.generate(
                                      controller.volumeDimensionList.length,
                                      (index) => controller
                                          .volumeDimensionList[index]),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 10.px),
                          Row(
                            children: [
                              Expanded(
                                child: textFormField(
                                    hintText: StringConstants.width.tr,
                                    textInputType: TextInputType.number,
                                    controller: controller.widthController),
                              ),
                              SizedBox(width: 10.px),
                              Expanded(
                                child: dropDown(
                                  hintText: StringConstants.dimension.tr,
                                  onChanged: (value) =>
                                      controller.onChangeDimensions(1, value),
                                  items: List.generate(
                                      controller.volumeDimensionList.length,
                                      (index) => controller
                                          .volumeDimensionList[index]),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 10.px),
                          Row(
                            children: [
                              Expanded(
                                child: textFormField(
                                    hintText: StringConstants.height.tr,
                                    textInputType: TextInputType.number,
                                    controller: controller.heightController),
                              ),
                              SizedBox(width: 10.px),
                              Expanded(
                                child: dropDown(
                                  hintText: StringConstants.dimension.tr,
                                  onChanged: (value) =>
                                      controller.onChangeDimensions(2, value),
                                  items: List.generate(
                                      controller.volumeDimensionList.length,
                                      (index) => controller
                                          .volumeDimensionList[index]),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 10.px),
                          Row(
                            children: [
                              Expanded(
                                child: textFormField(
                                    hintText: StringConstants.weight.tr,
                                    textInputType: TextInputType.number,
                                    controller: controller.weightController),
                              ),
                              SizedBox(width: 10.px),
                              Expanded(
                                child: dropDown(
                                  hintText: StringConstants.dimension.tr,
                                  onChanged: (value) =>
                                      controller.onChangeDimensions(3, value),
                                  items: List.generate(
                                      controller.weightDimensionList.length,
                                      (index) => controller
                                          .weightDimensionList[index]),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
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
                    Text(
                      StringConstants.adLocation.tr,
                      style: Theme.of(context)
                          .textTheme
                          .displayMedium
                          ?.copyWith(fontSize: 18.px, color: Colors.black87),
                    ),
                    SizedBox(height: 5.px),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          StringConstants.enableMyDefaultLocation.tr,
                          style: Theme.of(context)
                              .textTheme
                              .headlineSmall
                              ?.copyWith(color: Theme.of(context).primaryColor),
                        ),
                        CupertinoSwitch(
                          value: controller.switchValue.value,
                          activeColor: Theme.of(context).primaryColor,
                          onChanged: (bool? value) {
                            controller.checkLocation(value!);
                          },
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
                              hintText: StringConstants.currency.tr,
                              onChanged: (value) => controller
                                  .onChangedCurrencyField(value: value),
                              items: List.generate(
                                  controller.currencyData.length,
                                  (index) => controller
                                      .currencyData[index].currencyName
                                      .toString()),
                            ),
                          ),
                      ],
                    ),
                    if (controller.parameters[ApiKeyConstants.categoryId] !=
                            '1' &&
                        controller.parameters[ApiKeyConstants.categoryId] !=
                            '2')
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          SizedBox(height: 10.px),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                StringConstants.enableShipping.tr,
                                style: Theme.of(context)
                                    .textTheme
                                    .headlineSmall
                                    ?.copyWith(
                                        color: Theme.of(context).primaryColor),
                              ),
                              CupertinoSwitch(
                                value: controller.enableShipping.value,
                                activeColor: Theme.of(context).primaryColor,
                                onChanged: (bool? value) {
                                  controller.enableShipping.value = value!;
                                },
                              ),
                            ],
                          ),
                        ],
                      ),
                    SizedBox(height: 20.px),
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
          labelStyle: Theme.of(Get.context!).textTheme.titleMedium,
        ),
      ),
      onChanged: onChanged,
    );
  }
}
