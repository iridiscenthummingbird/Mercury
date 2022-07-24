import 'package:google_sign_in/google_sign_in.dart';
import 'package:mercury/managers/auth_manager.dart';
import 'package:mercury/managers/firestore_manager.dart';
import 'package:mercury/managers/shared_preference_manager_impl.dart';
import 'package:mercury/models/user.dart';
import 'package:mercury/utils/google_login_exeption.dart';

abstract class UserRepository {
  Future<void> signIn(String email, String password);

  Future<void> signUp(String email, String password);

  Future<void> googleSignIn();

  Future<void> logout();

  Future<List<User>> getContacts();
}

class UserRepositoryImpl extends UserRepository {
  final SharedPreferenceManager sharedPreferenceManager;
  final AuthManager authManager;
  final FireStoreManager fireStoreManager;

  UserRepositoryImpl({
    required this.sharedPreferenceManager,
    required this.authManager,
    required this.fireStoreManager,
  });

  @override
  Future<void> signIn(String email, String password) async {
    final String uid = await authManager.signIn(email, password);
    sharedPreferenceManager.setUid(uid);
  }

  @override
  Future<void> signUp(String email, String password) async {
    final String uid = await authManager.signUp(email, password);
    sharedPreferenceManager.setUid(uid);
    final String name = email.split('@')[0];
    await fireStoreManager.addUser(uid, name);
  }

  @override
  Future<void> logout() async {
    await GoogleSignIn().signOut();
    sharedPreferenceManager.logout();
  }

  @override
  Future<void> googleSignIn() async {
    final GoogleSignInAccount? result = await GoogleSignIn().signIn();
    if (result == null) {
      throw GoogleLoginExeption(message: 'You should sign in.');
    }
    final String uid = result.id;
    sharedPreferenceManager.setUid(uid);
    final String name = result.email.split('@')[0];
    await fireStoreManager.addUser(uid, result.displayName ?? name);
  }

  @override
  Future<List<User>> getContacts() async {
    return await fireStoreManager.getUsers();
  }
}
