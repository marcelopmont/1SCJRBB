import 'package:firebase_auth/firebase_auth.dart';

abstract class LoginWithEmail {
  Future<User?> execute(String email, String password);
}