class HelpCenterModel {
  List<HelpCenterData>? data;
  String? message;
  String? status;

  HelpCenterModel({this.data, this.message, this.status});

  HelpCenterModel.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <HelpCenterData>[];
      json['data'].forEach((v) {
        data!.add(HelpCenterData.fromJson(v));
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

class HelpCenterData {
  String? id;
  String? message;
  String? dateTime;
  String? type;

  HelpCenterData({this.id, this.message, this.dateTime, this.type});

  HelpCenterData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    message = json['message'];
    dateTime = json['date_time'];
    type = json['type'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['message'] = message;
    data['date_time'] = dateTime;
    data['type'] = type;
    return data;
  }
}
