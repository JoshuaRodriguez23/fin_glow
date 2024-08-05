import 'package:json_annotation/json_annotation.dart';

part 'store_model.g.dart';

@JsonSerializable()
class StoreViewData {
  final String title;
  final List<Promotion> promotions;
  final List<String> navbarOptions;
  final String promotionsTitle;

  StoreViewData({
    required this.title,
    required this.promotions,
    required this.navbarOptions,
    required this.promotionsTitle,
  });

  factory StoreViewData.fromJson(Map<String, dynamic> json) =>
      _$StoreViewDataFromJson(json);
  Map<String, dynamic> toJson() => _$StoreViewDataToJson(this);
}

@JsonSerializable()
class Promotion {
  final String image;
  final String route;

  Promotion({
    required this.image,
    required this.route,
  });

  factory Promotion.fromJson(Map<String, dynamic> json) =>
      _$PromotionFromJson(json);
  Map<String, dynamic> toJson() => _$PromotionToJson(this);
}
