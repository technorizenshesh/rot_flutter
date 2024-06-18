class GetPlacesByZipcodeModel {
  String? postCode;
  String? country;
  String? countryAbbreviation;
  List<Places>? places;

  GetPlacesByZipcodeModel(
      {this.postCode, this.country, this.countryAbbreviation, this.places});

  GetPlacesByZipcodeModel.fromJson(Map<String, dynamic> json) {
    postCode = json['post code'];
    country = json['country'];
    countryAbbreviation = json['country abbreviation'];
    if (json['places'] != null) {
      places = <Places>[];
      json['places'].forEach((v) {
        places!.add(Places.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['post code'] = postCode;
    data['country'] = country;
    data['country abbreviation'] = countryAbbreviation;
    if (places != null) {
      data['places'] = places!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Places {
  String? placeName;
  String? longitude;
  String? state;
  String? stateAbbreviation;
  String? latitude;

  Places(
      {this.placeName,
      this.longitude,
      this.state,
      this.stateAbbreviation,
      this.latitude});

  Places.fromJson(Map<String, dynamic> json) {
    placeName = json['place name'];
    longitude = json['longitude'];
    state = json['state'];
    stateAbbreviation = json['state abbreviation'];
    latitude = json['latitude'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['place name'] = placeName;
    data['longitude'] = longitude;
    data['state'] = state;
    data['state abbreviation'] = stateAbbreviation;
    data['latitude'] = latitude;
    return data;
  }
}
