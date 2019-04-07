class LoginModel {
  final String email;
  final String token;
  final int userId;

  LoginModel(this.email, this.token, this.userId);

  LoginModel.fromJson(Map<String, dynamic> json)
      : email = json['email'],
        token = json['Auth'],
        userId = json['userId'];

  Map<String, dynamic> toJson() => {
        'email': email,
        'token': token,
        'id': userId,
      };
}
