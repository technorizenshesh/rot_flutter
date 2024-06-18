class GetServicesTypeModel {
  List<GetServicesTypeData>? data;
  String? message;
  String? status;

  GetServicesTypeModel({this.data, this.message, this.status});

  GetServicesTypeModel.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <GetServicesTypeData>[];
      json['data'].forEach((v) {
        data!.add(GetServicesTypeData.fromJson(v));
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

class GetServicesTypeData {
  String? id;
  String? servicesName;
  String? dateTime;

  GetServicesTypeData({this.id, this.servicesName, this.dateTime});

  GetServicesTypeData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    servicesName = json['services_name'];
    dateTime = json['date_time'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['services_name'] = servicesName;
    data['date_time'] = dateTime;
    return data;
  }
}
