part of 'main_screen_cubit.dart';

class MainScreenState {
  final int? selectedPageIndex;
  final bool homeSelected;
  final bool searchHistorySelected;
  MainScreenState({
    this.selectedPageIndex,
    required this.homeSelected,
    required this.searchHistorySelected,
  });

  factory MainScreenState.initial() => MainScreenState(
        homeSelected: true,
        searchHistorySelected: false,
      );

  MainScreenState copyWith({
    int? selectedPageIndex,
    bool? homeSelected,
    bool? searchHistorySelected,
  }) {
    return MainScreenState(
      selectedPageIndex: selectedPageIndex ?? this.selectedPageIndex,
      homeSelected: homeSelected ?? this.homeSelected,
      searchHistorySelected:
          searchHistorySelected ?? this.searchHistorySelected,
    );
  }
}
