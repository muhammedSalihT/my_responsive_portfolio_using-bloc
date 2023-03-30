import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(const HomeInitial()) {
    on<HoverEvent>((event, emit) {
      return emit(const HomeState(Colors.blue));
    });

    on<ReleseHoverEvent>((event, emit) {
      return emit(const HomeInitial());
    });
  }
}
