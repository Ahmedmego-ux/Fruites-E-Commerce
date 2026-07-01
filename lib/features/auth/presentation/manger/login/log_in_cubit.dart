import 'package:bloc/bloc.dart';
import 'package:fruit_ecommerce_app/features/auth/domain/entitys/login_entity.dart';
import 'package:fruit_ecommerce_app/features/auth/domain/repos/auth_repo.dart';
import 'package:meta/meta.dart';

part 'log_in_state.dart';

class LogInCubit extends Cubit<LogInState> {
  LogInCubit(this.authRepo) : super(LogInInitial());
  final AuthRepo authRepo;
  Future <void> logIn({required String email,required String password})async{
emit(LogInLoading());
   
final result=  await authRepo.logIn(email: email, password: password);

  result.fold((faluire)=>emit(LogInFaliure(errMessage: faluire.message)),
   (userEntity)=>emit(LogInSuccess(userEntity: userEntity)));


  }

   Future <void> logInWithGoogle()async {
final result =await authRepo.logInWithGoogle();
  result.fold((faluire)=>emit(LogInFaliure(errMessage: faluire.message)),
   (userEntity)=>emit(LogInWithGoogleSuccess(userEntity: userEntity)));

   }
}
