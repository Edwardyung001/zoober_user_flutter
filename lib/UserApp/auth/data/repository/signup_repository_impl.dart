import 'package:zooberuserapp/UserApp/auth/data/datasource/signup_datasource.dart';
import 'package:zooberuserapp/UserApp/auth/domain/entity/signup_entity.dart';
import 'package:zooberuserapp/UserApp/auth/domain/repository/signup_repository.dart';

class SignupRepositoryImpl implements SignupRepository {
  final SignupDatasource datasource;

  SignupRepositoryImpl(this.datasource);

  @override
  Future<SignupEntity> signUp(String name, String email, String phone, String password) async {
    final model = await datasource.signUp(name, email, phone, password);
    return model; // Already a SignupModel which extends SignupEntity
  }
}