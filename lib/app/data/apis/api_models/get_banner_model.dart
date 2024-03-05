class GetBannerModel {
  List<BannerData>? data;
  String? message;
  String? status;

  GetBannerModel({this.data, this.message, this.status});

  GetBannerModel.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <BannerData>[];
      json['data'].forEach((v) {
        data!.add(BannerData.fromJson(v));
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

class BannerData {
  String? id;
  String? title;
  String? image;
  String? status;
  String? dateTime;
  String? discount;
  String? item;

  BannerData(
      {this.id,
      this.title,
      this.image,
      this.status,
      this.dateTime,
      this.discount,
      this.item});

  BannerData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    image = json['image'];
    status = json['status'];
    dateTime = json['date_time'];
    discount = json['discount'];
    item = json['item'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['title'] = title;
    data['image'] = image;
    data['status'] = status;
    data['date_time'] = dateTime;
    data['discount'] = discount;
    data['item'] = item;
    return data;
  }
}
