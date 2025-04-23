import 'package:zooberuserapp/UserApp/auth/domain/entity/signup_entity.dart';

abstract class SignupRepository {
  Future<SignupEntity> signUp(String name, String email,String phoneNumber, String password, );
}