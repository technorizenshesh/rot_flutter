class GetTransmissionModel {
  List<GetTransmissionData>? data;
  String? message;
  String? status;

  GetTransmissionModel({this.data, this.message, this.status});

  GetTransmissionModel.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <GetTransmissionData>[];
      json['data'].forEach((v) {
        data!.add(GetTransmissionData.fromJson(v));
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

class GetTransmissionData {
  String? id;
  String? name;
  String? dateTime;

  GetTransmissionData({this.id, this.name, this.dateTime});

  GetTransmissionData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    dateTime = json['date_time'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['date_time'] = dateTime;
    return data;
  }
}
