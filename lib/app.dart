import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:mercury/di.dart';
import 'package:mercury/localization/localization.dart';
import 'package:mercury/managers/shared_preference_manager_impl.dart';
import 'package:mercury/screens/login/login_screen.dart';
import 'package:mercury/screens/main/main_screen.dart';
import 'package:mercury/screens/registration/registration_screen.dart';
import 'package:mercury/utils/my_themes.dart';
import 'package:mercury/utils/theme_provider.dart';
import 'package:provider/provider.dart';

part 'routes.dart';

final navigatorKey = GlobalKey<NavigatorState>();

class App extends StatefulWidget {
  const App({Key? key}) : super(key: key);

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  @override
  Widget build(BuildContext context) {
    return DI(
      child: ChangeNotifierProvider(
        create: (context) => ThemeProvider(
          sharedPreferenceManager: context.read(),
        ),
        child: Builder(
          builder: (context) {
            return MaterialApp(
              themeMode: context.watch<ThemeProvider>().themeMode,
              theme: MyThemes.lightTheme,
              darkTheme: MyThemes.darkTheme,
              builder: BotToastInit(),
              onGenerateRoute: _generateRoute,
              navigatorKey: navigatorKey,
              debugShowCheckedModeBanner: false,
              localizationsDelegates: const [
                AppLocalizationsDelegate(),
                GlobalMaterialLocalizations.delegate,
                GlobalCupertinoLocalizations.delegate,
                GlobalWidgetsLocalizations.delegate,
              ],
              supportedLocales: localizedLabels.keys.toList(),
              home: context.read<SharedPreferenceManager>().isAuthorized() ? const MainScreen() : const LoginScreen(),
            );
          },
        ),
      ),
    );
  }
}
