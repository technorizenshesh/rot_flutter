class OrderProductDeliveryModel {
  List<OrderProductDeliveryData>? data;
  String? message;
  String? status;

  OrderProductDeliveryModel({this.data, this.message, this.status});

  OrderProductDeliveryModel.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <OrderProductDeliveryData>[];
      json['data'].forEach((v) {
        data!.add(OrderProductDeliveryData.fromJson(v));
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

class OrderProductDeliveryData {
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
  String? walletId;
  String? returnStatus;
  String? returnDateTime;
  String? productName;
  String? image;

  OrderProductDeliveryData(
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
      this.walletId,
      this.returnStatus,
      this.returnDateTime,
      this.productName,
      this.image});

  OrderProductDeliveryData.fromJson(Map<String, dynamic> json) {
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
    walletId = json['wallet_id'];
    returnStatus = json['return_status'];
    returnDateTime = json['return_date_time'];
    productName = json['product_name'];
    image = json['image'];
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
    data['wallet_id'] = walletId;
    data['return_status'] = returnStatus;
    data['return_date_time'] = returnDateTime;
    data['product_name'] = productName;
    data['image'] = image;
    return data;
  }
}
