class GetProductModel {
  List<Data>? data;
  String? message;
  String? status;

  GetProductModel({this.data, this.message, this.status});

  GetProductModel.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(Data.fromJson(v));
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

class Data {
  String? id;
  String? categoryId;
  String? subCategoryId;
  String? productName;
  String? description;
  String? price;
  String? dateTime;
  String? image;

  Data(
      {this.id,
      this.categoryId,
      this.subCategoryId,
      this.productName,
      this.description,
      this.price,
      this.dateTime,
      this.image});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    categoryId = json['category_id'];
    subCategoryId = json['sub_category_id'];
    productName = json['product_name'];
    description = json['description'];
    price = json['price'];
    dateTime = json['date_time'];
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['category_id'] = categoryId;
    data['sub_category_id'] = subCategoryId;
    data['product_name'] = productName;
    data['description'] = description;
    data['price'] = price;
    data['date_time'] = dateTime;
    data['image'] = image;
    return data;
  }
}
