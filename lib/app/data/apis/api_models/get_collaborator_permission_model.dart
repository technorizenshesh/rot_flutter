class CollaboratorPermissionModel {
  List<CollaboratorPermissionData>? data;
  String? message;
  String? status;

  CollaboratorPermissionModel({this.data, this.message, this.status});

  CollaboratorPermissionModel.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <CollaboratorPermissionData>[];
      json['data'].forEach((v) {
        data!.add(CollaboratorPermissionData.fromJson(v));
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

class CollaboratorPermissionData {
  String? id;
  String? type;
  String? permission;
  String? dateTime;
  bool? status = false;

  CollaboratorPermissionData(
      {this.id, this.type, this.permission, this.dateTime, this.status});

  CollaboratorPermissionData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    type = json['type'];
    permission = json['permission'];
    dateTime = json['date_time'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['type'] = type;
    data['permission'] = permission;
    data['date_time'] = dateTime;
    data['status'] = status;
    return data;
  }
}
