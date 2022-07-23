import 'package:flutter/material.dart';

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
            color: Colors.black,
            fontSize: 20,
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
      onTap: () {},
    );
  }
}
