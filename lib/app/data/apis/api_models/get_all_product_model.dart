class GetAllProductModel {
  List<AllProductData>? data;
  String? message;
  String? status;

  GetAllProductModel({this.data, this.message, this.status});

  GetAllProductModel.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <AllProductData>[];
      json['data'].forEach((v) {
        data!.add(new AllProductData.fromJson(v));
      });
    }
    message = json['message'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    data['message'] = this.message;
    data['status'] = this.status;
    return data;
  }
}

class AllProductData {
  String? id;
  String? categoryId;
  String? subCategoryId;
  String? productName;
  String? description;
  String? price;
  String? dateTime;
  String? image;
  String? discount;

  AllProductData(
      {this.id,
      this.categoryId,
      this.subCategoryId,
      this.productName,
      this.description,
      this.price,
      this.dateTime,
      this.image,
      this.discount});

  AllProductData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    categoryId = json['category_id'];
    subCategoryId = json['sub_category_id'];
    productName = json['product_name'];
    description = json['description'];
    price = json['price'];
    dateTime = json['date_time'];
    image = json['image'];
    discount = json['discount'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['category_id'] = this.categoryId;
    data['sub_category_id'] = this.subCategoryId;
    data['product_name'] = this.productName;
    data['description'] = this.description;
    data['price'] = this.price;
    data['date_time'] = this.dateTime;
    data['image'] = this.image;
    data['discount'] = this.discount;
    return data;
  }
}
