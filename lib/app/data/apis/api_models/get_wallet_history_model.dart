class WalletHistoryModel {
  List<WalletHistoryData>? data;
  String? message;
  String? status;

  WalletHistoryModel({this.data, this.message, this.status});

  WalletHistoryModel.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <WalletHistoryData>[];
      json['data'].forEach((v) {
        data!.add(WalletHistoryData.fromJson(v));
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

class WalletHistoryData {
  String? id;
  String? userId;
  String? amount;
  String? cardId;
  String? dateTime;

  WalletHistoryData(
      {this.id, this.userId, this.amount, this.cardId, this.dateTime});

  WalletHistoryData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    amount = json['amount'];
    cardId = json['card_id'];
    dateTime = json['date_time'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['user_id'] = userId;
    data['amount'] = amount;
    data['card_id'] = cardId;
    data['date_time'] = dateTime;
    return data;
  }
}
