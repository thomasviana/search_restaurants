import 'package:injectable/injectable.dart';
import 'package:search_restaurants/core/restaurants/domain.dart';

@injectable
class GetRestaurantsByCity {
  final RestaurantRepository _restaurantRepository;

  const GetRestaurantsByCity(this._restaurantRepository);

  Future<List<Restaurant>> call(city) => _restaurantRepository.findByCity(city);
}
