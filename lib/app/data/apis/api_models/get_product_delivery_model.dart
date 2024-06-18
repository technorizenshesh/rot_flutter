class GetProductDeliveryModel {
  List<GetProductDeliveryData>? data;
  String? message;
  String? status;

  GetProductDeliveryModel({this.data, this.message, this.status});

  GetProductDeliveryModel.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <GetProductDeliveryData>[];
      json['data'].forEach((v) {
        data!.add(GetProductDeliveryData.fromJson(v));
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

class GetProductDeliveryData {
  String? id;
  String? productId;
  String? userId;
  String? amount;
  String? type;
  String? location;
  String? dateTime;
  String? status;
  String? productUserId;
  String? paymentType;
  String? cardId;
  String? productName;
  String? image;
  String? userName;

  GetProductDeliveryData(
      {this.id,
      this.productId,
      this.userId,
      this.amount,
      this.type,
      this.location,
      this.dateTime,
      this.status,
      this.productUserId,
      this.paymentType,
      this.cardId,
      this.productName,
      this.image,
      this.userName});

  GetProductDeliveryData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    productId = json['product_id'];
    userId = json['user_id'];
    amount = json['amount'];
    type = json['type'];
    location = json['location'];
    dateTime = json['date_time'];
    status = json['status'];
    productUserId = json['product_user_id'];
    paymentType = json['payment_type'];
    cardId = json['card_id'];
    productName = json['product_name'];
    image = json['image'];
    userName = json['user_name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['product_id'] = productId;
    data['user_id'] = userId;
    data['amount'] = amount;
    data['type'] = type;
    data['location'] = location;
    data['date_time'] = dateTime;
    data['status'] = status;
    data['product_user_id'] = productUserId;
    data['payment_type'] = paymentType;
    data['card_id'] = cardId;
    data['product_name'] = productName;
    data['image'] = image;
    data['user_name'] = userName;
    return data;
  }
}
