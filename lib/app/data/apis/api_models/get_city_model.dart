class GetCityModel {
  List<CityData>? data;
  String? message;
  String? status;

  GetCityModel({this.data, this.message, this.status});

  GetCityModel.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <CityData>[];
      json['data'].forEach((v) {
        data!.add(CityData.fromJson(v));
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

class CityData {
  String? id;
  String? name;
  String? stateId;
  String? countryId;
  String? status;

  CityData({this.id, this.name, this.stateId, this.countryId, this.status});

  CityData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    stateId = json['state_id'];
    countryId = json['country_id'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['state_id'] = stateId;
    data['country_id'] = countryId;
    data['status'] = status;
    return data;
  }
}
