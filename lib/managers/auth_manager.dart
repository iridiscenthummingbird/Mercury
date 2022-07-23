import 'package:firebase_auth/firebase_auth.dart';

abstract class AuthManager {
  Future<String> signIn(String email, String password);

  Future<String> signUp(String email, String password);
}

class AuthManagerImpl implements AuthManager {
  @override
  Future<String> signIn(String email, String password) async {
    final UserCredential credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
      email: email,
      password: password,
    );
    return credential.user?.uid ?? '';
  }

  @override
  Future<String> signUp(String email, String password) async {
    final UserCredential credential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );
    return credential.user?.uid ?? '';
  }
}
