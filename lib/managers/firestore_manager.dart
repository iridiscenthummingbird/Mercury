import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:mercury/models/user.dart';
import 'package:mercury/utils/enums.dart';

abstract class FireStoreManager {
  Future<List<User>> getUsers();

  Future<void> addUser(String id, String name);

  Stream<QuerySnapshot> listenChats(String userId);

  Stream<QuerySnapshot> listenMessages(String chatId);

  Future<void> sendTextMessage(String text, String chatId, String userId);

  Future<void> deleteMessage(String id);

  Future<void> editMessage(String text, String id);

  Future<String> createChat(List<String> participantsIdList, ChatType chatType);
}

class FireStoreManagerImpl implements FireStoreManager {
  CollectionReference usersCollection = FirebaseFirestore.instance.collection('users');
  CollectionReference messagesCollection = FirebaseFirestore.instance.collection('messages');
  CollectionReference chatsCollection = FirebaseFirestore.instance.collection('chats');

  @override
  Future<List<User>> getUsers() async {
    final QuerySnapshot<Object?> snapshot = await usersCollection.get();

    return snapshot.docs.map(
      (item) {
        final Map<String, dynamic> data = item.data() as Map<String, dynamic>;
        return User(
          name: data['name'] as String,
          id: data['id'] as String,
        );
      },
    ).toList();
  }

  @override
  Future<void> addUser(String id, String name) async {
    await usersCollection.add(
      {
        'id': id,
        'name': name,
      },
    );
  }

  @override
  Stream<QuerySnapshot<Object?>> listenChats(String userId) {
    final Stream<QuerySnapshot> chatsStream = chatsCollection
        .where('participantsIdList', arrayContains: userId)
        .orderBy('updateTime', descending: true)
        .snapshots();
    return chatsStream;
  }

  @override
  Stream<QuerySnapshot<Object?>> listenMessages(String chatId) {
    final Stream<QuerySnapshot> messagesStream =
        messagesCollection.where('chatId', arrayContains: chatId).orderBy('createTime').snapshots();
    return messagesStream;
  }

  @override
  Future<void> sendTextMessage(String text, String chatId, String userId) async {
    await messagesCollection.add(
      {
        'text': text,
        'chatId': chatId,
        'userId': userId,
        'createTime': Timestamp.now(),
        'messageType': 'text',
      },
    );
    await chatsCollection.doc(chatId).update({'updateTime': Timestamp.now()});
  }

  @override
  Future<void> deleteMessage(String id) async {
    await messagesCollection.doc(id).delete();
  }

  @override
  Future<void> editMessage(String text, String id) async {
    await messagesCollection.doc(id).update(
      {
        'text': text,
      },
    );
  }

  @override
  Future<String> createChat(List<String> participantsIdList, ChatType chatType) async {
    final List<String> names = [];
    for (final id in participantsIdList) {
      final QuerySnapshot<Object?> snapshot = await usersCollection.where('id', isEqualTo: id).get();

      final Map<String, dynamic> data = snapshot.docs[0].data() as Map<String, dynamic>;

      names.add(data['name'] as String);
    }
    final doc = await chatsCollection.add(
      {
        'name': names.join(', '),
        'participantsIdList': participantsIdList,
        'chatType': chatTypeMapper.fromEnum(chatType),
        'updateTime': Timestamp.now(),
      },
    );
    return doc.id;
  }
}
