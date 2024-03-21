class ResponseModel {
  int? status;
  String? messages;

  ResponseModel({this.status, this.messages});

  ResponseModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    messages = json['messages'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    data['messages'] = messages;
    return data;
  }
}
