import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/delivery_purchases_status_controller.dart';

class DeliveryPurchasesStatusView
    extends GetView<DeliveryPurchasesStatusController> {
  const DeliveryPurchasesStatusView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('DeliveryPurchasesStatusView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'DeliveryPurchasesStatusView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
