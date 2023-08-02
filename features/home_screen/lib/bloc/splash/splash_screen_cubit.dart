import 'package:common/state/view_data_state.dart';
import 'package:dependencies/bloc/bloc.dart';
import 'package:home_screen/bloc/splash/splash_screen_state.dart';

class SplashScreenCubit extends Cubit<SplashScreenState> {
  SplashScreenCubit()
      : super(
          SplashScreenState(
            stateSplahScreen: ViewData.initial(),
          ),
        );

  timerSplash() async {
    emit(
      SplashScreenState(
        stateSplahScreen: ViewData.loading(),
      ),
    );
    await Future.delayed(
      const Duration(
        seconds: 2,
      ),
    );
    emit(
      SplashScreenState(
        stateSplahScreen: ViewData.loaded(),
      ),
    );
  }
}
