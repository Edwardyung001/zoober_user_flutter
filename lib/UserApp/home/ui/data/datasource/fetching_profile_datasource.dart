
import 'package:zooberuserapp/UserApp/home/ui/data/model/fetching_profile_model.dart';
import 'package:zooberuserapp/network/api_connection.dart';
import 'package:zooberuserapp/network/api_routes.dart';

class FetchingProfileDatasource {
  final DioClient dioClient;

  FetchingProfileDatasource(this.dioClient);

  //post method
  Future<FetchingProfileModel> profileFetching(String userId,) async {
    final response = await dioClient.post(ApiRoutes.profileFetching, {
      'userId': userId,
    }, );
    print(response.data);
    return FetchingProfileModel.fromJson(response.data);
  }
}