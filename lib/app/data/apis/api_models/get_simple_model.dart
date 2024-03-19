class SimpleResponseModel {
  int? status;
  String? messages;

  SimpleResponseModel({this.status, this.messages});

  SimpleResponseModel.fromJson(Map<String, dynamic> json) {
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
