import 'package:zooberuserapp/UserApp/home/ui/data/model/update_profile_model.dart';
import 'package:zooberuserapp/network/api_connection.dart';
import 'package:zooberuserapp/network/api_routes.dart';
import 'package:zooberuserapp/storage/local_storage.dart';

class UpdateProfileDatasource {
final DioClient dioClient;

UpdateProfileDatasource(this.dioClient);

Future<UpdateProfileModel> profileUpdate({
  required String userId,
  String? mobile,
  String? email,
  String? firstname,
  String? lastname,
  String? gender,
  String? dob,
  String? image,
}) async {
  String? token = await SecureStorage.getValue('token');

  // Only include fields that are not null
  final Map<String, dynamic> input = {
    'userId': userId,
    if (mobile != null) 'mobile': mobile,
    if (email != null) 'email': email,
    if (firstname != null) 'firstname': firstname,
    if (lastname != null) 'lastname': lastname,
    if (gender != null) 'gender': gender,
    if (dob != null) 'dob': dob,
    if (image != null) 'profile': image,
  };

  print('Request Input: $input');

  final response = await dioClient.post(
    ApiRoutes.profileUpdate,
    input,
    headers: {
      'Authorization': 'Bearer $token',
    },
  );

  print('Response: ${response.data}');
  return UpdateProfileModel.fromJson(response.data);
}
}
