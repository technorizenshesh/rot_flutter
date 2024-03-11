class GetCountryModel {
  List<CountryData>? data;
  String? message;
  String? status;

  GetCountryModel({this.data, this.message, this.status});

  GetCountryModel.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <CountryData>[];
      json['data'].forEach((v) {
        data!.add(CountryData.fromJson(v));
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

class CountryData {
  String? id;
  String? sortname;
  String? name;
  String? currencyCode;
  String? currencyName;
  String? phoneCode;
  String? capital;
  String? flag;
  String? status;

  CountryData(
      {this.id,
      this.sortname,
      this.name,
      this.currencyCode,
      this.currencyName,
      this.phoneCode,
      this.capital,
      this.flag,
      this.status});

  CountryData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    sortname = json['sortname'];
    name = json['name'];
    currencyCode = json['currency_code'];
    currencyName = json['currency_name'];
    phoneCode = json['phone_code'];
    capital = json['capital'];
    flag = json['flag'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['sortname'] = sortname;
    data['name'] = name;
    data['currency_code'] = currencyCode;
    data['currency_name'] = currencyName;
    data['phone_code'] = phoneCode;
    data['capital'] = capital;
    data['flag'] = flag;
    data['status'] = status;
    return data;
  }
}
