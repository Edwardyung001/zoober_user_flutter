import 'package:zooberuserapp/UserApp/home/ui/domain/entity/favourite_entity.dart';

abstract class FavouriteRepository {
  Future<FavouriteEntity> favouriteList(String title,String description);
}