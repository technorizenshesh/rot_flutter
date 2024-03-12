class ProfilePublicProductsModel {
  List<ProfilePublicProductsData>? data;
  String? message;
  String? status;

  ProfilePublicProductsModel({this.data, this.message, this.status});

  ProfilePublicProductsModel.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <ProfilePublicProductsData>[];
      json['data'].forEach((v) {
        data!.add(ProfilePublicProductsData.fromJson(v));
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

class ProfilePublicProductsData {
  String? id;
  String? userId;
  String? categoryId;
  String? brandId;
  String? productStatusId;
  String? hashtagId;
  String? currenyId;
  String? title;
  String? description;
  String? productLocation;
  String? productLat;
  String? productLon;
  String? country;
  String? zipCode;
  String? price;
  String? status;
  String? dateTime;
  String? productName;
  String? subCategoryId;
  List<ProductImage>? productImage;

  ProfilePublicProductsData(
      {this.id,
      this.userId,
      this.categoryId,
      this.brandId,
      this.productStatusId,
      this.hashtagId,
      this.currenyId,
      this.title,
      this.description,
      this.productLocation,
      this.productLat,
      this.productLon,
      this.country,
      this.zipCode,
      this.price,
      this.status,
      this.dateTime,
      this.productName,
      this.subCategoryId,
      this.productImage});

  ProfilePublicProductsData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    categoryId = json['category_id'];
    brandId = json['brand_id'];
    productStatusId = json['product_status_id'];
    hashtagId = json['hashtag_id'];
    currenyId = json['curreny_id'];
    title = json['title'];
    description = json['description'];
    productLocation = json['product_location'];
    productLat = json['product_lat'];
    productLon = json['product_lon'];
    country = json['country'];
    zipCode = json['zip_code'];
    price = json['price'];
    status = json['status'];
    dateTime = json['date_time'];
    productName = json['product_name'];
    subCategoryId = json['sub_category_id'];
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
    data['user_id'] = userId;
    data['category_id'] = categoryId;
    data['brand_id'] = brandId;
    data['product_status_id'] = productStatusId;
    data['hashtag_id'] = hashtagId;
    data['curreny_id'] = currenyId;
    data['title'] = title;
    data['description'] = description;
    data['product_location'] = productLocation;
    data['product_lat'] = productLat;
    data['product_lon'] = productLon;
    data['country'] = country;
    data['zip_code'] = zipCode;
    data['price'] = price;
    data['status'] = status;
    data['date_time'] = dateTime;
    data['product_name'] = productName;
    data['sub_category_id'] = subCategoryId;
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
