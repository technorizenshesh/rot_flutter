import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/delivery_controller.dart';

class DeliveryView extends GetView<DeliveryController> {
  const DeliveryView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('DeliveryView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'DeliveryView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
