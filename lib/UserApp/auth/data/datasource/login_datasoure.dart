import 'package:zooberuserapp/UserApp/auth/data/model/login_model.dart';
import 'package:zooberuserapp/network/api_connection.dart';
import 'package:zooberuserapp/network/api_routes.dart';

class LoginDatasource {
  final DioClient dioClient;

  LoginDatasource(this.dioClient);

  Future<LoginModel> login(String phoneNumber,String password) async {
    try {
      final response = await dioClient.post(
        ApiRoutes.login,
        {'mobile': phoneNumber,'password': password,},
      );
      return LoginModel.fromJson(response.data);
    } catch (e) {
      throw Exception('Error fetching role-based data: $e');
    }
  }
}