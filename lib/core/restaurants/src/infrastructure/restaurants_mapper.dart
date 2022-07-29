import 'package:injectable/injectable.dart';
import 'package:search_restaurants/core/restaurants/domain.dart';
import 'package:utils/utils.dart';

@lazySingleton
class RestaurantMapper with JsonMapper<Restaurant> {
  const RestaurantMapper();

  @override
  Restaurant fromJson(Map jsonObj) {
    final RestaurantId id = RestaurantId(jsonObj['id'].toString());
    final String name = jsonObj['name'] ?? '';
    final String reviewCount = (jsonObj['review_count'] ?? '').toString();
    final String city = (jsonObj['location'] ?? {})['city'] ?? '';
    final Uri? imageUrl = Uri.tryParse(jsonObj['image_url']);

    return Restaurant(
      id: id,
      name: name,
      reviewCount: reviewCount,
      city: city,
      imageUrl: imageUrl,
    );
  }

  @override
  Map toJson(t) {
    return {
      'id': t.id.value,
      'name': t.name,
      'reviewCount': t.reviewCount,
      'city': t.city,
      'imageUrl': t.imageUrl,
    };
  }
}
