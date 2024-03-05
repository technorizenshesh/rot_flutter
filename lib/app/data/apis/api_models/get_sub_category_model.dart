class GetSubCategoryModel {
  List<Data>? data;
  String? message;
  String? status;

  GetSubCategoryModel({this.data, this.message, this.status});

  GetSubCategoryModel.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(Data.fromJson(v));
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

class Data {
  String? id;
  String? categoryId;
  String? subCatName;
  String? dateTime;

  Data({this.id, this.categoryId, this.subCatName, this.dateTime});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    categoryId = json['category_id'];
    subCatName = json['sub_cat_name'];
    dateTime = json['date_time'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['category_id'] = categoryId;
    data['sub_cat_name'] = subCatName;
    data['date_time'] = dateTime;
    return data;
  }
}
