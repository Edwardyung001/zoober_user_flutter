import 'package:zooberuserapp/UserApp/home/ui/data/datasource/favourite_datasource.dart';
import 'package:zooberuserapp/UserApp/home/ui/data/model/favourite_model.dart';
import 'package:zooberuserapp/UserApp/home/ui/domain/entity/favourite_entity.dart';
import 'package:zooberuserapp/UserApp/home/ui/domain/repository/favourite_repository.dart';

class FavouriteRepositoryImpl implements FavouriteRepository {
final FavouriteDatasource favouriteDatasource;

FavouriteRepositoryImpl( this.favouriteDatasource);

@override
Future<FavouriteEntity> favouriteList(String title,String description) async {
  final FavouriteModel favouriteModel = await favouriteDatasource.favouriteList(title,description);

  return FavouriteEntity(
      message: favouriteModel.message,);
  }
}