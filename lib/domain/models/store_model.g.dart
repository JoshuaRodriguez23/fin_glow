// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'store_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

StoreViewData _$StoreViewDataFromJson(Map<String, dynamic> json) =>
    StoreViewData(
      title: json['title'] as String,
      promotions: (json['promotions'] as List<dynamic>)
          .map((e) => Promotion.fromJson(e as Map<String, dynamic>))
          .toList(),
      navbarOptions: (json['navbarOptions'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      promotionsTitle: json['promotionsTitle'] as String,
    );

Map<String, dynamic> _$StoreViewDataToJson(StoreViewData instance) =>
    <String, dynamic>{
      'title': instance.title,
      'promotions': instance.promotions,
      'navbarOptions': instance.navbarOptions,
      'promotionsTitle': instance.promotionsTitle,
    };

Promotion _$PromotionFromJson(Map<String, dynamic> json) => Promotion(
      image: json['image'] as String,
      route: json['route'] as String,
    );

Map<String, dynamic> _$PromotionToJson(Promotion instance) => <String, dynamic>{
      'image': instance.image,
      'route': instance.route,
    };
