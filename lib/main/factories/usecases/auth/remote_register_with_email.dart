import 'package:favorites_cryptos/data/usecases/auth/remote_register_with_email.dart';
import 'package:firebase_auth/firebase_auth.dart';

RemoteRegisterWithEmail makeRemoteRegisterWithEmail() => RemoteRegisterWithEmail(
  firebaseAuth: FirebaseAuth.instance,
);
