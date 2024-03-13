class GetChatModel {
  List<ChatResult>? result;
  String? message;
  String? status;

  GetChatModel({this.result, this.message, this.status});

  GetChatModel.fromJson(Map<String, dynamic> json) {
    if (json['result'] != null) {
      result = <ChatResult>[];
      json['result'].forEach((v) {
        result!.add(ChatResult.fromJson(v));
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

class ChatResult {
  String? id;
  String? senderId;
  String? receiverId;
  String? requestId;
  String? chatMessage;
  String? chatImage;
  String? chatAudio;
  String? chatVideo;
  String? chatDocument;
  String? lat;
  String? lon;
  String? name;
  String? contact;
  String? clearChat;
  String? status;
  String? date;
  String? result;
  SenderDetail? senderDetail;
  ReceiverDetail? receiverDetail;

  ChatResult(
      {this.id,
      this.senderId,
      this.receiverId,
      this.requestId,
      this.chatMessage,
      this.chatImage,
      this.chatAudio,
      this.chatVideo,
      this.chatDocument,
      this.lat,
      this.lon,
      this.name,
      this.contact,
      this.clearChat,
      this.status,
      this.date,
      this.result,
      this.senderDetail,
      this.receiverDetail});

  ChatResult.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    senderId = json['sender_id'];
    receiverId = json['receiver_id'];
    requestId = json['request_id'];
    chatMessage = json['chat_message'];
    chatImage = json['chat_image'];
    chatAudio = json['chat_audio'];
    chatVideo = json['chat_video'];
    chatDocument = json['chat_document'];
    lat = json['lat'];
    lon = json['lon'];
    name = json['name'];
    contact = json['contact'];
    clearChat = json['clear_chat'];
    status = json['status'];
    date = json['date'];
    result = json['result'];
    senderDetail = json['sender_detail'] != null
        ? SenderDetail.fromJson(json['sender_detail'])
        : null;
    receiverDetail = json['receiver_detail'] != null
        ? ReceiverDetail.fromJson(json['receiver_detail'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['sender_id'] = senderId;
    data['receiver_id'] = receiverId;
    data['request_id'] = requestId;
    data['chat_message'] = chatMessage;
    data['chat_image'] = chatImage;
    data['chat_audio'] = chatAudio;
    data['chat_video'] = chatVideo;
    data['chat_document'] = chatDocument;
    data['lat'] = lat;
    data['lon'] = lon;
    data['name'] = name;
    data['contact'] = contact;
    data['clear_chat'] = clearChat;
    data['status'] = status;
    data['date'] = date;
    data['result'] = result;
    if (senderDetail != null) {
      data['sender_detail'] = senderDetail!.toJson();
    }
    if (receiverDetail != null) {
      data['receiver_detail'] = receiverDetail!.toJson();
    }
    return data;
  }
}

class SenderDetail {
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
  String? senderImage;

  SenderDetail(
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
      this.senderImage});

  SenderDetail.fromJson(Map<String, dynamic> json) {
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
    senderImage = json['sender_image'];
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
    data['sender_image'] = senderImage;
    return data;
  }
}

class ReceiverDetail {
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
  String? receiverImage;

  ReceiverDetail(
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
      this.receiverImage});

  ReceiverDetail.fromJson(Map<String, dynamic> json) {
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
    receiverImage = json['receiver_image'];
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
    data['receiver_image'] = receiverImage;
    return data;
  }
}
