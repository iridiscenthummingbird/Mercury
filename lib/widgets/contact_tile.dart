import 'package:flutter/material.dart';
import 'package:mercury/screens/chat/chat_screen.dart';
import 'package:mercury/screens/chat/cubit/chat_cubit.dart';

import '../models/user.dart';

class ContactTile extends StatelessWidget {
  const ContactTile({
    Key? key,
    required this.user,
  }) : super(key: key);

  final User user;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        backgroundColor: Colors.white,
        child: Text(
          user.name[0],
          style: const TextStyle(
            color: Colors.black54,
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      tileColor: Theme.of(context).cardColor,
      title: Text(
        user.name,
        style: const TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.normal,
        ),
      ),
      onTap: () {
        Navigator.pushNamed(
          context,
          ChatScreen.routeName,
          arguments: ChatScreenSettings(
            companionId: user.id,
            openChatType: OpenChatType.contactScreen,
          ),
        );
      },
    );
  }
}
