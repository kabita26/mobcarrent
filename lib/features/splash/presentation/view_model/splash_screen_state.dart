part of 'splash_screen_cubit.dart';

class SplashScreenState extends Equatable {
  final int pageIndex; // Current page index

  // Constructor to set page index
  const SplashScreenState(this.pageIndex);

  @override
  List<Object> get props => [pageIndex];
}
