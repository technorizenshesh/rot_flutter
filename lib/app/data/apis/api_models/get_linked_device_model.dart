class LinkedDeviceModel {
  List<LinkedDeviceData>? data;
  String? message;
  String? status;

  LinkedDeviceModel({this.data, this.message, this.status});

  LinkedDeviceModel.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <LinkedDeviceData>[];
      json['data'].forEach((v) {
        data!.add(LinkedDeviceData.fromJson(v));
      });
    }
    message = json['message'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    data['message'] = message;
    data['status'] = status;
    return data;
  }
}

class LinkedDeviceData {
  String? id;
  String? userId;
  String? deviceId;
  String? deviceName;
  String? dateTime;

  LinkedDeviceData(
      {this.id, this.userId, this.deviceId, this.deviceName, this.dateTime});

  LinkedDeviceData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    deviceId = json['device_id'];
    deviceName = json['device_name'];
    dateTime = json['date_time'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['user_id'] = userId;
    data['device_id'] = deviceId;
    data['device_name'] = deviceName;
    data['date_time'] = dateTime;
    return data;
  }
}
