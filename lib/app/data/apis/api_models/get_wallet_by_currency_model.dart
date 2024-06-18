class GetWalletByCurrencyModel {
  GetWalletByCurrencyData? data;
  String? message;
  String? status;

  GetWalletByCurrencyModel({this.data, this.message, this.status});

  GetWalletByCurrencyModel.fromJson(Map<String, dynamic> json) {
    data = json['data'] != null
        ? GetWalletByCurrencyData.fromJson(json['data'])
        : null;
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

class GetWalletByCurrencyData {
  String? id;
  String? userId;
  String? name;
  String? amount;
  String? dateTime;

  GetWalletByCurrencyData(
      {this.id, this.userId, this.name, this.amount, this.dateTime});

  GetWalletByCurrencyData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    name = json['name'];
    amount = json['amount'];
    dateTime = json['date_time'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['user_id'] = userId;
    data['name'] = name;
    data['amount'] = amount;
    data['date_time'] = dateTime;
    return data;
  }
}
