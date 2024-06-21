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
  String? availableAt;
  String? countryCode;
  String? weight;
  String? weightDim;
  String? productVolume;
  String? wishId;
  String? typeEngine;
  String? registrationYear;
  String? motor;
  String? kilometer;
  String? transmission;
  String? color;
  String? publicPhone;
  String? modelName;
  String? shipping;
  String? partNumber;
  String? productImage;

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
      this.availableAt,
      this.countryCode,
      this.weight,
      this.weightDim,
      this.productVolume,
      this.wishId,
      this.typeEngine,
      this.registrationYear,
      this.motor,
      this.kilometer,
      this.transmission,
      this.color,
      this.publicPhone,
      this.modelName,
      this.shipping,
      this.partNumber,
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
    availableAt = json['available_at'];
    countryCode = json['country_code'];
    weight = json['weight'];
    weightDim = json['weight_dim'];
    productVolume = json['product_volume'];
    wishId = json['wish_id'];
    typeEngine = json['type_engine'];
    registrationYear = json['registration_year'];
    motor = json['motor'];
    kilometer = json['kilometer'];
    transmission = json['transmission'];
    color = json['color'];
    publicPhone = json['public_phone'];
    modelName = json['model_name'];
    shipping = json['shipping'];
    partNumber = json['part_number'];
    productImage = json['product_image'];
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
    data['available_at'] = availableAt;
    data['country_code'] = countryCode;
    data['weight'] = weight;
    data['weight_dim'] = weightDim;
    data['product_volume'] = productVolume;
    data['wish_id'] = wishId;
    data['type_engine'] = typeEngine;
    data['registration_year'] = registrationYear;
    data['motor'] = motor;
    data['kilometer'] = kilometer;
    data['transmission'] = transmission;
    data['color'] = color;
    data['public_phone'] = publicPhone;
    data['model_name'] = modelName;
    data['shipping'] = shipping;
    data['part_number'] = partNumber;
    data['product_image'] = productImage;
    return data;
  }
}
