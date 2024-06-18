class WishCategoryModel {
  List<WishCategoryData>? data;
  String? message;
  String? status;

  WishCategoryModel({this.data, this.message, this.status});

  WishCategoryModel.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <WishCategoryData>[];
      json['data'].forEach((v) {
        data!.add(WishCategoryData.fromJson(v));
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

class WishCategoryData {
  String? id;
  String? name;
  String? image;
  String? dateTime;

  WishCategoryData({this.id, this.name, this.image, this.dateTime});

  WishCategoryData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    image = json['image'];
    dateTime = json['date_time'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['image'] = image;
    data['date_time'] = dateTime;
    return data;
  }
}
