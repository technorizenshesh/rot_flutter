class GetLikeUsersModel {
  List<GetLikeUsersData>? data;
  String? message;
  String? status;

  GetLikeUsersModel({this.data, this.message, this.status});

  GetLikeUsersModel.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <GetLikeUsersData>[];
      json['data'].forEach((v) {
        data!.add(GetLikeUsersData.fromJson(v));
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

class GetLikeUsersData {
  String? id;
  String? userId;
  String? otherUserId;
  String? dateTime;
  Product? product;

  GetLikeUsersData(
      {this.id, this.userId, this.otherUserId, this.dateTime, this.product});

  GetLikeUsersData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    otherUserId = json['other_user_id'];
    dateTime = json['date_time'];
    product =
        json['product'] != null ? Product.fromJson(json['product']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['user_id'] = userId;
    data['other_user_id'] = otherUserId;
    data['date_time'] = dateTime;
    if (product != null) {
      data['product'] = product!.toJson();
    }
    return data;
  }
}

class Product {
  String? id;
  String? userName;
  String? email;
  String? password;
  String? type;
  String? countryCode;
  String? mobile;
  String? gender;
  String? whatsappNumber;
  String? dob;
  String? image;
  String? otp;
  String? accountStatus;
  String? step;
  String? sellerAddress;
  String? lat;
  String? lon;
  String? language;
  String? bio;
  String? updatedAt;
  String? createdAt;
  String? wallet;
  String? reviewCount;
  String? productImage;

  Product(
      {this.id,
      this.userName,
      this.email,
      this.password,
      this.type,
      this.countryCode,
      this.mobile,
      this.gender,
      this.whatsappNumber,
      this.dob,
      this.image,
      this.otp,
      this.accountStatus,
      this.step,
      this.sellerAddress,
      this.lat,
      this.lon,
      this.language,
      this.bio,
      this.updatedAt,
      this.createdAt,
      this.wallet,
      this.reviewCount,
      this.productImage});

  Product.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userName = json['user_name'];
    email = json['email'];
    password = json['password'];
    type = json['type'];
    countryCode = json['country_code'];
    mobile = json['mobile'];
    gender = json['gender'];
    whatsappNumber = json['whatsapp_number'];
    dob = json['dob'];
    image = json['image'];
    otp = json['otp'];
    accountStatus = json['account_status'];
    step = json['step'];
    sellerAddress = json['seller_address'];
    lat = json['lat'];
    lon = json['lon'];
    language = json['language'];
    bio = json['bio'];
    updatedAt = json['updated_at'];
    createdAt = json['created_at'];
    wallet = json['wallet'];
    reviewCount = json['review_count'];
    productImage = json['product_image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['user_name'] = userName;
    data['email'] = email;
    data['password'] = password;
    data['type'] = type;
    data['country_code'] = countryCode;
    data['mobile'] = mobile;
    data['gender'] = gender;
    data['whatsapp_number'] = whatsappNumber;
    data['dob'] = dob;
    data['image'] = image;
    data['otp'] = otp;
    data['account_status'] = accountStatus;
    data['step'] = step;
    data['seller_address'] = sellerAddress;
    data['lat'] = lat;
    data['lon'] = lon;
    data['language'] = language;
    data['bio'] = bio;
    data['updated_at'] = updatedAt;
    data['created_at'] = createdAt;
    data['wallet'] = wallet;
    data['review_count'] = reviewCount;
    data['product_image'] = productImage;
    return data;
  }
}
