import 'package:zooberuserapp/UserApp/auth/domain/entity/signup_entity.dart';


class LoginModel extends SignupEntity {
  LoginModel({
    required bool success,
    required String message,
  }) : super(success: success, message: message);

  factory LoginModel.fromJson(Map<String, dynamic> json) {
    return LoginModel(
      success: json['success'] ?? false,
      message: json['message'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'success': success,
      'message': message,
    };
  }
}
