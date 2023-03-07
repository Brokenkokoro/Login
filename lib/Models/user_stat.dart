class User {
  String? email;
  String? password;
  User({required this.email, required this.password});

  User copyWith({String? email, String? password}) =>
      User(email: email ?? this.email, password: password ?? this.password);
}
