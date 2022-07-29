import 'restaurant.dart';

abstract class RestaurantRepository {
  Future<List<Restaurant>> findByCity(String city);
}
