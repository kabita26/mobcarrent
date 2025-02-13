import 'package:bloc/bloc.dart';
import 'package:car_rent/features/auth/presentation/view_model/login/login_bloc.dart';
import 'package:equatable/equatable.dart';

// Define the state
part 'splash_screen_state.dart';

// Cubit to manage the splash screen state
class SplashScreenCubit extends Cubit<SplashScreenState> {
  // Initializing the page index to 0 (first page)
  SplashScreenCubit(LoginBloc loginBloc) : super(SplashScreenState(0));

  // Method to go to the next page
  void goToNextPage() {
    // Update the page index. When the page index reaches 3 (last page), reset to 0.
    if (state.pageIndex < 2) {
      emit(SplashScreenState(state.pageIndex + 1));
    } else {
      // Optionally, navigate to the login page or any other action after the last page
      // You can use Navigator to go to another screen, for example:
      // Navigator.pushReplacementNamed(context, '/login');
      emit(SplashScreenState(0)); // Reset to first page if you want looping
    }
  }
}
