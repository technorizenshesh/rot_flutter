import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/add_delivery_address_controller.dart';

class AddDeliveryAddressView extends GetView<AddDeliveryAddressController> {
  const AddDeliveryAddressView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('AddDeliveryAddressView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'AddDeliveryAddressView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
