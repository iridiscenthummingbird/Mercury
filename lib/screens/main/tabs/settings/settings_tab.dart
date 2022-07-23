import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mercury/repositories/user_repository.dart';
import 'package:mercury/screens/login/login_screen.dart';
import 'package:mercury/widgets/theme_switcher.dart';

class SettingsTab extends StatefulWidget {
  const SettingsTab({Key? key}) : super(key: key);

  @override
  State<SettingsTab> createState() => _SettingsTabState();
}

class _SettingsTabState extends State<SettingsTab> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text('Settigns'),
          const ThemeSwitcher(),
          TextButton(
            onPressed: () {
              context.read<UserRepository>().logout();
              Navigator.pushReplacementNamed(context, LoginScreen.routeName);
            },
            child: const Text('Logout'),
          ),
        ],
      ),
    );
  }
}
