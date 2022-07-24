import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:mercury/models/chat.dart';
import 'package:mercury/models/user.dart';
import 'package:mercury/utils/enums.dart';

abstract class FireStoreManager {
  Future<List<User>> getUsers(String userId);

  Future<void> addUser(String id, String name);

  Stream<QuerySnapshot> listenChats(String userId);

  Stream<QuerySnapshot> listenMessages(String chatId);

  Future<void> sendTextMessage(String text, String chatId, String userId);

  Future<void> sendImageMessage(String base64, String chatId, String userId);

  Future<void> deleteMessage(String id);

  Future<void> editMessage(String text, String id);

  Future<String> createChat(List<String> participantsIdList, ChatType chatType);

  Future<Chat> getChat(String id);
}

class FireStoreManagerImpl implements FireStoreManager {
  CollectionReference usersCollection = FirebaseFirestore.instance.collection('users');
  CollectionReference messagesCollection = FirebaseFirestore.instance.collection('messages');
  CollectionReference chatsCollection = FirebaseFirestore.instance.collection('chats');

  @override
  Future<List<User>> getUsers(String userId) async {
    final QuerySnapshot<Object?> snapshot = await usersCollection.where('id', isNotEqualTo: userId).get();

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
    final Stream<QuerySnapshot> messagesStream = messagesCollection
        .where(
          'chatId',
          isEqualTo: chatId,
        )
        .orderBy('createTime')
        .snapshots();
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
    if (chatType == ChatType.private) {
      final result = await chatsCollection
          .where('participantsIdList', arrayContains: participantsIdList[0])
          .where('chatType', isEqualTo: 'private')
          .get();
      if (result.docs.isNotEmpty) {
        for (final item in result.docs) {
          final Map<String, dynamic> data = item.data()! as Map<String, dynamic>;
          final List<String> ids = (data['participantsIdList'] as List<dynamic>)
              .map(
                (dynamic item) => item as String,
              )
              .toList();
          if (ids.contains(participantsIdList[1])) {
            return item.id;
          }
        }
      }
    }

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

  @override
  Future<Chat> getChat(String id) async {
    final DocumentSnapshot<Object?> snapshot = await chatsCollection.doc(id).get();

    final Map<String, dynamic> data = snapshot.data() as Map<String, dynamic>;

    final List<String> ids = (data['participantsIdList'] as List<dynamic>)
        .map(
          (dynamic item) => item as String,
        )
        .toList();
    return Chat(
      id: id,
      chatType: chatTypeMapper.toEnum(data['chatType'] as String),
      participants: ids,
      updateTime: (data['updateTime'] as Timestamp).toDate(),
      name: data['name'] as String,
    );
  }

  @override
  Future<void> sendImageMessage(String base64, String chatId, String userId) async {
    final storageRef = FirebaseStorage.instance.ref();
    final String path = 'images/${DateTime.now().millisecondsSinceEpoch}.jpg';
    final imageRef = storageRef.child(path);
    imageRef.putString(base64, format: PutStringFormat.base64);

    await messagesCollection.add(
      {
        'path': path,
        'chatId': chatId,
        'userId': userId,
        'createTime': Timestamp.now(),
        'messageType': 'image',
      },
    );
    await chatsCollection.doc(chatId).update({'updateTime': Timestamp.now()});
  }
}
