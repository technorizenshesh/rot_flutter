class GetCurrencyModel {
  List<CurrencyData>? data;
  String? message;
  String? status;

  GetCurrencyModel({this.data, this.message, this.status});

  GetCurrencyModel.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <CurrencyData>[];
      json['data'].forEach((v) {
        data!.add(CurrencyData.fromJson(v));
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

class CurrencyData {
  String? id;
  String? currencyName;
  String? currencySymbols;
  String? dateTime;

  CurrencyData(
      {this.id, this.currencyName, this.currencySymbols, this.dateTime});

  CurrencyData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    currencyName = json['currency_name'];
    currencySymbols = json['currency_symbols'];
    dateTime = json['date_time'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['currency_name'] = currencyName;
    data['currency_symbols'] = currencySymbols;
    data['date_time'] = dateTime;
    return data;
  }
}
