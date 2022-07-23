import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mercury/repositories/user_repository.dart';
import 'package:mercury/screens/login/login_screen.dart';
import 'package:mercury/widgets/theme_switcher.dart';

import '../../models/message.dart';
import '../../utils/enums.dart';
import '../../widgets/message_widget.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  static const String routeName = '/main';

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Main'),
            const ThemeSwitcher(),
            const SizedBox(
              height: 30,
            ),
            MessageWidget(
              message: TextMessage(
                chatId: '',
                createTime: DateTime.now(),
                isMine: false,
                id: '',
                text:
                    'Testejfiwfniewnfouwwd\nwddww\ndwdw\ndwdwdw\nsqsqenfuwenfuen\nfefe\nefefefefeff\nfeefef\nfefefefef',
                messageType: MessageType.text,
                userId: '1',
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            MessageWidget(
              message: TextMessage(
                chatId: '',
                createTime: DateTime.now(),
                isMine: true,
                id: '',
                text:
                    'Testejfiwfniewnfouwwd\nwddww\ndwdw\ndwdwdw\nsqsqenfuwenfuen\nfefe\nefefefefeff\nfeefef\nfefefefef',
                messageType: MessageType.text,
                userId: '1',
              ),
            ),
            TextButton(
              onPressed: () {
                context.read<UserRepository>().logout();
                Navigator.pushReplacementNamed(context, LoginScreen.routeName);
              },
              child: const Text('Logout'),
            ),
          ],
        ),
      ),
    );
  }
}
