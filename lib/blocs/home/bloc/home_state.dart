part of 'home_bloc.dart';

class HomeState {
  final Color imageBorderColor;

  const HomeState(this.imageBorderColor);
}

class HomeInitial extends HomeState {
  const HomeInitial() : super(Colors.white);
}
