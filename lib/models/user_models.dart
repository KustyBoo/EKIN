import 'package:firebase_auth/firebase_auth.dart' as firebase_auth;

class User {
  String fullName = "";
  String username = "";
  String email = "";
  String password = "";
  String confirmPassword = "";


  User({
    required this.fullName,
    required this.username,
    required this.email,
    required this.password,
    required this.confirmPassword,
  });

  String getUsername(){
    return username;
  }

  factory User.fromFirebaseUser(firebase_auth.User? firebaseUser) {
    if (firebaseUser == null) {
      return User(
        fullName: '',
        username: '',
        email: '',
        password: '',
        confirmPassword: '',
      );
    }

    return User(
      fullName: firebaseUser.displayName ?? '',
      username: '',
      email: firebaseUser.email ?? '',
      password: '',
      confirmPassword: '',
    );
  }
}
