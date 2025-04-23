
import 'package:zooberuserapp/UserApp/home/ui/domain/entity/fetching_favourite_entity.dart';
import 'package:zooberuserapp/UserApp/home/ui/domain/entity/fetching_profile_entity.dart';
import 'package:zooberuserapp/UserApp/home/ui/domain/repository/fetching_favourite_repository.dart';

class FetchingFavouriteUseCase {
  final FetchingFavouriteRepository repository;

  FetchingFavouriteUseCase(this.repository);

  Future<FetchingFavouriteEntity> call(String userId) async {
    return await repository.favouriteFetching(userId);
    }

}