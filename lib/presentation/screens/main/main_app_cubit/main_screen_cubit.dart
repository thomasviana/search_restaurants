import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';

part 'main_screen_state.dart';

@injectable
class MainScreenCubit extends Cubit<MainScreenState> {
  MainScreenCubit() : super(MainScreenState.initial());

  void onSelectedPageIndexChanged(int index) {
    emit(
      state.copyWith(
        homeSelected: false,
        searchHistorySelected: false,
      ),
    );
    emit(state.copyWith(selectedPageIndex: index));
    switch (index) {
      case 0:
        emit(state.copyWith(homeSelected: true));
        break;
      case 1:
        emit(state.copyWith(searchHistorySelected: true));
        break;

      default:
    }
  }
}
