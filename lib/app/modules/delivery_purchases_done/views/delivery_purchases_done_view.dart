import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/delivery_purchases_done_controller.dart';

class DeliveryPurchasesDoneView
    extends GetView<DeliveryPurchasesDoneController> {
  const DeliveryPurchasesDoneView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('DeliveryPurchasesDoneView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'DeliveryPurchasesDoneView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
