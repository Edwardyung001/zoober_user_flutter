import 'package:zooberuserapp/UserApp/home/ui/data/model/favourite_model.dart';
import 'package:zooberuserapp/network/api_connection.dart';
import 'package:zooberuserapp/network/api_routes.dart';

class FavouriteDatasource {
  final DioClient dioClient;

  FavouriteDatasource(this.dioClient);

  //post method
  Future<FavouriteModel> favouriteList(String title,String description) async {
    final response = await dioClient.post(ApiRoutes.favouriteList, {
      'title': title,
      'description': description,
    }, );
    print(response.data);
    return FavouriteModel.fromJson(response.data);
    }
}