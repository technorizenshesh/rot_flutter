import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../common/common_widgets.dart';
import '../../../data/constants/string_constants.dart';
import '../controllers/rot_protection_controller.dart';

class RotProtectionView extends GetView<RotProtectionController> {
  const RotProtectionView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommonWidgets.appBar(title: StringConstants.rot),
      body: const Center(
        child: Text(
          'RotProtectionView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
