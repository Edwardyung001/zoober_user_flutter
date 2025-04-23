import 'package:zooberuserapp/UserApp/auth/data/model/signup_model.dart';
import 'package:zooberuserapp/network/api_connection.dart';
import 'package:zooberuserapp/network/api_routes.dart';

class SignupDatasource {
  final DioClient dioClient;

  SignupDatasource(this.dioClient);

  Future<SignupModel> signUp(String name,String email, String phoneNumber,String password) async {
    try {
      final response = await dioClient.post(
        ApiRoutes.signUp,
        {'name':name,'email': email,'mobile':phoneNumber, 'password': password,},
      );
      return SignupModel.fromJson(response.data);
    } catch (e) {
      throw Exception('Error fetching role-based data: $e');
    }
  }
}