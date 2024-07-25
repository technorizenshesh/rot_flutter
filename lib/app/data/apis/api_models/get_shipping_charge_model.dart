class GetShippingChargeModel {
  List<GetShippingChargeData>? data;
  String? message;
  String? status;

  GetShippingChargeModel({this.data, this.message, this.status});

  GetShippingChargeModel.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <GetShippingChargeData>[];
      json['data'].forEach((v) {
        data!.add(GetShippingChargeData.fromJson(v));
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

class GetShippingChargeData {
  String? id;
  String? countryName;
  String? isoCode;
  String? expressPlus;
  String? express;
  String? expressSaver;
  String? standard;
  String? expedited;
  String? expressFreight;
  String? expressFreightMidday;
  String? dateTime;
  String? companyName;

  GetShippingChargeData(
      {this.id,
      this.countryName,
      this.isoCode,
      this.expressPlus,
      this.express,
      this.expressSaver,
      this.standard,
      this.expedited,
      this.expressFreight,
      this.expressFreightMidday,
      this.dateTime,
      this.companyName});

  GetShippingChargeData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    countryName = json['country_name'];
    isoCode = json['iso_code'];
    expressPlus = json['express_plus'];
    express = json['express'];
    expressSaver = json['express_saver'];
    standard = json['standard'];
    expedited = json['expedited'];
    expressFreight = json['express_freight'];
    expressFreightMidday = json['express_freight_midday'];
    dateTime = json['date_time'];
    companyName = json['company_name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['country_name'] = countryName;
    data['iso_code'] = isoCode;
    data['express_plus'] = expressPlus;
    data['express'] = express;
    data['express_saver'] = expressSaver;
    data['standard'] = standard;
    data['expedited'] = expedited;
    data['express_freight'] = expressFreight;
    data['express_freight_midday'] = expressFreightMidday;
    data['date_time'] = dateTime;
    data['company_name'] = companyName;
    return data;
  }
}
