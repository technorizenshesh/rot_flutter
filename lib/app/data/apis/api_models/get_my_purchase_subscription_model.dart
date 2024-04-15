class MyPurchaseSubscriptionModel {
  List<MyPurchaseSubscriptionData>? data;
  String? message;
  String? status;

  MyPurchaseSubscriptionModel({this.data, this.message, this.status});

  MyPurchaseSubscriptionModel.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <MyPurchaseSubscriptionData>[];
      json['data'].forEach((v) {
        data!.add(MyPurchaseSubscriptionData.fromJson(v));
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

class MyPurchaseSubscriptionData {
  String? id;
  String? userId;
  String? subscriptionId;
  String? subscriptionName;
  String? amount;
  String? paymentType;
  String? dateTime;

  MyPurchaseSubscriptionData(
      {this.id,
      this.userId,
      this.subscriptionId,
      this.subscriptionName,
      this.amount,
      this.paymentType,
      this.dateTime});

  MyPurchaseSubscriptionData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    subscriptionId = json['subscription_id'];
    subscriptionName = json['subscription_name'];
    amount = json['amount'];
    paymentType = json['payment_type'];
    dateTime = json['date_time'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['user_id'] = userId;
    data['subscription_id'] = subscriptionId;
    data['subscription_name'] = subscriptionName;
    data['amount'] = amount;
    data['payment_type'] = paymentType;
    data['date_time'] = dateTime;
    return data;
  }
}
