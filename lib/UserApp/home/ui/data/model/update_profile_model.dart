class UpdateProfileModel{
  final bool status;
  final String message;


  UpdateProfileModel({
    required this.status,
    required this.message,
  });

  factory UpdateProfileModel.fromJson(Map<String, dynamic> json) {
    return UpdateProfileModel(
      status: json['status'] == true,
      message: json['data']['message'],
    );
  }
}