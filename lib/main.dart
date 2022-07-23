import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mercury/app.dart';
import 'package:mercury/firebase_options.dart';
import 'package:mercury/managers/shared_preference_manager_impl.dart';
import 'package:mercury/utils/error_popup.dart';
import 'package:mercury/utils/google_login_exeption.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MyBlocObserver extends BlocObserver {
  @override
  void onEvent(Bloc? bloc, Object? event) {
    super.onEvent(bloc!, event);
    if (kDebugMode) {
      print(event);
    }
  }

  @override
  void onError(BlocBase bloc, Object error, StackTrace stackTrace) {
    // print(error);
    if (kDebugMode) {
      print('onError -- ${bloc.runtimeType}, $error');
    }

    //FirebaseCrashlytics.instance.recordError(error, stackTrace);
    // if (error is UnauthorisedException) {
    //   navigatorKey.currentState?.pushReplacementNamed(LoginScreen.routeName);
    // }

    if (error is FirebaseException && error.message != null) {
      showErrorPopup(error.message!);
    } else if (error is GoogleLoginExeption) {
      showErrorPopup(error.message!);
    }
    super.onError(bloc, error, stackTrace);
  }
}

Future<void> main() async {
  BlocOverrides.runZoned(
    () async {
      WidgetsFlutterBinding.ensureInitialized();
      await Firebase.initializeApp(
        options: DefaultFirebaseOptions.currentPlatform,
      );
      final sharedPrefs = await SharedPreferences.getInstance();
      SharedPreferenceManagerImpl().init(sharedPrefs);
      runApp(const App());
    },
    blocObserver: MyBlocObserver(),
  );
}
