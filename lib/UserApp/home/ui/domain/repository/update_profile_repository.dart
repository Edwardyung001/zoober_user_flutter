import 'package:zooberuserapp/UserApp/home/ui/domain/entity/update_profile_entity.dart';
abstract class UpdateProfileRepository {
  Future<UpdateProfileEntity> profileUpdate({
    required String userId,
    String? mobile,
    String? email,
    String? firstname,
    String? lastname,
    String? gender,
    String? dob,
    String? image,
  });
}
