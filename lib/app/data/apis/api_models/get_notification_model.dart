class NotificationModel {
  List<NotificationData>? data;
  String? message;
  String? status;

  NotificationModel({this.data, this.message, this.status});

  NotificationModel.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <NotificationData>[];
      json['data'].forEach((v) {
        data!.add(NotificationData.fromJson(v));
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

class NotificationData {
  String? id;
  String? userId;
  String? message;
  String? productId;
  String? dateTime;

  NotificationData(
      {this.id, this.userId, this.message, this.productId, this.dateTime});

  NotificationData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    message = json['message'];
    productId = json['product_id'];
    dateTime = json['date_time'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['user_id'] = userId;
    data['message'] = message;
    data['product_id'] = productId;
    data['date_time'] = dateTime;
    return data;
  }
}
