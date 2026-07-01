part of 'creat_new_user_cubit.dart';

@immutable
sealed class CreatNewUserState {}

final class CreatNewUserInitial extends CreatNewUserState {}
final class CreatNewUserLoading extends CreatNewUserState {}
final class CreatNewUserSuccess extends CreatNewUserState {
  final UserEntity userEntity;

  CreatNewUserSuccess({required this.userEntity});
}
final class CreatNewUserFailure extends CreatNewUserState {
  final String errMessage;

  CreatNewUserFailure({required this.errMessage});
}

