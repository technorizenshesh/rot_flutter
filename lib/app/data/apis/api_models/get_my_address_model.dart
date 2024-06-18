class MyAddressModel {
  List<MyAddressData>? data;
  String? message;
  String? status;

  MyAddressModel({this.data, this.message, this.status});

  MyAddressModel.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <MyAddressData>[];
      json['data'].forEach((v) {
        data!.add(MyAddressData.fromJson(v));
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

class MyAddressData {
  String? id;
  String? userId;
  String? country;
  String? countryCode;
  String? zipcode;
  String? state;
  String? city;
  String? street;
  String? number;
  String? floor;
  String? door;
  String? lat;
  String? lon;
  String? dateTime;
  String? userName;
  String? image;

  MyAddressData(
      {this.id,
      this.userId,
      this.country,
      this.countryCode,
      this.zipcode,
      this.state,
      this.city,
      this.street,
      this.number,
      this.floor,
      this.door,
      this.lat,
      this.lon,
      this.dateTime,
      this.userName,
      this.image});

  MyAddressData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    country = json['country'];
    countryCode = json['country_code'];
    zipcode = json['zipcode'];
    state = json['state'];
    city = json['city'];
    street = json['street'];
    number = json['number'];
    floor = json['floor'];
    door = json['door'];
    lat = json['lat'];
    lon = json['lon'];
    dateTime = json['date_time'];
    userName = json['user_name'];
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['user_id'] = userId;
    data['country'] = country;
    data['country_code'] = countryCode;
    data['zipcode'] = zipcode;
    data['state'] = state;
    data['city'] = city;
    data['street'] = street;
    data['number'] = number;
    data['floor'] = floor;
    data['door'] = door;
    data['lat'] = lat;
    data['lon'] = lon;
    data['date_time'] = dateTime;
    data['user_name'] = userName;
    data['image'] = image;
    return data;
  }
}
