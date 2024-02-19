import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/delivery_purchases_on_the_way_controller.dart';

class DeliveryPurchasesOnTheWayView
    extends GetView<DeliveryPurchasesOnTheWayController> {
  const DeliveryPurchasesOnTheWayView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('DeliveryPurchasesOnTheWayView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'DeliveryPurchasesOnTheWayView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
