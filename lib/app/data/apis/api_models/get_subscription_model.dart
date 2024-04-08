class GetSubscriptionModel {
  List<GetSubscriptionData>? data;
  String? message;
  String? status;

  GetSubscriptionModel({this.data, this.message, this.status});

  GetSubscriptionModel.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <GetSubscriptionData>[];
      json['data'].forEach((v) {
        data!.add(GetSubscriptionData.fromJson(v));
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

class GetSubscriptionData {
  String? id;
  String? name;
  String? amount;
  String? description;
  String? dateTime;

  GetSubscriptionData(
      {this.id, this.name, this.amount, this.description, this.dateTime});

  GetSubscriptionData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    amount = json['amount'];
    description = json['description'];
    dateTime = json['date_time'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['amount'] = amount;
    data['description'] = description;
    data['date_time'] = dateTime;
    return data;
  }
}
