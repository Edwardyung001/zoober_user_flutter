import 'package:zooberuserapp/UserApp/home/ui/domain/entity/update_profile_entity.dart';
import 'package:zooberuserapp/UserApp/home/ui/domain/repository/update_profile_repository.dart';
class UpdateProfileUseCase {
  final UpdateProfileRepository repository;

  UpdateProfileUseCase(this.repository);

  Future<UpdateProfileEntity> call({
    required String userId,
    String? mobile,
    String? email,
    String? firstname,
    String? lastname,
    String? gender,
    String? dob,
    String? image,
  }) async {
    return await repository.profileUpdate(
      userId: userId,
      mobile: mobile,
      email: email,
      firstname: firstname,
      lastname: lastname,
      gender: gender,
      dob: dob,
      image: image,
    );
  }
}
