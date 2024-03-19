class ReviewModel {
  List<ReviewData>? data;
  String? message;
  String? status;

  ReviewModel({this.data, this.message, this.status});

  ReviewModel.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <ReviewData>[];
      json['data'].forEach((v) {
        data!.add(ReviewData.fromJson(v));
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

class ReviewData {
  String? id;
  String? userId;
  String? review;
  String? rating;
  String? dateTime;
  String? userName;
  String? image;

  ReviewData(
      {this.id,
      this.userId,
      this.review,
      this.rating,
      this.dateTime,
      this.userName,
      this.image});

  ReviewData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    review = json['review'];
    rating = json['rating'];
    dateTime = json['date_time'];
    userName = json['user_name'];
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['user_id'] = userId;
    data['review'] = review;
    data['rating'] = rating;
    data['date_time'] = dateTime;
    data['user_name'] = userName;
    data['image'] = image;
    return data;
  }
}
