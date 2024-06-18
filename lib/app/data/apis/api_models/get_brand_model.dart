class GetBrandModel {
  List<GetBrandData>? data;
  String? message;
  String? status;

  GetBrandModel({this.data, this.message, this.status});

  GetBrandModel.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <GetBrandData>[];
      json['data'].forEach((v) {
        data!.add(GetBrandData.fromJson(v));
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

class GetBrandData {
  String? id;
  String? brandName;
  String? dateTime;

  GetBrandData({this.id, this.brandName, this.dateTime});

  GetBrandData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    brandName = json['brand_name'];
    dateTime = json['date_time'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['brand_name'] = brandName;
    data['date_time'] = dateTime;
    return data;
  }
}
