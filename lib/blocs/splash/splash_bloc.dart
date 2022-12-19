import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
part 'splash_event.dart';
part 'splash_state.dart';

class SplashBloc extends Bloc<SplashEvent, SplashState> {
  SplashBloc() : super(SplashInitial()) {
    on<MoveToHomeEvent>((event, emit) async {
      emit(Loading());
      await Future.delayed(const Duration(seconds: 6));
      emit(Loaded());
    });
  }
}
