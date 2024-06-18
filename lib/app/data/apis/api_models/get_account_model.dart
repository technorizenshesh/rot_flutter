class GetAccountModel {
  GetAccountData? data;
  String? message;
  String? status;

  GetAccountModel({this.data, this.message, this.status});

  GetAccountModel.fromJson(Map<String, dynamic> json) {
    data = json['data'] != null ? GetAccountData.fromJson(json['data']) : null;
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

class GetAccountData {
  String? id;
  String? userId;
  String? recipient;
  String? were;
  String? swiptCode;
  String? bankName;
  String? phone;
  String? countryCode;
  String? email;
  String? dateTime;
  String? type;

  GetAccountData(
      {this.id,
      this.userId,
      this.recipient,
      this.were,
      this.swiptCode,
      this.bankName,
      this.phone,
      this.countryCode,
      this.email,
      this.dateTime,
      this.type});

  GetAccountData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    recipient = json['recipient'];
    were = json['were'];
    swiptCode = json['swipt_code'];
    bankName = json['bank_name'];
    phone = json['phone'];
    countryCode = json['country_code'];
    email = json['email'];
    dateTime = json['date_time'];
    type = json['type'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['user_id'] = userId;
    data['recipient'] = recipient;
    data['were'] = were;
    data['swipt_code'] = swiptCode;
    data['bank_name'] = bankName;
    data['phone'] = phone;
    data['country_code'] = countryCode;
    data['email'] = email;
    data['date_time'] = dateTime;
    data['type'] = type;
    return data;
  }
}
