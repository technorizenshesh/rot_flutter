import 'package:flutter/material.dart';
import 'package:flutter_credit_card/flutter_credit_card.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:rot_application/app/data/constants/image_constants.dart';
import 'package:rot_application/app/modules/add_new_card/controllers/AddNewCardController.dart';

import '../../../../common/common_widgets.dart';
import '../../../data/constants/string_constants.dart';

class AddNewCardView extends GetView<AddNewCardController> {
  const AddNewCardView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: CommonWidgets.appBar(title: StringConstants.addNewCard),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.px),
        child: ListView(
          children: [
            SizedBox(height: 20.px),
            Obx(() {
              controller.count.value;
              return CreditCardWidget(
                padding: 0,
                cardNumber: controller.cardNumber,
                expiryDate: controller.expiryDate,
                cardHolderName: controller.cardHolderName,
                cvvCode: controller.cvvCode,
                showBackView: false,
                isChipVisible: true,
                isHolderNameVisible: true,
                obscureCardNumber: true,
                obscureCardCvv: true,
                isSwipeGestureEnabled: true,
                chipColor: const Color(0xffE5AC3C),
                backgroundImage: ImageConstants.imageCard2,
                cardBgColor: Colors.white,
                onCreditCardWidgetChange: (creditCardBrand) {},
              );
            }),
            SizedBox(height: 20.px),
            CreditCardForm(
              cardNumber: controller.cardNumber,
              expiryDate: controller.expiryDate,
              cardHolderName: controller.cardHolderName,
              cvvCode: controller.cvvCode,
              onCreditCardModelChange: (creditCardModel) {
                controller.cardNumber = creditCardModel.cardNumber;
                controller.expiryDate = creditCardModel.expiryDate;
                controller.cardHolderName = creditCardModel.cardHolderName;
                controller.cvvCode = creditCardModel.cvvCode;
                controller.isCvvFocused = creditCardModel.isCvvFocused;
                controller.increment();
              },
              formKey: controller.formKey,
              inputConfiguration: InputConfiguration(
                cardNumberDecoration: CommonWidgets.inputDecoration(
                    labelText: 'Card Number', hintText: 'XXXX XXXX XXXX XXXX'),
                expiryDateDecoration: CommonWidgets.inputDecoration(
                  labelText: 'Expired Date',
                  hintText: 'XX/XX',
                ),
                cvvCodeDecoration: CommonWidgets.inputDecoration(
                  labelText: 'CVV',
                  hintText: 'XXX',
                ),
                cardHolderDecoration: CommonWidgets.inputDecoration(
                  labelText: 'Card Holder Name',
                  hintText: 'Please enter the holder name',
                ),
              ),
            ),
            SizedBox(height: 40.px),
            Obx(
              () => controller.btnLoading.value
                  ? Container(
                      height: 50,
                      alignment: Alignment.center,
                      margin:
                          const EdgeInsets.only(left: 10, right: 10, bottom: 5),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.teal,
                      ),
                      child: const CircularProgressIndicator(
                        color: Colors.white,
                      ),
                    )
                  : CommonWidgets.commonElevatedButton(
                      onPressed: () => controller.clickOnSave(),
                      childText: Text(
                        StringConstants.save,
                        style: Theme.of(context)
                            .textTheme
                            .headlineSmall
                            ?.copyWith(fontWeight: FontWeight.w700),
                      ),
                    ),
            ),
            SizedBox(height: 10.px),
          ],
        ),
      ),
    );
  }
}
