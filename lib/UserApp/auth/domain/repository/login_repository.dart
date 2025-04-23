import 'package:zooberuserapp/UserApp/auth/domain/entity/login_entity.dart';

abstract class LoginRepository {
  Future<LoginEntity> login(String phoneNumber, String password, );
}