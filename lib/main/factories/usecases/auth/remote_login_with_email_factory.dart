import 'package:favorites_cryptos/data/usecases/auth/remote_login_with_email.dart';
import 'package:firebase_auth/firebase_auth.dart';

RemoteLoginWithEmail makeRemoteLoginWithEmail() => RemoteLoginWithEmail(
      firebaseAuth: FirebaseAuth.instance,
    );
