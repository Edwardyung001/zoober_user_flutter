import 'package:zooberuserapp/UserApp/home/ui/data/datasource/update_profile_datasource.dart';
import 'package:zooberuserapp/UserApp/home/ui/data/model/update_profile_model.dart';
import 'package:zooberuserapp/UserApp/home/ui/domain/entity/update_profile_entity.dart';
import 'package:zooberuserapp/UserApp/home/ui/domain/repository/update_profile_repository.dart';

class UpdateProfileRepositoryImpl implements UpdateProfileRepository {
  final UpdateProfileDatasource updateProfileDatasource;

  UpdateProfileRepositoryImpl(this.updateProfileDatasource);

  @override
  Future<UpdateProfileEntity> profileUpdate({
    required String userId,
    String? mobile,
    String? email,
    String? firstname,
    String? lastname,
    String? gender,
    String? dob,
    String? image,
  }) async {
    final UpdateProfileModel updateProfileModel = await updateProfileDatasource.profileUpdate(
      userId: userId,
      mobile: mobile,
      email: email,
      firstname: firstname,
      lastname: lastname,
      gender: gender,
      dob: dob,
      image: image,
    );

    return UpdateProfileEntity(
      message: updateProfileModel.message,
    );
  }
}
