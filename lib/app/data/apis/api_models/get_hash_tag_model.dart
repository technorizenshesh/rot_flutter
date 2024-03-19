class GetHashTagModel {
  List<GetHashTagData>? data;
  String? message;
  String? status;

  GetHashTagModel({this.data, this.message, this.status});

  GetHashTagModel.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <GetHashTagData>[];
      json['data'].forEach((v) {
        data!.add(GetHashTagData.fromJson(v));
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

class GetHashTagData {
  String? id;
  String? hashTagName;
  String? status;

  GetHashTagData({this.id, this.hashTagName, this.status});

  GetHashTagData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    hashTagName = json['hash_tag_name'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['hash_tag_name'] = hashTagName;
    data['status'] = status;
    return data;
  }
}
