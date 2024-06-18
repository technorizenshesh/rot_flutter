class CheckQrCodeModel {
  CheckQrCodeData? data;
  String? message;
  String? status;

  CheckQrCodeModel({this.data, this.message, this.status});

  CheckQrCodeModel.fromJson(Map<String, dynamic> json) {
    data = json['data'] != null ? CheckQrCodeData.fromJson(json['data']) : null;
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

class CheckQrCodeData {
  String? id;
  String? userId;
  String? amount;
  String? qrCode;
  String? walletId;
  String? dateTime;

  CheckQrCodeData(
      {this.id,
      this.userId,
      this.amount,
      this.qrCode,
      this.walletId,
      this.dateTime});

  CheckQrCodeData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    amount = json['amount'];
    qrCode = json['qr_code'];
    walletId = json['wallet_id'];
    dateTime = json['date_time'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['user_id'] = userId;
    data['amount'] = amount;
    data['qr_code'] = qrCode;
    data['wallet_id'] = walletId;
    data['date_time'] = dateTime;
    return data;
  }
}
