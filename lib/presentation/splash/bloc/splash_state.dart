part of 'splash_bloc.dart';

abstract class SplashState {
  const SplashState();
}

class SplashInitial extends SplashState {}

class SplashLoading extends SplashState {}

class SplashSuccess extends SplashState {}



class SplashError extends SplashState {
  final String message;

  const SplashError(this.message);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is SplashError && other.message == message;
  }

  @override
  int get hashCode => message.hashCode;
}
