import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/delivery_nearby_points_controller.dart';

class DeliveryNearbyPointsView extends GetView<DeliveryNearbyPointsController> {
  const DeliveryNearbyPointsView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('DeliveryNearbyPointsView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'DeliveryNearbyPointsView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
