import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import '../../../../common/common_widgets.dart';
import '../../../data/constants/string_constants.dart';
import '../controllers/bank_information_controller.dart';

class BankInformationView extends GetView<BankInformationController> {
  const BankInformationView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommonWidgets.appBar(title: StringConstants.bankInformation),
      body: ListView(
        children: [
          ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: controller.listOfCard.length,
            itemBuilder: (context, index) {
              return Padding(
                padding:
                    EdgeInsets.symmetric(horizontal: 16.px, vertical: 10.px),
                child: Image.asset(
                  controller.listOfCard[index],
                ),
              );
            },
          ),
          SizedBox(height: 24.px),
          Center(
            child: InkWell(
              onTap: () => controller.clickOnAddNewCard(),
              borderRadius: BorderRadius.circular(20.px),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20.px),
                  border: Border.all(
                    color: Theme.of(context).primaryColor.withOpacity(.4.px),
                    width: .4.px,
                  ),
                ),
                child: Padding(
                  padding: EdgeInsets.all(8.px),
                  child: Text(
                    "+   ${StringConstants.addNewCard}",
                    style: Theme.of(context).textTheme.displayMedium?.copyWith(
                        fontSize: 16.px, color: Theme.of(context).primaryColor),
                  ),
                ),
              ),
            ),
          ),
          SizedBox(height: 24.px),
        ],
      ),
    );
  }
}
