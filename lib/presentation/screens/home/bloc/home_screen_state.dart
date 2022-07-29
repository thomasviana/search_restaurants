part of 'home_screen_bloc.dart';

class HomeScreenState extends MyState {
  final List<Restaurant> restaurants;
  final String query;

  HomeScreenState({
    Status status = Status.initial,
    this.restaurants = const [],
    this.query = '',
  }) : super(status: status);

  HomeScreenState asLoadingState() => copyWith(status: Status.loading);

  HomeScreenState copyWith({
    Status? status,
    List<Restaurant>? restaurants,
    String? query,
  }) {
    return HomeScreenState(
      status: status ?? this.status,
      restaurants: restaurants ?? this.restaurants,
      query: query ?? this.query,
    );
  }
}
