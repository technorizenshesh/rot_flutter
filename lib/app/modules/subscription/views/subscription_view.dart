import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import '../../../../common/common_widgets.dart';
import '../../../data/constants/image_constants.dart';
import '../../../data/constants/string_constants.dart';
import '../controllers/subscription_controller.dart';

class SubscriptionView extends GetView<SubscriptionController> {
  const SubscriptionView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommonWidgets.appBar(title: StringConstants.subscription),
      body: ListView(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.px),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 20.px),
                Text(
                  StringConstants.rotPro,
                  style: Theme.of(context).textTheme.displayMedium?.copyWith(
                        fontSize: 28.px,
                        color: Theme.of(context).primaryColor,
                      ),
                ),
                SizedBox(height: 20.px),
                Text(
                  StringConstants.itOffersYouSolutions,
                  style: Theme.of(context)
                      .textTheme
                      .displayMedium
                      ?.copyWith(fontSize: 14.px),
                ),
                SizedBox(height: 20.px),
                Text(
                  StringConstants.itOffersYouSolutions,
                  style: Theme.of(context)
                      .textTheme
                      .titleMedium
                      ?.copyWith(fontSize: 20.px),
                ),
                SizedBox(height: 20.px),
                Container(
                  height: 200.px,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(
                        ImageConstants.imageBackgroundCardGreen,
                      ),
                    ),
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(20.px),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          StringConstants.rot,
                          style: Theme.of(context)
                              .textTheme
                              .displayMedium
                              ?.copyWith(
                                fontSize: 16.px,
                                color:
                                    Theme.of(context).scaffoldBackgroundColor,
                              ),
                        ),
                        Text(
                          '\$ 09.00',
                          style: Theme.of(context)
                              .textTheme
                              .displayMedium
                              ?.copyWith(
                                fontSize: 24.px,
                                color:
                                    Theme.of(context).scaffoldBackgroundColor,
                              ),
                        ),
                        Text(
                          'Start plan',
                          style: Theme.of(context)
                              .textTheme
                              .displayMedium
                              ?.copyWith(
                                fontSize: 20.px,
                                color:
                                    Theme.of(context).scaffoldBackgroundColor,
                              ),
                        ),
                        Text(
                          "Free service up to a maximum of 10 publications, with a quantity limit per article\nof 1. You will not be able to see the clients' contact details nor will theirs be visible.",
                          style: Theme.of(context)
                              .textTheme
                              .titleMedium
                              ?.copyWith(
                                color:
                                    Theme.of(context).scaffoldBackgroundColor,
                              ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 20.px),
                Container(
                  height: 200.px,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(
                        ImageConstants.imageBackgroundCardPink,
                      ),
                    ),
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(20.px),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          StringConstants.rot,
                          style: Theme.of(context)
                              .textTheme
                              .displayMedium
                              ?.copyWith(
                                fontSize: 16.px,
                                color:
                                    Theme.of(context).scaffoldBackgroundColor,
                              ),
                        ),
                        Text(
                          '\$ 08.00',
                          style: Theme.of(context)
                              .textTheme
                              .displayMedium
                              ?.copyWith(
                                fontSize: 24.px,
                                color:
                                    Theme.of(context).scaffoldBackgroundColor,
                              ),
                        ),
                        Text(
                          'Basic Plan',
                          style: Theme.of(context)
                              .textTheme
                              .displayMedium
                              ?.copyWith(
                                fontSize: 20.px,
                                color: Theme.of(context).primaryColor,
                              ),
                        ),
                        Text(
                          "number of items 200 products maximum, you will pay X dollars per month, you\ncan use the ERP to import and export products, billing, inventory control.",
                          style: Theme.of(context)
                              .textTheme
                              .titleMedium
                              ?.copyWith(
                                color:
                                    Theme.of(context).scaffoldBackgroundColor,
                              ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 20.px),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
