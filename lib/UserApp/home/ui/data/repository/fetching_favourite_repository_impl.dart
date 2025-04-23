
import 'package:zooberuserapp/UserApp/home/ui/data/datasource/fetching_favourite_datasource.dart';
import 'package:zooberuserapp/UserApp/home/ui/data/datasource/fetching_profile_datasource.dart';
import 'package:zooberuserapp/UserApp/home/ui/data/model/fetching_favourite_model.dart';
import 'package:zooberuserapp/UserApp/home/ui/data/model/fetching_profile_model.dart';
import 'package:zooberuserapp/UserApp/home/ui/domain/entity/fetching_favourite_entity.dart';
import 'package:zooberuserapp/UserApp/home/ui/domain/entity/fetching_profile_entity.dart';
import 'package:zooberuserapp/UserApp/home/ui/domain/repository/fetching_favourite_repository.dart';
import 'package:zooberuserapp/UserApp/home/ui/domain/repository/fetching_profile_repository.dart';

class FetchingFavouriteRepositoryImpl implements FetchingFavouriteRepository {
final FetchingFavouriteDatasource fetchingFavouriteDatasource;

FetchingFavouriteRepositoryImpl( this.fetchingFavouriteDatasource);

@override
Future<FetchingFavouriteEntity> favouriteFetching(String userId) async {
  final FetchingFavouriteModel fetchingFavouriteModel = await fetchingFavouriteDatasource.favouriteFetching(userId);

  return FetchingFavouriteEntity(
    favouriteList: fetchingFavouriteModel.favouriteList,);
  }
}