import 'package:zooberuserapp/UserApp/auth/domain/entity/signup_entity.dart';
import 'package:zooberuserapp/UserApp/auth/domain/repository/signup_repository.dart';

class SignupUseCase {
  final SignupRepository repository;

  SignupUseCase(this.repository);

  Future<SignupEntity> call(String name, String email, String phoneNumber,String password) {
    return repository.signUp(name, email,phoneNumber,password);
  }
}