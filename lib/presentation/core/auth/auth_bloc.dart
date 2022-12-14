import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../../core/user/application.dart';
import '../../../core/user/domain.dart';

part 'auth_event.dart';
part 'auth_state.dart';

@injectable
class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final CheckAuthStatus _checkAuthStatus;
  final LogOut _logOut;

  AuthBloc(
    this._checkAuthStatus,
    this._logOut,
  ) : super(const AuthState.unauthenticated()) {
    on<AuthStatusRequested>(_onCheckAuthStatus);
    on<LogoutRequested>(_onLogoutRequested);
  }

  Future<void> _onCheckAuthStatus(
    AuthStatusRequested event,
    Emitter<AuthState> emit,
  ) async {
    await emit.onEach<Option<UserEntity>>(
      _checkAuthStatus(),
      onData: (user) => user.fold(
        () => emit(const AuthState.unauthenticated()),
        (user) => emit(const AuthState.authenticated()),
      ),
    );
  }

  void _onLogoutRequested(LogoutRequested event, Emitter<AuthState> emit) {
    unawaited(_logOut());
  }
}
