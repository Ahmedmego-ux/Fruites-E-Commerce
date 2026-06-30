import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:fruit_ecommerce_app/core/errors/failure.dart';
import 'package:fruit_ecommerce_app/features/auth/data/models/user_model.dart';
import 'package:fruit_ecommerce_app/features/auth/domain/entitys/login_entity.dart';
import 'package:fruit_ecommerce_app/features/auth/domain/repos/auth_repo.dart';

class AuthRepoImpl extends AuthRepo{
  @override
  Future<Either<Failure, UserEntity>> creatUser({required String email,
   required String password
   }) async{
   try {
  final credential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
    email: email,
    password: password,
  );
  return right(UserModel.fromFirebase(credential.user!));
} on FirebaseAuthException  catch (e) {
  if (e.code == 'weak-password') {
    return left(ServerFailure(message: 'The password provided is too weak.'));
  } if (e.code == 'email-already-in-use') {
  return Left(
    ServerFailure(message: 'The account already exists for that email.'),
  );
}

return Left(
  ServerFailure(
    message: e.message ?? 'Something went wrong',
  ),
);
} 
  }
}