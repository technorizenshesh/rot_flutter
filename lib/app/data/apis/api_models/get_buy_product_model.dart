class BuyProductModel {
  BuyProductData? data;
  String? message;
  String? status;

  BuyProductModel({this.data, this.message, this.status});

  BuyProductModel.fromJson(Map<String, dynamic> json) {
    data = json['data'] != null ? BuyProductData.fromJson(json['data']) : null;
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

class BuyProductData {
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
  String? loginWith;
  String? subcriptionDate;
  String? whatsappCountryCode;
  int? productDeliveryId;

  BuyProductData(
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
      this.loginWith,
      this.subcriptionDate,
      this.whatsappCountryCode,
      this.productDeliveryId});

  BuyProductData.fromJson(Map<String, dynamic> json) {
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
    loginWith = json['login_with'];
    subcriptionDate = json['subcription_date'];
    whatsappCountryCode = json['whatsapp_countryCode'];
    productDeliveryId = json['product_delivery_id'];
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
    data['login_with'] = loginWith;
    data['subcription_date'] = subcriptionDate;
    data['whatsapp_countryCode'] = whatsappCountryCode;
    data['product_delivery_id'] = productDeliveryId;
    return data;
  }
}
