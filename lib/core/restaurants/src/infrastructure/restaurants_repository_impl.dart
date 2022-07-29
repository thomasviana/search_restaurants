import 'package:injectable/injectable.dart';
import 'package:search_restaurants/core/restaurants/domain.dart';
import 'package:search_restaurants/core/restaurants/infrastructure.dart';
import 'package:utils/cache.dart';

@injectable
typedef RestaurantCache = IdentifiableCollectionCache<Restaurant>;

@LazySingleton(as: RestaurantRepository)
class RestaurantRepositoryImpl implements RestaurantRepository {
  const RestaurantRepositoryImpl(
    this.apiClient,
    this.mapper,
    this.cache,
    this.cachePolicy,
  );

  final ApiClient apiClient;
  final RestaurantMapper mapper;
  final RestaurantCache cache;
  final CachePolicy cachePolicy;

  Future<void> _refresh(city) async {
    await apiClient
        .getRestaurants(city)
        .then((value) => mapper.fromJsonArray(value))
        .then((value) => cache.replaceAllObjects(value))
        .then((_) => cachePolicy.validate())
        .catchError((error, _) => cachePolicy.invalidate());
  }

  @override
  Future<List<Restaurant>> findByCity(String city) {
    return _refresh(city).then((_) => cache.values.first).then(
          (restaurants) => restaurants
              .where((restaurant) => restaurant.city == city)
              .toList(),
        );
  }
}
