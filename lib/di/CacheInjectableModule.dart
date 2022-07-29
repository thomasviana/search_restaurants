import 'package:injectable/injectable.dart';
import 'package:search_restaurants/core/restaurants/domain.dart';
import 'package:utils/cache.dart';

@module
abstract class CacheInjectableModule {
  @lazySingleton
  IdentifiableCollectionCache<Restaurant> get identifiableCollectionCache =>
      IdentifiableCollectionCache<Restaurant>();
  @lazySingleton
  CachePolicy get cachePolity => CachePolicy();
}
