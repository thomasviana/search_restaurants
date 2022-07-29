part of 'home_screen_bloc.dart';

abstract class HomeScreenEvent extends Equatable {
  const HomeScreenEvent();

  @override
  List<Object> get props => [];
}

class QueryChanged extends HomeScreenEvent {
  final String query;

  const QueryChanged(this.query);
}

class RestaurantsRequested extends HomeScreenEvent {}
