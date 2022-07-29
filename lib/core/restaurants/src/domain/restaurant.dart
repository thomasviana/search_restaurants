import 'package:utils/ddd.dart';

class Restaurant extends Entity<RestaurantId> {
  final String name;
  final String reviewCount;
  final String city;
  final Uri? imageUrl;

  Restaurant({
    required RestaurantId id,
    required this.name,
    required this.reviewCount,
    required this.city,
    this.imageUrl,
  }) : super(id);
}

class RestaurantId extends EntityId {
  RestaurantId(String value) : super(value);
}
