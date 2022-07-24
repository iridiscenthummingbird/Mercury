import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mercury/models/user.dart';
import 'package:mercury/screens/chat/chat_screen.dart';
import 'package:mercury/screens/chat/cubit/chat_cubit.dart';
import 'package:mercury/screens/group_chat_creation/cubit/group_chat_creation_cubit.dart';

class GroupChatCreationScreen extends StatefulWidget {
  const GroupChatCreationScreen({Key? key}) : super(key: key);

  static const String routeName = '/groupChatCreation';

  @override
  State<GroupChatCreationScreen> createState() => _GroupChatCreationScreenState();
}

class _GroupChatCreationScreenState extends State<GroupChatCreationScreen> {
  late final GroupChatCreationCubit _cubit;

  late List<bool?> checkListValues;
  @override
  void initState() {
    _cubit = GroupChatCreationCubit(
      userRepository: context.read(),
      chatRepository: context.read(),
    );
    _cubit.getContacts();
    super.initState();
  }

  List<String> getCheckedIds(List<User> contacts) {
    final List<String> ids = [];
    for (int i = 0; i < contacts.length; i++) {
      if (checkListValues[i] == true) {
        ids.add(contacts[i].id);
      }
    }
    return ids;
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener(
      bloc: _cubit,
      listener: (context, state) {
        if (state is GroupChatCreatedState) {
          Navigator.pop(context);
          Navigator.pushNamed(
            context,
            ChatScreen.routeName,
            arguments: ChatScreenSettings(
              openChatType: OpenChatType.chatScreen,
              chatId: state.chatId,
            ),
          );
        }
      },
      child: BlocBuilder(
        bloc: _cubit,
        builder: (context, state) {
          if (state is ContactsLoadedState) {
            final List<User> contacts = state.contacts;
            checkListValues = List.generate(contacts.length, (index) => false);
            return Scaffold(
              appBar: AppBar(
                backgroundColor: Colors.transparent,
                elevation: 0,
                actions: [
                  IconButton(
                    onPressed: () async {
                      await _cubit.createGroupChat(getCheckedIds(contacts));
                    },
                    icon: const Icon(Icons.check),
                  ),
                ],
              ),
              body: ListView.builder(
                physics: const BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
                itemCount: contacts.length,
                itemBuilder: (context, index) {
                  final User user = contacts[index];
                  return Padding(
                    padding: const EdgeInsets.all(3),
                    child: StatefulBuilder(
                      builder: (context, setState) {
                        return CheckboxListTile(
                          value: checkListValues[index],
                          onChanged: (value) {
                            setState(() {
                              checkListValues[index] = value;
                            });
                          },
                          tileColor: Theme.of(context).cardColor,
                          title: Text(
                            user.name,
                            style: const TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                        );
                      },
                    ),
                  );
                },
              ),
            );
          } else {
            return const Scaffold(body: Center(child: CircularProgressIndicator()));
          }
        },
      ),
    );
  }
}
