import 'package:bloc/bloc.dart';
import 'package:fruit_ecommerce_app/features/auth/domain/repos/auth_repo.dart';
import 'package:meta/meta.dart';

import '../../../domain/entitys/login_entity.dart';

part 'creat_new_user_state.dart';

class CreatNewUserCubit extends Cubit<CreatNewUserState> {
  CreatNewUserCubit(this.authRepo) : super(CreatNewUserInitial());
  final AuthRepo authRepo; 

 Future<void> creatUser({required String email,
   required String password,    required String name

   }) async{
    emit(CreatNewUserLoading());

 final result= await authRepo.creatUser(email: email, password: password,name: name);
  result.fold((failure){
emit(CreatNewUserFailure(errMessage: failure.message));
  },
     (userEntity){
emit(CreatNewUserSuccess(userEntity: userEntity));
     });

   }
   
}
