class GetModelByBrandModel {
  List<GetModelByBrandData>? data;
  String? message;
  String? status;

  GetModelByBrandModel({this.data, this.message, this.status});

  GetModelByBrandModel.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <GetModelByBrandData>[];
      json['data'].forEach((v) {
        data!.add(GetModelByBrandData.fromJson(v));
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

class GetModelByBrandData {
  String? id;
  String? modelName;
  String? brandId;
  String? dateTime;

  GetModelByBrandData({this.id, this.modelName, this.brandId, this.dateTime});

  GetModelByBrandData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    modelName = json['model_name'];
    brandId = json['brand_id'];
    dateTime = json['date_time'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['model_name'] = modelName;
    data['brand_id'] = brandId;
    data['date_time'] = dateTime;
    return data;
  }
}
