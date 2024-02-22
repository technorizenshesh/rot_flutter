import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../app/data/constants/icons_constant.dart';

class CommonWidgets {
  static appBar({String? title, bool wantBackButton = true}) {
    return AppBar(
      elevation: 0,
      shadowColor: Theme.of(Get.context!).scaffoldBackgroundColor,
      surfaceTintColor: Theme.of(Get.context!).scaffoldBackgroundColor,
      foregroundColor: Theme.of(Get.context!).scaffoldBackgroundColor,
      backgroundColor: Theme.of(Get.context!).scaffoldBackgroundColor,
      leading: wantBackButton
          ? GestureDetector(
              onTap: () {
                Get.back();
              },
              child: Center(
                child: appIcons(
                  assetName: IconConstants.icBack,
                  height: 32.px,
                  width: 32.px,
                ),
              ),
            )
          : null,
      centerTitle: true,
      title: Text(
        title ?? '',
        style: Theme.of(Get.context!)
            .textTheme
            .displayMedium
            ?.copyWith(fontSize: 20.px),
      ),
    );
  }

  static Widget appBarView({String? title}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        GestureDetector(
          onTap: () {
            Get.back();
          },
          child: Image.asset(
            IconConstants.icBack,
            height: 30.px,
            width: 30.px,
          ),
        ),
        Text(
          title ?? '',
          style: Theme.of(Get.context!)
              .textTheme
              .displayMedium
              ?.copyWith(fontSize: 20.px),
        ),
        const SizedBox(),
      ],
    );
  }

  ///For Full Size Use In Column Not In ROW
  static Widget commonElevatedButton({
    double? height,
    double? width,
    EdgeInsetsGeometry? buttonMargin,
    EdgeInsetsGeometry? contentPadding,
    double? borderRadius,
    Color? splashColor,
    bool wantContentSizeButton = false,
    Color? buttonColor,
    TextStyle? textStyle,
    double? elevation,
    required VoidCallback onPressed,
    Widget? child,
    Widget? childText,
    Decoration? decoration,
    BoxBorder? border,
  }) {
    return Container(
      height: wantContentSizeButton ? height : 60.px,
      width: wantContentSizeButton ? width : double.infinity,
      margin: buttonMargin,
      decoration: decoration ??
          BoxDecoration(
            borderRadius: BorderRadius.circular(borderRadius ?? 14.px),
            border: border ??
                Border.all(
                  color:
                      Theme.of(Get.context!).colorScheme.onSecondaryContainer,
                  width: 1.px,
                ),
          ),
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          elevation: elevation ?? 0.px,
          padding: contentPadding,
          textStyle: textStyle ??
              Theme.of(Get.context!)
                  .textTheme
                  .displayMedium
                  ?.copyWith(fontWeight: FontWeight.w700),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(borderRadius ?? 14.px),
          ),
          backgroundColor:
              buttonColor ?? Theme.of(Get.context!).colorScheme.primary,
          foregroundColor:
              splashColor ?? Theme.of(Get.context!).scaffoldBackgroundColor,
          shadowColor: Colors.transparent,
        ),
        child: childText ??
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                child ?? const Text(''),
                appIcons(
                  width: 24.px,
                  height: 24.px,
                  assetName: IconConstants.icRightArrowRoundWhite,
                ),
              ],
            ),
      ),
    );
  }

  static Widget appIcons(
      {required String assetName,
      double? width,
      double? height,
      double? borderRadius,
      Color? color,
      BoxFit? fit}) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(borderRadius ?? 4.px),
      child: Image.asset(
        assetName,
        height: height ?? 24.px,
        width: width ?? 24.px,
        color: color,
        fit: fit ?? BoxFit.cover,
        errorBuilder: (context, error, stackTrace) {
          return SizedBox(
            height: height ?? 24.px,
            width: width ?? 24.px,
          );
        },
      ),
    );
  }

  static Widget commonTextFieldForLoginSignUP(
      {double? elevation,
      String? hintText,
      String? labelText,
      String? errorText,
      String? title,
      TextStyle? titleStyle,
      EdgeInsetsGeometry? contentPadding,
      TextEditingController? controller,
      int? maxLines,
      double? cursorHeight,
      double? horizontalPadding,
      double? prefixIconHorizontal,
      bool wantBorder = false,
      ValueChanged<String>? onChanged,
      FormFieldValidator<String>? validator,
      Color? fillColor,
      Color? initialBorderColor,
      double? initialBorderWidth,
      TextInputType? keyboardType,
      double? borderRadius,
      double? maxHeight,
      TextStyle? hintStyle,
      TextStyle? style,
      TextStyle? labelStyle,
      TextStyle? errorStyle,
      List<TextInputFormatter>? inputFormatters,
      TextCapitalization textCapitalization = TextCapitalization.none,
      bool autofocus = false,
      bool readOnly = false,
      bool hintTextColor = false,
      Widget? suffixIcon,
      Widget? prefixIcon,
      AutovalidateMode? autoValidateMode,
      int? maxLength,
      GestureTapCallback? onTap,
      bool obscureText = false,
      FocusNode? focusNode,
      bool? filled,
      bool isCard = false}) {
    return Container(
      decoration: BoxDecoration(
        color: isCard
            ? Theme.of(Get.context!).primaryColor
            : Theme.of(Get.context!).colorScheme.onSecondary,
        borderRadius: BorderRadius.circular(borderRadius ?? 14.px),
      ),
      child: Container(
        margin: EdgeInsets.all(1.4.px),
        decoration: BoxDecoration(
          color: Theme.of(Get.context!).scaffoldBackgroundColor,
          borderRadius: BorderRadius.circular(borderRadius ?? 14.px),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: horizontalPadding ?? 16.px),
          child: Row(
            children: [
              prefixIcon != null
                  ? Row(children: [
                      prefixIcon,
                      Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: prefixIconHorizontal ?? 14.px),
                        child: Container(
                          width: 1.4.px,
                          height: 30.px,
                          decoration: BoxDecoration(
                            color: isCard
                                ? Theme.of(Get.context!).primaryColor
                                : Theme.of(Get.context!)
                                    .colorScheme
                                    .onSecondary,
                          ),
                        ),
                      ),
                    ])
                  : const SizedBox(),
              Flexible(
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 4.px),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        title ?? '',
                        style: style ??
                            Theme.of(Get.context!)
                                .textTheme
                                .titleMedium
                                ?.copyWith(
                                  fontWeight: FontWeight.w600,
                                  color: isCard
                                      ? Theme.of(Get.context!).primaryColor
                                      : Theme.of(Get.context!)
                                          .colorScheme
                                          .onSecondary,
                                ),
                      ),
                      SizedBox(
                        height: 30.px,
                        child: TextFormField(
                          focusNode: focusNode,
                          obscureText: obscureText,
                          onTap: onTap,
                          maxLength: maxLength,
                          cursorHeight: cursorHeight,
                          cursorColor: Theme.of(Get.context!).primaryColor,
                          autovalidateMode: autoValidateMode,
                          controller: controller,
                          onChanged: onChanged ??
                              (value) {
                                value = value.trim();
                                if (value.isEmpty ||
                                    value.replaceAll(" ", "").isEmpty) {
                                  controller?.text = "";
                                }
                              },
                          validator: validator,
                          keyboardType:
                              keyboardType ?? TextInputType.streetAddress,
                          readOnly: readOnly,
                          autofocus: autofocus,
                          inputFormatters: inputFormatters,
                          textCapitalization: textCapitalization,
                          style: style ??
                              Theme.of(Get.context!)
                                  .textTheme
                                  .headlineMedium
                                  ?.copyWith(fontSize: 14.px),
                          decoration: InputDecoration(
                            errorText: errorText,
                            counterText: '',
                            errorStyle: errorStyle ??
                                Theme.of(Get.context!)
                                    .textTheme
                                    .titleMedium
                                    ?.copyWith(
                                        color: Theme.of(Get.context!)
                                            .colorScheme
                                            .error),
                            // suffixIcon: suffixIcon,
                            // prefixIcon: prefixIcon,
                            hintText: hintText,
                            labelText: labelText,
                            labelStyle: labelStyle,
                            fillColor: fillColor ??
                                Theme.of(Get.context!).primaryColor,
                            filled: filled ?? false,
                            contentPadding: contentPadding ??
                                EdgeInsets.only(bottom: 14.px),
                            hintStyle: hintStyle ??
                                Theme.of(Get.context!).textTheme.titleMedium,
                            border: InputBorder.none,
                            focusedBorder: InputBorder.none,
                            enabledBorder: InputBorder.none,
                            errorBorder: InputBorder.none,
                            disabledBorder: InputBorder.none,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              suffixIcon != null
                  ? Row(children: [
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 14.px),
                        child: Container(
                          width: 1.4.px,
                          height: 30.px,
                          decoration: BoxDecoration(
                            color: isCard
                                ? Theme.of(Get.context!).primaryColor
                                : Theme.of(Get.context!)
                                    .colorScheme
                                    .onSecondary,
                          ),
                        ),
                      ),
                      suffixIcon,
                    ])
                  : const SizedBox(),
            ],
          ),
        ),
      ),
    );
  }

  static Widget commonTextField({
    double? elevation,
    String? hintText,
    String? labelText,
    String? errorText,
    EdgeInsetsGeometry? contentPadding,
    TextEditingController? controller,
    int? maxLines,
    double? cursorHeight,
    bool wantBorder = false,
    ValueChanged<String>? onChanged,
    FormFieldValidator<String>? validator,
    Color? fillColor = const Color(0xffF8F8F8),
    Color? initialBorderColor,
    double? initialBorderWidth,
    TextInputType? keyboardType,
    double? borderRadius,
    double? maxHeight,
    TextStyle? hintStyle,
    TextStyle? style,
    TextStyle? labelStyle,
    TextStyle? errorStyle,
    List<TextInputFormatter>? inputFormatters,
    TextCapitalization textCapitalization = TextCapitalization.none,
    bool autofocus = false,
    bool readOnly = false,
    bool hintTextColor = false,
    Widget? suffixIcon,
    Widget? prefixIcon,
    AutovalidateMode? autoValidateMode,
    int? maxLength,
    GestureTapCallback? onTap,
    bool obscureText = false,
    FocusNode? focusNode,
    bool? filled,
    ValueChanged<String>? onFieldSubmitted,
  }) {
    return TextFormField(
      focusNode: focusNode,
      onFieldSubmitted: onFieldSubmitted,
      obscureText: obscureText,
      onTap: onTap,
      maxLength: maxLength,
      maxLines: maxLines ?? 1,
      cursorHeight: cursorHeight,
      cursorColor: Theme.of(Get.context!).primaryColor,
      autovalidateMode: autoValidateMode,
      controller: controller,
      onChanged: onChanged ??
          (value) {
            value = value.trim();
            if (value.isEmpty || value.replaceAll(" ", "").isEmpty) {
              controller?.text = "";
            }
          },
      validator: validator,
      keyboardType: keyboardType ?? TextInputType.streetAddress,
      readOnly: readOnly,
      autofocus: autofocus,
      inputFormatters: inputFormatters,
      textCapitalization: textCapitalization,
      style: style ??
          Theme.of(Get.context!).textTheme.titleMedium?.copyWith(
                color: Theme.of(Get.context!).primaryColor,
              ),
      decoration: InputDecoration(
        errorText: errorText,
        counterText: '',
        errorStyle: errorStyle ??
            Theme.of(Get.context!)
                .textTheme
                .titleMedium
                ?.copyWith(color: Theme.of(Get.context!).colorScheme.error),
        suffixIcon: suffixIcon,
        prefixIcon: prefixIcon,
        hintText: hintText,
        labelText: labelText,
        labelStyle: labelStyle,
        fillColor: fillColor ?? Theme.of(Get.context!).scaffoldBackgroundColor,
        filled: filled ?? true,
        contentPadding:
            contentPadding ?? EdgeInsets.symmetric(horizontal: 20.px),
        hintStyle: hintStyle ??
            Theme.of(Get.context!).textTheme.titleMedium?.copyWith(
                color: hintTextColor
                    ? Theme.of(Get.context!).primaryColor
                    : Theme.of(Get.context!).textTheme.titleMedium?.color),
        disabledBorder: OutlineInputBorder(
          borderSide: wantBorder
              ? BorderSide(
                  color: Theme.of(Get.context!).colorScheme.onSurface,
                  width: 2.px)
              : BorderSide.none,
          borderRadius: BorderRadius.circular(
            borderRadius ?? 14.px,
          ),
        ),
        border: OutlineInputBorder(
            borderSide: wantBorder
                ? BorderSide(
                    color: Theme.of(Get.context!).primaryColor, width: 2.px)
                : BorderSide.none,
            borderRadius: BorderRadius.circular(borderRadius ?? 14.px)),
        enabledBorder: OutlineInputBorder(
            borderSide: wantBorder
                ? BorderSide(
                    color: initialBorderColor ??
                        Theme.of(Get.context!).primaryColor,
                    width: initialBorderWidth ?? 2.px)
                : BorderSide.none,
            borderRadius: BorderRadius.circular(borderRadius ?? 14.px)),
        errorBorder: OutlineInputBorder(
            borderSide: wantBorder
                ? BorderSide(
                    color: Theme.of(Get.context!).colorScheme.onError,
                    width: 2.px)
                : BorderSide.none,
            borderRadius: BorderRadius.circular(borderRadius ?? 14.px)),
      ),
    );
  }

  static Widget commonOtpView({
    MainAxisAlignment mainAxisAlignment = MainAxisAlignment.spaceEvenly,
    PinCodeFieldShape? shape,
    TextInputType keyboardType = TextInputType.number,
    List<TextInputFormatter>? inputFormatters,
    TextEditingController? controller,
    ValueChanged<String>? onChanged,
    ValueChanged<String>? onCompleted,
    int length = 6,
    double? height,
    double? width,
    double? borderRadius,
    double? borderWidth,
    bool readOnly = false,
    bool autoFocus = true,
    bool enableActiveFill = true,
    bool enablePinAutofill = true,
    bool autoDismissKeyboard = true,
    TextStyle? textStyle,
    Color? cursorColor,
    Color? inactiveColor,
    Color? inactiveFillColor,
    Color? activeColor,
    Color? activeFillColor,
    Color? selectedColor,
    Color? selectedFillColor,
  }) =>
      PinCodeTextField(
        length: length,
        mainAxisAlignment: mainAxisAlignment,
        appContext: Get.context!,
        cursorColor: cursorColor ?? Theme.of(Get.context!).primaryColor,
        autoFocus: autoFocus,
        keyboardType: keyboardType,
        inputFormatters: inputFormatters ??
            <TextInputFormatter>[FilteringTextInputFormatter.digitsOnly],
        readOnly: readOnly,
        textStyle: textStyle ?? Theme.of(Get.context!).textTheme.headlineMedium,
        autoDisposeControllers: false,
        enabled: true,
        animationType: AnimationType.fade,
        pinTheme: PinTheme(
          inactiveColor: Colors.grey.withOpacity(0.8),
          inactiveFillColor: Colors.transparent,
          activeColor: Colors.grey.withOpacity(0.8),
          activeFillColor: Colors.transparent,
          selectedColor: Theme.of(Get.context!).colorScheme.primary,
          selectedFillColor: Colors.transparent,
          shape: shape ?? PinCodeFieldShape.box,
          fieldWidth: width ?? 45.px,
          fieldHeight: height ?? 45.px,
          borderWidth: borderWidth ?? 1.px,
          borderRadius: BorderRadius.circular(borderRadius ?? 15.px),
        ),
        enableActiveFill: enableActiveFill,
        controller: controller,
        onChanged: onChanged,
        enablePinAutofill: enablePinAutofill,
        onCompleted: onCompleted,
        autoDismissKeyboard: autoDismissKeyboard,
      );

  static countryCodePicker({ValueChanged<CountryCode>? onChanged}) {
    return CountryCodePicker(
      boxDecoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25.px),
        border: Border.all(
          color: Theme.of(Get.context!).primaryColor,
          width: .8.px,
        ),
      ),
      searchDecoration: InputDecoration(
        contentPadding: EdgeInsets.zero,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14.px),
          borderSide: BorderSide(
            width: .8.px,
            color: Theme.of(Get.context!).primaryColor,
          ),
        ),
        disabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14.px),
          borderSide: BorderSide(
            width: .8.px,
            color: Theme.of(Get.context!).primaryColor,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14.px),
          borderSide: BorderSide(
            width: .8.px,
            color: Theme.of(Get.context!).primaryColor,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14.px),
          borderSide: BorderSide(
            width: .8.px,
            color: Theme.of(Get.context!).colorScheme.onSecondaryContainer,
          ),
        ),
      ),
      padding: EdgeInsets.zero,
      showFlagMain: true,
      onChanged: onChanged,
      initialSelection: 'IN',
      showCountryOnly: false,
      showDropDownButton: false,
      showOnlyCountryWhenClosed: false,
      alignLeft: false,
      textStyle: Theme.of(Get.context!)
          .textTheme
          .displayMedium
          ?.copyWith(fontSize: 14.px),
    );
  }
}

enum ErrorAnimationType { shake, clear }
