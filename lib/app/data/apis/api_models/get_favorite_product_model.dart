class GetFavoriteProductModel {
  List<GetFavoriteProductData>? data;
  String? message;
  String? status;

  GetFavoriteProductModel({this.data, this.message, this.status});

  GetFavoriteProductModel.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <GetFavoriteProductData>[];
      json['data'].forEach((v) {
        data!.add(GetFavoriteProductData.fromJson(v));
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

class GetFavoriteProductData {
  String? id;
  String? userId;
  String? productId;
  String? dateTime;
  Product? product;
  List<ProductImage>? productImage;

  GetFavoriteProductData(
      {this.id,
      this.userId,
      this.productId,
      this.dateTime,
      this.product,
      this.productImage});

  GetFavoriteProductData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    productId = json['product_id'];
    dateTime = json['date_time'];
    product =
        json['product'] != null ? Product.fromJson(json['product']) : null;
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
    data['product_id'] = productId;
    data['date_time'] = dateTime;
    if (product != null) {
      data['product'] = product!.toJson();
    }
    if (productImage != null) {
      data['product_image'] = productImage!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Product {
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

  Product(
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
      this.productName});

  Product.fromJson(Map<String, dynamic> json) {
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
