// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:cloud_firestore/cloud_firestore.dart' as _i9;
import 'package:firebase_auth/firebase_auth.dart' as _i8;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:utils/cache.dart' as _i7;

import '../core/restaurants/application.dart' as _i11;
import '../core/restaurants/domain.dart' as _i12;
import '../core/restaurants/infrastructure.dart' as _i16;
import '../core/restaurants/src/application/get_restaurants_by_city.dart'
    as _i23;
import '../core/restaurants/src/infrastructure/api_client.dart' as _i3;
import '../core/restaurants/src/infrastructure/restaurants_mapper.dart' as _i14;
import '../core/restaurants/src/infrastructure/restaurants_repository_impl.dart'
    as _i15;
import '../core/user/application.dart' as _i5;
import '../core/user/domain.dart' as _i18;
import '../core/user/src/application/check_auth_status.dart' as _i20;
import '../core/user/src/application/create_user.dart' as _i21;
import '../core/user/src/application/get_profile_info.dart' as _i22;
import '../core/user/src/application/log_out.dart' as _i24;
import '../core/user/src/application/sign_in.dart' as _i25;
import '../core/user/src/infrastructure/auth/auth_service_impl.dart' as _i19;
import '../core/user/src/infrastructure/auth/user_firebase_provider.dart'
    as _i17;
import '../presentation/core/auth/auth_bloc.dart' as _i4;
import '../presentation/screens/auth/cubit/auth_screen_cubit.dart' as _i6;
import '../presentation/screens/home/bloc/home_screen_bloc.dart' as _i10;
import '../presentation/screens/main/main_app_cubit/main_screen_cubit.dart'
    as _i13;
import 'CacheInjectableModule.dart' as _i26;
import 'firebase_injectable_module.dart'
    as _i27; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
_i1.GetIt $initGetIt(_i1.GetIt get,
    {String? environment, _i2.EnvironmentFilter? environmentFilter}) {
  final gh = _i2.GetItHelper(get, environment, environmentFilter);
  final cacheInjectableModule = _$CacheInjectableModule();
  final firebaseInjectableModule = _$FirebaseInjectableModule();
  gh.factory<_i3.ApiClient>(() => _i3.ApiClient());
  gh.factory<_i4.AuthBloc>(
      () => _i4.AuthBloc(get<_i5.CheckAuthStatus>(), get<_i5.LogOut>()));
  gh.factory<_i6.AuthScreenCubit>(
      () => _i6.AuthScreenCubit(get<_i5.SignIn>(), get<_i5.CreateUser>()));
  gh.lazySingleton<_i7.CachePolicy>(() => cacheInjectableModule.cachePolity);
  gh.lazySingleton<_i8.FirebaseAuth>(
      () => firebaseInjectableModule.firebaseAuth);
  gh.lazySingleton<_i9.FirebaseFirestore>(
      () => firebaseInjectableModule.firebaseFirestore);
  gh.factory<_i10.HomeScreenBloc>(
      () => _i10.HomeScreenBloc(get<_i11.GetRestaurantsByCity>()));
  gh.lazySingleton<_i7.IdentifiableCollectionCache<_i12.Restaurant>>(
      () => cacheInjectableModule.identifiableCollectionCache);
  gh.factory<_i13.MainScreenCubit>(() => _i13.MainScreenCubit());
  gh.lazySingleton<_i14.RestaurantMapper>(() => _i14.RestaurantMapper());
  gh.lazySingleton<_i12.RestaurantRepository>(() =>
      _i15.RestaurantRepositoryImpl(
          get<_i16.ApiClient>(),
          get<_i16.RestaurantMapper>(),
          get<_i7.IdentifiableCollectionCache<_i12.Restaurant>>(),
          get<_i7.CachePolicy>()));
  gh.lazySingleton<_i17.UserFirebaseProvider>(
      () => _i17.UserFirebaseProvider(get<_i9.FirebaseFirestore>()));
  gh.lazySingleton<_i18.AuthService>(() => _i19.AuthServiceImpl(
      get<_i8.FirebaseAuth>(), get<_i17.UserFirebaseProvider>()));
  gh.factory<_i20.CheckAuthStatus>(
      () => _i20.CheckAuthStatus(get<_i18.AuthService>()));
  gh.factory<_i21.CreateUser>(() => _i21.CreateUser(get<_i18.AuthService>()));
  gh.factory<_i22.GetProfileInfo>(
      () => _i22.GetProfileInfo(get<_i18.AuthService>()));
  gh.factory<_i23.GetRestaurantsByCity>(
      () => _i23.GetRestaurantsByCity(get<_i12.RestaurantRepository>()));
  gh.factory<_i24.LogOut>(() => _i24.LogOut(get<_i18.AuthService>()));
  gh.factory<_i25.SignIn>(() => _i25.SignIn(get<_i18.AuthService>()));
  return get;
}

class _$CacheInjectableModule extends _i26.CacheInjectableModule {}

class _$FirebaseInjectableModule extends _i27.FirebaseInjectableModule {}
