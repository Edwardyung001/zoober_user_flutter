import 'package:zooberuserapp/UserApp/home/ui/data/model/update_profile_model.dart';
import 'package:zooberuserapp/network/api_connection.dart';
import 'package:zooberuserapp/network/api_routes.dart';

class UpdateProfileDatasource {
  final DioClient dioClient;

  UpdateProfileDatasource(this.dioClient);

  //post method
  Future<UpdateProfileModel> profileUpdate(String userId,String mobile,String email,String firstname,String lastname,String gender,String dob,String image,) async {
    final response = await dioClient.post(ApiRoutes.profileUpdate, {
      'userId': userId,
      'mobile': mobile,
      'email': email,
      'firstname': firstname,
      'lastname': lastname,
      'gender': gender,
      'dob': dob,
      'profile': image,
    }, );
    print(response.data);
    return UpdateProfileModel.fromJson(response.data);
  }
}