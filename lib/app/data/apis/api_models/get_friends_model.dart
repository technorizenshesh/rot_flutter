class GetFriendsModel {
  List<GetFriendsData>? data;
  String? message;
  String? status;

  GetFriendsModel({this.data, this.message, this.status});

  GetFriendsModel.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <GetFriendsData>[];
      json['data'].forEach((v) {
        data!.add(GetFriendsData.fromJson(v));
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

class GetFriendsData {
  String? id;
  String? userId;
  String? fullName;
  String? email;
  String? phone;
  String? dateTime;
  String? status;

  GetFriendsData(
      {this.id,
      this.userId,
      this.fullName,
      this.email,
      this.phone,
      this.dateTime,
      this.status});

  GetFriendsData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    fullName = json['full_name'];
    email = json['email'];
    phone = json['phone'];
    dateTime = json['date_time'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['user_id'] = userId;
    data['full_name'] = fullName;
    data['email'] = email;
    data['phone'] = phone;
    data['date_time'] = dateTime;
    data['status'] = status;
    return data;
  }
}
