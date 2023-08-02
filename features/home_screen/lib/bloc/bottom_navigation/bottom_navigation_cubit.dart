import 'package:common/state/view_data_state.dart';
import 'package:dependencies/bloc/bloc.dart';
import 'package:home_screen/bloc/bottom_navigation/bottom_navigation_state.dart';

class BottomNavigationCubit extends Cubit<BottomNavigationState> {
  BottomNavigationCubit()
      : super(
          BottomNavigationState(
            stateBottomNavigation: ViewData.loaded(data: 0),
          ),
        );

  void currentIndex(int index) {
    emit(
      BottomNavigationState(
        stateBottomNavigation: ViewData.loaded(
          data: index,
        ),
      ),
    );
  }
}
