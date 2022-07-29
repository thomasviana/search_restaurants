import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';
import 'package:search_restaurants/core/restaurants/application.dart';
import 'package:search_restaurants/core/restaurants/domain.dart';
import 'package:search_restaurants/presentation/utils/observer.dart';
import 'package:search_restaurants/presentation/utils/status.dart';

part 'home_screen_event.dart';
part 'home_screen_state.dart';

@injectable
class HomeScreenBloc extends Bloc<HomeScreenEvent, HomeScreenState> {
  final GetRestaurantsByCity _getRestaurantsByCity;
  String _lastQuery = '';

  HomeScreenBloc(
    this._getRestaurantsByCity,
  ) : super(HomeScreenState()) {
    on<QueryChanged>(_onQueryChanged);
    on<RestaurantsRequested>(_onRestaurantsRequested);
  }

  FutureOr<void> _onQueryChanged(
    QueryChanged event,
    Emitter emit,
  ) async {
    emit(state.copyWith(query: event.query));
  }

  FutureOr<void> _onRestaurantsRequested(
    RestaurantsRequested event,
    Emitter emit,
  ) async {
    _lastQuery = state.query;
    print('ss: $_lastQuery');
    final result = await _getRestaurantsByCity(_lastQuery);
    emit(state.copyWith(
      restaurants: result,
      status: Status.success,
    ));
  }
}
