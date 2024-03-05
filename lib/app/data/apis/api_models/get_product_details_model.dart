class GetProductDetailsModel {
  Data? data;
  String? message;
  String? status;

  GetProductDetailsModel({this.data, this.message, this.status});

  GetProductDetailsModel.fromJson(Map<String, dynamic> json) {
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
    message = json['message'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (this.data != null) {
      data['data'] = this.data!.toJson();
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
  String? discount;
  String? productLikeUnlike;
  List<ProductImage>? productImage;

  Data(
      {this.id,
      this.categoryId,
      this.subCategoryId,
      this.productName,
      this.description,
      this.price,
      this.dateTime,
      this.image,
      this.discount,
      this.productLikeUnlike,
      this.productImage});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    categoryId = json['category_id'];
    subCategoryId = json['sub_category_id'];
    productName = json['product_name'];
    description = json['description'];
    price = json['price'];
    dateTime = json['date_time'];
    image = json['image'];
    discount = json['discount'];
    productLikeUnlike = json['product_like_unlike'];
    if (json['product_image'] != null) {
      productImage = <ProductImage>[];
      json['product_image'].forEach((v) {
        productImage!.add(ProductImage.fromJson(v));
      });
    }
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
    data['discount'] = discount;
    data['product_like_unlike'] = productLikeUnlike;
    if (productImage != null) {
      data['product_image'] = productImage!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class ProductImage {
  String? id;
  String? productId;
  String? image;
  String? dateTime;

  ProductImage({this.id, this.productId, this.image, this.dateTime});

  ProductImage.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    productId = json['product_id'];
    image = json['image'];
    dateTime = json['date_time'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['product_id'] = productId;
    data['image'] = image;
    data['date_time'] = dateTime;
    return data;
  }
}
