import 'package:zooberuserapp/UserApp/home/ui/domain/entity/fetching_profile_entity.dart';

abstract class FetchingProfileRepository {
  Future<FetchingProfileEntity> profileFetching(String userId);
}