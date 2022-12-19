part of 'splash_bloc.dart';

@immutable
abstract class SplashState {}

class SplashInitial extends SplashState {}

class Loading extends SplashState {}

class Loaded extends SplashState {}
