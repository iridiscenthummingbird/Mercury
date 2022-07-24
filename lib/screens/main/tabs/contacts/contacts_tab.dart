import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mercury/models/user.dart';
import 'package:mercury/screens/main/tabs/contacts/cubit/contacts_cubit.dart';
import 'package:mercury/widgets/contact_tile.dart';

class ContactsTab extends StatefulWidget {
  const ContactsTab({Key? key}) : super(key: key);

  @override
  State<ContactsTab> createState() => _ContactsTabState();
}

class _ContactsTabState extends State<ContactsTab> {
  late final ContactsCubit _cubit;

  @override
  void initState() {
    _cubit = ContactsCubit(userRepository: context.read());
    _cubit.getContacts();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder(
      bloc: _cubit,
      builder: (context, state) {
        if (state is ContactsLoadedState) {
          final List<User> contacts = state.contacts;

          return RefreshIndicator(
            onRefresh: () => _cubit.getContacts(),
            child: ListView.builder(
              physics: const BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
              itemCount: contacts.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(3),
                  child: ContactTile(user: contacts[index]),
                );
              },
            ),
          );
        } else {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }
}
