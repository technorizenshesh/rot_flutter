class CardListModel {
  List<CardListData>? data;
  String? message;
  String? status;

  CardListModel({this.data, this.message, this.status});

  CardListModel.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <CardListData>[];
      json['data'].forEach((v) {
        data!.add(CardListData.fromJson(v));
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

class CardListData {
  String? id;
  String? userId;
  String? cardNumber;
  String? cardHolderName;
  String? expireDate;
  String? cvc;
  String? dateTime;

  CardListData(
      {this.id,
      this.userId,
      this.cardNumber,
      this.cardHolderName,
      this.expireDate,
      this.cvc,
      this.dateTime});

  CardListData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    cardNumber = json['card_number'];
    cardHolderName = json['card_holder_name'];
    expireDate = json['expire_date'];
    cvc = json['cvc'];
    dateTime = json['date_time'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['user_id'] = userId;
    data['card_number'] = cardNumber;
    data['card_holder_name'] = cardHolderName;
    data['expire_date'] = expireDate;
    data['cvc'] = cvc;
    data['date_time'] = dateTime;
    return data;
  }
}
