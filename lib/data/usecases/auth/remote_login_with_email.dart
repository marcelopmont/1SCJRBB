import 'package:example_blocs/domain/usecases/auth/login_with_email.dart';
import 'package:firebase_auth/firebase_auth.dart';

class RemoteLoginWithEmail extends LoginWithEmail {
  RemoteLoginWithEmail({
    required this.firebaseAuth,
  });

  FirebaseAuth firebaseAuth;

  @override
  Future<User?> execute(String email, String password) async {
    try {
      final userCredential = await firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return userCredential.user;
    } catch (error) {
      return null;
    }
  }
}
