class DeleteAccountModel {
  String? status;
  String? messages;
  String? data;

  DeleteAccountModel({this.status, this.messages, this.data});

  DeleteAccountModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    messages = json['messages'];
    data = json['data'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    data['messages'] = messages;
    data['data'] = this.data;
    return data;
  }
}
