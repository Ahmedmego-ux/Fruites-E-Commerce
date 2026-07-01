import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:fruit_ecommerce_app/core/errors/failure.dart';
import 'package:fruit_ecommerce_app/features/auth/data/models/user_model.dart';
import 'package:fruit_ecommerce_app/features/auth/domain/entitys/login_entity.dart';
import 'package:fruit_ecommerce_app/features/auth/domain/repos/auth_repo.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthRepoImpl extends AuthRepo{
  @override
  Future<Either<Failure, UserEntity>> creatUser({required String email,
   required String password,required String name

   }) async{
   try {
  final credential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
    email: email,
    password: password,
  );

  final userModel = UserModel(
  id: credential.user!.uid,
  name: name,
  email: email,
);
  await FirebaseFirestore.instance.
  collection('users').
  doc(credential.user!.uid).
  set(userModel.toJson());

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
  
  @override
  Future<Either<Failure, UserEntity>> logIn({required String email, required String password})async {
   try {
  final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
    email: email,
    password: password
  );
  return right(UserModel.fromFirebase(credential.user!));
} on FirebaseAuthException catch (e) {
    print("Code: ${e.code}");
  print("Message: ${e.message}");
  if (e.code == 'user-not-found') {
    return left(ServerFailure(message: 'No user found for that email.'));
  } else if (e.code == 'invalid-credential') {
    return left(ServerFailure(message:  'Invalid email or password.'));
  }
    return left(
      ServerFailure(
        message: e.message ?? 'Something went wrong.',
      ),
    );
  } catch (e) {
    return left(
      ServerFailure(message: e.toString()),
    );
  }
}

  @override
  Future<Either<Failure,UserEntity>> logInWithGoogle() async{
   try {
  final GoogleSignInAccount? googleUser = await GoogleSignIn.instance.authenticate();
  if(googleUser ==null){
    return left(ServerFailure(message: 'Google sign in cancelled'));
  }
    
    final GoogleSignInAuthentication googleAuth = googleUser.authentication;
  
    
    final credential = GoogleAuthProvider.credential(idToken: googleAuth.idToken);
  
    
   final  userCredential = await FirebaseAuth.instance.signInWithCredential(credential);
   return right(UserModel.fromFirebase(userCredential .user!));
} on FirebaseAuthException catch (e) {
    return left(
      ServerFailure(
        message: e.message ?? 'Google sign in failed',
      ),
    );
  } catch (e) {
    return left(
      ServerFailure(message: e.toString()),
    );
  }
  }
  }
