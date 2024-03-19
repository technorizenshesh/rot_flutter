class GetProductStatusModel {
  List<GetProductStatusData>? data;
  String? message;
  String? status;

  GetProductStatusModel({this.data, this.message, this.status});

  GetProductStatusModel.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <GetProductStatusData>[];
      json['data'].forEach((v) {
        data!.add(GetProductStatusData.fromJson(v));
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

class GetProductStatusData {
  String? id;
  String? title;
  String? description;
  String? status;

  GetProductStatusData({this.id, this.title, this.description, this.status});

  GetProductStatusData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    description = json['description'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['title'] = title;
    data['description'] = description;
    data['status'] = status;
    return data;
  }
}
