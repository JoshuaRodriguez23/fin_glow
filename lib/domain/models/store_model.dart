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

  factory StoreViewData.fromJson(Map<String, dynamic> json) {
    var promotionsList = json['promotions'] as List;
    List<Promotion> promotionsData =
        promotionsList.map((i) => Promotion.fromJson(i)).toList();

    var navbarOptionsList = json['navbarOptions'] as List;
    List<String> navbarOptionsData =
        navbarOptionsList.map((i) => i.toString()).toList();

    return StoreViewData(
      title: json['title'],
      promotions: promotionsData,
      navbarOptions: navbarOptionsData,
      promotionsTitle: json['promotionsTitle'],
    );
  }
}

class Promotion {
  final String image;
  final String route;

  Promotion({
    required this.image,
    required this.route,
  });

  factory Promotion.fromJson(Map<String, dynamic> json) {
    return Promotion(
      image: json['image'],
      route: json['route'],
    );
  }
}
