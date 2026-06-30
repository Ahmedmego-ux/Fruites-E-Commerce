import 'package:dartz/dartz.dart';
import 'package:fruit_ecommerce_app/core/errors/failure.dart';
import 'package:fruit_ecommerce_app/features/auth/domain/entitys/login_entity.dart';

abstract class AuthRepo {
  
  Future<Either<Failure,UserEntity>> creatUser({
    required String email,
    required String password
    });
}