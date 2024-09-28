class CollaboratorsInvitedModel {
  List<CollaboratorsInvitedData>? data;
  String? message;
  String? status;

  CollaboratorsInvitedModel({this.data, this.message, this.status});

  CollaboratorsInvitedModel.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <CollaboratorsInvitedData>[];
      json['data'].forEach((v) {
        data!.add(CollaboratorsInvitedData.fromJson(v));
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

class CollaboratorsInvitedData {
  String? id;
  String? userId;
  String? email;
  String? role;
  String? permission;
  String? dateTime;
  String? status;
  String? inviteDate;
  List<CollaboratorsPermission>? collaboratorsPermission;

  CollaboratorsInvitedData(
      {this.id,
      this.userId,
      this.email,
      this.role,
      this.permission,
      this.dateTime,
      this.status,
      this.inviteDate,
      this.collaboratorsPermission});

  CollaboratorsInvitedData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    email = json['email'];
    role = json['role'];
    permission = json['permission'];
    dateTime = json['date_time'];
    status = json['status'];
    inviteDate = json['collaborators_invite_date'];
    if (json['collaborators_permission'] != null) {
      collaboratorsPermission = <CollaboratorsPermission>[];
      json['collaborators_permission'].forEach((v) {
        collaboratorsPermission!.add(CollaboratorsPermission.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['user_id'] = userId;
    data['email'] = email;
    data['role'] = role;
    data['permission'] = permission;
    data['date_time'] = dateTime;
    if (collaboratorsPermission != null) {
      data['collaborators_permission'] =
          collaboratorsPermission!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class CollaboratorsPermission {
  String? id;
  String? type;
  String? permission;
  String? dateTime;

  CollaboratorsPermission({this.id, this.type, this.permission, this.dateTime});

  CollaboratorsPermission.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    type = json['type'];
    permission = json['permission'];
    dateTime = json['date_time'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['type'] = type;
    data['permission'] = permission;
    data['date_time'] = dateTime;
    return data;
  }
}
