class FetchingProfileModel{
  final bool status;
  final String message;


  FetchingProfileModel({
    required this.status,
    required this.message,
  });

  factory FetchingProfileModel.fromJson(Map<String, dynamic> json) {
    return FetchingProfileModel(
      status: json['status'] == true,
      message: json['data']['message'],
    );
  }
}