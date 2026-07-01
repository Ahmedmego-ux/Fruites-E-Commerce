part of 'log_in_cubit.dart';

@immutable
sealed class LogInState {}

final class LogInInitial extends LogInState {}
final class LogInLoading extends LogInState {}
final class LogInSuccess extends LogInState {
  final UserEntity userEntity;

  LogInSuccess({required this.userEntity});
}
final class LogInWithGoogleSuccess extends LogInState {
  final UserEntity userEntity;

  LogInWithGoogleSuccess({required this.userEntity});
}
final class LogInFaliure extends LogInState {
  final String errMessage;

  LogInFaliure({required this.errMessage});
}

