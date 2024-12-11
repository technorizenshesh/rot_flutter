class GetConversationModel {
  List<GetConversationResult>? result;
  String? message;
  var status;

  GetConversationModel({this.result, this.message, this.status});

  GetConversationModel.fromJson(Map<String, dynamic> json) {
    if (json['result'] != null) {
      result = <GetConversationResult>[];
      json['result'].forEach((v) {
        result!.add(GetConversationResult.fromJson(v));
      });
    }
    message = json['message'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (result != null) {
      data['result'] = result!.map((v) => v.toJson()).toList();
    }
    data['message'] = message;
    data['status'] = status;
    return data;
  }
}

class GetConversationResult {
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
  int? noOfMessage;
  String? lastMessage;
  String? lastImage;
  String? date;
  String? time;
  String? productId;
  String? productName;
  String? productImage;
  String? senderId;
  String? receiverId;
  String? productStatus;

  GetConversationResult(
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
      this.noOfMessage,
      this.lastMessage,
      this.lastImage,
      this.date,
      this.time,
      this.productId,
      this.productName,
      this.productImage,
      this.senderId,
      this.receiverId,
      this.productStatus});

  GetConversationResult.fromJson(Map<String, dynamic> json) {
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
    noOfMessage = json['no_of_message'];
    lastMessage = json['last_message'];
    lastImage = json['last_image'];
    date = json['date'];
    time = json['time'];
    productId = json['product_id'];
    productName = json['product_name'];
    productImage = json['product_image'];
    senderId = json['sender_id'];
    receiverId = json['receiver_id'];
    productStatus = json['product_status'];
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
    data['no_of_message'] = noOfMessage;
    data['last_message'] = lastMessage;
    data['last_image'] = lastImage;
    data['date'] = date;
    data['time'] = time;
    data['product_id'] = productId;
    data['product_name'] = productName;
    data['product_image'] = productImage;
    data['sender_id'] = senderId;
    data['receiver_id'] = receiverId;
    data['product_status'] = productStatus;
    return data;
  }
}
