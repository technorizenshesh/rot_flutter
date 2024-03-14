class GetConversationModel {
  List<GetConversationResult>? result;
  String? message;
  int? status;

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
  int? noOfMessage;
  String? lastMessage;
  String? lastImage;
  String? date;
  String? time;
  String? senderId;
  String? receiverId;

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
      this.noOfMessage,
      this.lastMessage,
      this.lastImage,
      this.date,
      this.time,
      this.senderId,
      this.receiverId});

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
    noOfMessage = json['no_of_message'];
    lastMessage = json['last_message'];
    lastImage = json['last_image'];
    date = json['date'];
    time = json['time'];
    senderId = json['sender_id'];
    receiverId = json['receiver_id'];
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
    data['no_of_message'] = noOfMessage;
    data['last_message'] = lastMessage;
    data['last_image'] = lastImage;
    data['date'] = date;
    data['time'] = time;
    data['sender_id'] = senderId;
    data['receiver_id'] = receiverId;
    return data;
  }
}
