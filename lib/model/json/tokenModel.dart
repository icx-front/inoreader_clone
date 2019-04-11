class Token {
  final String accessToken;
  final String type;
  final num expiresIn;
  final String refreshToken;

  Token(this.accessToken, this.type, this.expiresIn, this.refreshToken);

  Token.fromMap(Map<String, dynamic> json)
      : accessToken = json['access_token'],
        type = json['token_type'],
        expiresIn = json['expires_in'],
        refreshToken = json['refresh_token'];
}
