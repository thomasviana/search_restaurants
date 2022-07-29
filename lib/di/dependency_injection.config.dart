// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:cloud_firestore/cloud_firestore.dart' as _i7;
import 'package:firebase_auth/firebase_auth.dart' as _i6;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../core/user/application.dart' as _i4;
import '../core/user/domain.dart' as _i10;
import '../core/user/src/application/check_auth_status.dart' as _i12;
import '../core/user/src/application/create_user.dart' as _i13;
import '../core/user/src/application/get_profile_info.dart' as _i14;
import '../core/user/src/application/log_out.dart' as _i15;
import '../core/user/src/application/sign_in.dart' as _i16;
import '../core/user/src/infrastructure/auth/auth_service_impl.dart' as _i11;
import '../core/user/src/infrastructure/auth/user_firebase_provider.dart'
    as _i9;
import '../presentation/core/auth/auth_bloc.dart' as _i3;
import '../presentation/screens/auth/cubit/auth_screen_cubit.dart' as _i5;
import '../presentation/screens/main/main_app_cubit/main_screen_cubit.dart'
    as _i8;
import 'firebase_injectable_module.dart'
    as _i17; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
_i1.GetIt $initGetIt(_i1.GetIt get,
    {String? environment, _i2.EnvironmentFilter? environmentFilter}) {
  final gh = _i2.GetItHelper(get, environment, environmentFilter);
  final firebaseInjectableModule = _$FirebaseInjectableModule();
  gh.factory<_i3.AuthBloc>(
      () => _i3.AuthBloc(get<_i4.CheckAuthStatus>(), get<_i4.LogOut>()));
  gh.factory<_i5.AuthScreenCubit>(
      () => _i5.AuthScreenCubit(get<_i4.SignIn>(), get<_i4.CreateUser>()));
  gh.lazySingleton<_i6.FirebaseAuth>(
      () => firebaseInjectableModule.firebaseAuth);
  gh.lazySingleton<_i7.FirebaseFirestore>(
      () => firebaseInjectableModule.firebaseFirestore);
  gh.factory<_i8.MainScreenCubit>(() => _i8.MainScreenCubit());
  gh.lazySingleton<_i9.UserFirebaseProvider>(
      () => _i9.UserFirebaseProvider(get<_i7.FirebaseFirestore>()));
  gh.lazySingleton<_i10.AuthService>(() => _i11.AuthServiceImpl(
      get<_i6.FirebaseAuth>(), get<_i9.UserFirebaseProvider>()));
  gh.factory<_i12.CheckAuthStatus>(
      () => _i12.CheckAuthStatus(get<_i10.AuthService>()));
  gh.factory<_i13.CreateUser>(() => _i13.CreateUser(get<_i10.AuthService>()));
  gh.factory<_i14.GetProfileInfo>(
      () => _i14.GetProfileInfo(get<_i10.AuthService>()));
  gh.factory<_i15.LogOut>(() => _i15.LogOut(get<_i10.AuthService>()));
  gh.factory<_i16.SignIn>(() => _i16.SignIn(get<_i10.AuthService>()));
  return get;
}

class _$FirebaseInjectableModule extends _i17.FirebaseInjectableModule {}
