class GetStateModel {
  List<GetStateData>? data;
  String? message;
  String? status;

  GetStateModel({this.data, this.message, this.status});

  GetStateModel.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <GetStateData>[];
      json['data'].forEach((v) {
        data!.add(GetStateData.fromJson(v));
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

class GetStateData {
  String? id;
  String? name;
  String? countryId;

  GetStateData({this.id, this.name, this.countryId});

  GetStateData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    countryId = json['country_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['country_id'] = countryId;
    return data;
  }
}
