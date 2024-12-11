class ColorModel {
  List<ColorData>? data;
  String? message;
  String? status;

  ColorModel({this.data, this.message, this.status});

  ColorModel.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <ColorData>[];
      json['data'].forEach((v) {
        data!.add(ColorData.fromJson(v));
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

class ColorData {
  String? id;
  String? name;
  String? dateTime;

  ColorData({this.id, this.name, this.dateTime});

  ColorData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    dateTime = json['date_time'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['date_time'] = dateTime;
    return data;
  }
}
