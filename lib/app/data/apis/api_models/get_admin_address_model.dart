class AdminAddressModel {
  List<AdminAddressData>? data;
  String? message;
  String? status;

  AdminAddressModel({this.data, this.message, this.status});

  AdminAddressModel.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <AdminAddressData>[];
      json['data'].forEach((v) {
        data!.add(AdminAddressData.fromJson(v));
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

class AdminAddressData {
  String? id;
  String? location;
  String? state;
  String? lat;
  String? lon;
  String? dateTime;
  String? city;
  String? createdAt;
  String? updatedAt;
  String? deletedAt;
  String? country;
  String? zipCode;

  AdminAddressData(
      {this.id,
      this.location,
      this.state,
      this.lat,
      this.lon,
      this.dateTime,
      this.city,
      this.createdAt,
      this.updatedAt,
      this.deletedAt,
      this.country,
      this.zipCode});

  AdminAddressData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    location = json['location'];
    state = json['state'];
    lat = json['lat'];
    lon = json['lon'];
    dateTime = json['date_time'];
    city = json['city'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    deletedAt = json['deleted_at'];
    country = json['country'];
    zipCode = json['zip_code'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['location'] = location;
    data['state'] = state;
    data['lat'] = lat;
    data['lon'] = lon;
    data['date_time'] = dateTime;
    data['city'] = city;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    data['deleted_at'] = deletedAt;
    data['country'] = country;
    data['zip_code'] = zipCode;
    return data;
  }
}
