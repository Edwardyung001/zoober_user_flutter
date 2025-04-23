
import 'package:zooberuserapp/UserApp/home/ui/domain/entity/fetching_profile_entity.dart';
import 'package:zooberuserapp/UserApp/home/ui/domain/repository/fetching_profile_repository.dart';

class FetchingProfileUseCase {
  final FetchingProfileRepository repository;

  FetchingProfileUseCase(this.repository);

  Future<FetchingProfileEntity> call(String userId) async {
    return await repository.profileFetching( userId) ;
    }

}