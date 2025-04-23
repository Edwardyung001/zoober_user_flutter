import 'package:zooberuserapp/UserApp/auth/data/datasource/login_datasoure.dart';
import 'package:zooberuserapp/UserApp/auth/data/model/login_model.dart';
import 'package:zooberuserapp/UserApp/auth/domain/entity/login_entity.dart';
import 'package:zooberuserapp/UserApp/auth/domain/repository/login_repository.dart';

class LoginRepositoryImpl implements LoginRepository {
  final LoginDatasource loginDatasource;

  LoginRepositoryImpl( this.loginDatasource);

  @override
  Future<LoginEntity> login( String phoneNumber,String password) async {
    final LoginModel loginModel = await loginDatasource.login(phoneNumber,password);
    return LoginEntity(success: loginModel.success, message: loginModel.message,token: loginModel.token,userId: loginModel.userId);

  }
}