class MaterialModel {
  List<MaterialData>? data;
  String? message;
  String? status;

  MaterialModel({this.data, this.message, this.status});

  MaterialModel.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <MaterialData>[];
      json['data'].forEach((v) {
        data!.add(MaterialData.fromJson(v));
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

class MaterialData {
  String? id;
  String? materialName;
  String? status;
  String? dateTime;

  MaterialData({this.id, this.materialName, this.status, this.dateTime});

  MaterialData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    materialName = json['material_name'];
    status = json['status'];
    dateTime = json['date_time'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['material_name'] = materialName;
    data['status'] = status;
    data['date_time'] = dateTime;
    return data;
  }
}
