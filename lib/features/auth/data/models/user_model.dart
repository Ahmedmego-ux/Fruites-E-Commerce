import 'dart:convert';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:fruit_ecommerce_app/features/auth/domain/entitys/login_entity.dart';

class UserModel extends UserEntity {

  UserModel( {required super.email, required super.id, required super.name});
 
 factory UserModel.fromFirebase(User user){
    return UserModel(
      id:user.uid,
      email:user.email??'',
      name:user.displayName??'',
     
     );
  }
  

  factory UserModel.fromJson(Map<String,dynamic>json){
    return UserModel(
      id:json['id'],
      email:json['email'],
      name:json['name'],
     
     );
  }

  Map<String,dynamic>toJson(){
  return {
'email':email,
'password':id,
  };
  }
   }