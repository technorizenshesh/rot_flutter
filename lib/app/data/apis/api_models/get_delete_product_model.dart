class DeleteProductModel {
  String? data;
  String? message;
  String? status;

  DeleteProductModel({this.data, this.message, this.status});

  DeleteProductModel.fromJson(Map<String, dynamic> json) {
    data = json['data'];
    message = json['message'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['data'] = this.data;
    data['message'] = message;
    data['status'] = status;
    return data;
  }
}
