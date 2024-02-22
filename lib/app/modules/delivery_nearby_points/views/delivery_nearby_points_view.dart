import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../../../common/common_widgets.dart';
import '../../../data/constants/string_constants.dart';
import '../controllers/delivery_nearby_points_controller.dart';

class DeliveryNearbyPointsView extends GetView<DeliveryNearbyPointsController> {
  const DeliveryNearbyPointsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommonWidgets.appBar(title: StringConstants.nearbyPoints.tr),
      body: Stack(
        children: [
          GoogleMap(
            /* markers: {
              Marker(
                markerId: const MarkerId('ll'),
                position: LatLng(controller.lat, controller.long),
                infoWindow: InfoWindow(title: "address"),
              )
            },*/
            mapType: MapType.normal,
            zoomGesturesEnabled: true,
            tiltGesturesEnabled: false,
            onCameraMove: (CameraPosition cameraPosition) {
              print(cameraPosition.zoom);
            },
            minMaxZoomPreference: MinMaxZoomPreference(13, 17),
            initialCameraPosition: CameraPosition(
              target: LatLng(controller.lat, controller.long),
              zoom: 14.4746,
            ),
            onMapCreated: (GoogleMapController googlecontroller) {
              controller.mapController.complete(googlecontroller);
            },
          ),
        ],
      ),
    );
  }
}
