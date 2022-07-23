import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:mercury/models/chat.dart';
import 'package:mercury/screens/main/tabs/chats/cubit/chats_cubit.dart';
import 'package:mercury/utils/enums.dart';

class ChatsTab extends StatefulWidget {
  const ChatsTab({Key? key}) : super(key: key);

  @override
  State<ChatsTab> createState() => _ChatsTabState();
}

class _ChatsTabState extends State<ChatsTab> {
  late final ChatsCubit _cubit;

  @override
  void initState() {
    _cubit = ChatsCubit(chatRepository: context.read());
    _cubit.listenChats();
    super.initState();
  }

  List<Chat> getChats(AsyncSnapshot<QuerySnapshot> snapshot) {
    return (snapshot.data?.docs ?? []).map(
      (DocumentSnapshot document) {
        final Map<String, dynamic> data = document.data()! as Map<String, dynamic>;
        final List<String> ids = (data['participantsIdList'] as List<dynamic>)
            .map(
              (dynamic item) => item as String,
            )
            .toList();
        return Chat(
          id: document.id,
          chatType: chatTypeMapper.toEnum(data['chatType'] as String),
          participants: ids,
          updateTime: (data['updateTime'] as Timestamp).toDate(),
          name: data['name'] as String,
        );
      },
    ).toList();
  }

  String formatDate(DateTime messageDateTime) {
    final now = DateTime.now();
    final today = DateTime(now.year, now.month, now.day);

    final messageDate = DateTime(messageDateTime.year, messageDateTime.month, messageDateTime.day);
    if (messageDate == today) {
      return DateFormat.Hm().format(messageDateTime);
    } else if (today.year == messageDateTime.year) {
      return DateFormat('d.MM H:m').format(messageDateTime);
    } else {
      return DateFormat('d.MM.yy H:m').format(messageDateTime);
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder(
      bloc: _cubit,
      builder: (context, state) {
        if (state is ChatsLoaded) {
          return StreamBuilder(
            stream: state.chatsStream,
            builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
              if (snapshot.connectionState == ConnectionState.active) {
                final List<Chat> chats = getChats(snapshot);
                return ListView.builder(
                  physics: const BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
                  itemCount: chats.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      onTap: () {},
                      title: Text(chats[index].name),
                      trailing: Text(formatDate(chats[index].updateTime)),
                    );
                  },
                );
              } else {
                return const Center(child: CircularProgressIndicator());
              }
            },
          );
        } else {
          return const Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}
