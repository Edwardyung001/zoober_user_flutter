import 'package:zooberuserapp/UserApp/home/ui/domain/entity/fetching_favourite_entity.dart';

abstract class FetchingFavouriteRepository {
  Future<FetchingFavouriteEntity> favouriteFetching(String userId);
}