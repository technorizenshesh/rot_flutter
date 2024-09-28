class NotificationSettingModel {
  NotificationSettingData? data;
  String? message;
  String? status;

  NotificationSettingModel({this.data, this.message, this.status});

  NotificationSettingModel.fromJson(Map<String, dynamic> json) {
    data = json['data'] != null
        ? NotificationSettingData.fromJson(json['data'])
        : null;
    message = json['message'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    data['message'] = message;
    data['status'] = status;
    return data;
  }
}

class NotificationSettingData {
  String? id;
  String? expiredProduct;
  String? searchAlerts;
  String? priceDrop;
  String? favoritesSold;
  String? favoritesReserved;
  String? newProducts;
  String? tripSuggestion;
  String? promotion;
  String? dateTime;
  String? userId;

  NotificationSettingData(
      {this.id,
      this.expiredProduct,
      this.searchAlerts,
      this.priceDrop,
      this.favoritesSold,
      this.favoritesReserved,
      this.newProducts,
      this.tripSuggestion,
      this.promotion,
      this.dateTime,
      this.userId});

  NotificationSettingData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    expiredProduct = json['expired_product'];
    searchAlerts = json['search_alerts'];
    priceDrop = json['price_drop'];
    favoritesSold = json['favorites_sold'];
    favoritesReserved = json['favorites_reserved'];
    newProducts = json['new_products'];
    tripSuggestion = json['trip_suggestion'];
    promotion = json['promotion'];
    dateTime = json['date_time'];
    userId = json['user_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['expired_product'] = expiredProduct;
    data['search_alerts'] = searchAlerts;
    data['price_drop'] = priceDrop;
    data['favorites_sold'] = favoritesSold;
    data['favorites_reserved'] = favoritesReserved;
    data['new_products'] = newProducts;
    data['trip_suggestion'] = tripSuggestion;
    data['promotion'] = promotion;
    data['date_time'] = dateTime;
    data['user_id'] = userId;
    return data;
  }
}
