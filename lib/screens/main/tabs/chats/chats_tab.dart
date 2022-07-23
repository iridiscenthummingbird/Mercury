import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:mercury/models/chat.dart';
import 'package:mercury/utils/enums.dart';

class ChatsTab extends StatefulWidget {
  const ChatsTab({Key? key}) : super(key: key);

  @override
  State<ChatsTab> createState() => _ChatsTabState();
}

class _ChatsTabState extends State<ChatsTab> {
  List<Chat> getChats(AsyncSnapshot<QuerySnapshot> snapshot) {
    return snapshot.data!.docs.map(
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
        );
      },
    ).toList();
  }

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text('Chats'),
    );
  }
}
