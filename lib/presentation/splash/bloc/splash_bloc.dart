import 'dart:async';

import 'package:bloc/bloc.dart';

part 'splash_event.dart';
part 'splash_state.dart';

class SplashBloc extends Bloc<SplashEvent, SplashState> {
  SplashBloc() : super(SplashInitial()) {
    on<SplashLoad>(_load);
  }

  FutureOr<void> _load(SplashEvent event, Emitter<SplashState> emit) async {
    try {
      emit(SplashLoading());
      emit(SplashSuccess());
    } catch (e) {
      SplashError(e.toString());
    }
  }
}
