class GetWalletListModel {
  List<GetWalletListData>? data;
  String? message;
  String? status;

  GetWalletListModel({this.data, this.message, this.status});

  GetWalletListModel.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <GetWalletListData>[];
      json['data'].forEach((v) {
        data!.add(GetWalletListData.fromJson(v));
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

class GetWalletListData {
  String? id;
  String? name;
  String? amount;
  String? dateTime;
  String? userId;

  GetWalletListData(
      {this.id, this.name, this.amount, this.dateTime, this.userId});

  GetWalletListData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    amount = json['amount'];
    dateTime = json['date_time'];
    userId = json['user_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['amount'] = amount;
    data['date_time'] = dateTime;
    data['user_id'] = userId;
    return data;
  }
}
