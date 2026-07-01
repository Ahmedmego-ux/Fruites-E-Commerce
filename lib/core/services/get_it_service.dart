import 'package:fruit_ecommerce_app/features/auth/data/repos/auth_repo_impl.dart';
import 'package:fruit_ecommerce_app/features/auth/domain/repos/auth_repo.dart';
import 'package:fruit_ecommerce_app/features/auth/presentation/manger/creat_new_user/creat_new_user_cubit.dart';
import 'package:fruit_ecommerce_app/features/auth/presentation/manger/login/log_in_cubit.dart';
import 'package:get_it/get_it.dart';

final getIt=GetIt.instance;

void setupServiceLocator(){
  getIt.registerLazySingleton<AuthRepo>(()=>AuthRepoImpl());
  getIt.registerLazySingleton<CreatNewUserCubit>(()=>CreatNewUserCubit(getIt<AuthRepo>()));
  getIt.registerLazySingleton<LogInCubit>(()=>LogInCubit(getIt<AuthRepo>()));
}