import 'package:firebase_auth/firebase_auth.dart';

abstract class RegisterWithEmail {
  Future<User?> execute(String email, String password);
}