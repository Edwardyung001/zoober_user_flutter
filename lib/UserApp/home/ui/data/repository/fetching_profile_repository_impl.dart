
import 'package:zooberuserapp/UserApp/home/ui/data/datasource/fetching_profile_datasource.dart';
import 'package:zooberuserapp/UserApp/home/ui/data/model/fetching_profile_model.dart';
import 'package:zooberuserapp/UserApp/home/ui/domain/entity/fetching_profile_entity.dart';
import 'package:zooberuserapp/UserApp/home/ui/domain/repository/fetching_profile_repository.dart';

class FetchingProfileRepositoryImpl implements FetchingProfileRepository {
final FetchingProfileDatasource fetchingProfileDatasource;

FetchingProfileRepositoryImpl( this.fetchingProfileDatasource);

@override
Future<FetchingProfileEntity> profileFetching(String userId) async {
  final FetchingProfileModel fetchingProfileModel = await fetchingProfileDatasource.profileFetching(userId);

  return FetchingProfileEntity(
      message: fetchingProfileModel.message,);
  }
}