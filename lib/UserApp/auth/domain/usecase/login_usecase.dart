import 'package:zooberuserapp/UserApp/auth/domain/entity/login_entity.dart';
import 'package:zooberuserapp/UserApp/auth/domain/repository/login_repository.dart';

class LoginUseCase {
  final LoginRepository repository;

  LoginUseCase(this.repository);

  Future<LoginEntity> call(String phoneNumber, String password) {
    return repository.login(phoneNumber,password);
  }
}