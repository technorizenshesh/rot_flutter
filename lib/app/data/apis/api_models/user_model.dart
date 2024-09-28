class UserModel {
  UserData? userData;
  String? message;
  String? token;
  String? status;

  UserModel({this.userData, this.message, this.token, this.status});

  UserModel.fromJson(Map<String, dynamic> json) {
    userData =
        json['user_data'] != null ? UserData.fromJson(json['user_data']) : null;
    message = json['message'];
    token = json['token'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (userData != null) {
      data['user_data'] = userData!.toJson();
    }
    data['message'] = message;
    data['token'] = token;
    data['status'] = status;
    return data;
  }
}

class UserData {
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
  String? mainUserId;
  String? inviteId;
  List<CollaboratorsPermission>? collaboratorsPermission;

  UserData(
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
      this.mainUserId,
      this.inviteId,
      this.collaboratorsPermission});

  UserData.fromJson(Map<String, dynamic> json) {
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
    mainUserId = json['main_user_id'];
    inviteId = json['invite_id'];
    if (json['collaborators_permission'] != null) {
      collaboratorsPermission = <CollaboratorsPermission>[];
      json['collaborators_permission'].forEach((v) {
        collaboratorsPermission!.add(CollaboratorsPermission.fromJson(v));
      });
    }
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
    data['main_user_id'] = mainUserId;
    data['invite_id'] = inviteId;
    if (collaboratorsPermission != null) {
      data['collaborators_permission'] =
          collaboratorsPermission!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class CollaboratorsPermission {
  String? id;
  String? type;
  String? permission;
  String? dateTime;

  CollaboratorsPermission({this.id, this.type, this.permission, this.dateTime});

  CollaboratorsPermission.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    type = json['type'];
    permission = json['permission'];
    dateTime = json['date_time'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['type'] = type;
    data['permission'] = permission;
    data['date_time'] = dateTime;
    return data;
  }
}
