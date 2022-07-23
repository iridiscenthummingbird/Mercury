import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:mercury/managers/firestore_manager.dart';
import 'package:mercury/managers/shared_preference_manager_impl.dart';

abstract class MessageRepository {
  Stream<QuerySnapshot> listenMessages(String chatId);

  Future<void> sendTextMessage(String text, String chatId);

  Future<void> deleteMessage(String id);

  Future<void> editMessage(String text, String id);
}

class MessageRepositoryImpl extends MessageRepository {
  final SharedPreferenceManager sharedPreferenceManager;
  final FireStoreManager fireStoreManager;

  MessageRepositoryImpl({
    required this.sharedPreferenceManager,
    required this.fireStoreManager,
  });

  @override
  Future<void> deleteMessage(String id) async {
    await fireStoreManager.deleteMessage(id);
  }

  @override
  Future<void> editMessage(String text, String id) async {
    await fireStoreManager.editMessage(text, id);
  }

  @override
  Stream<QuerySnapshot<Object?>> listenMessages(String chatId) {
    return fireStoreManager.listenMessages(chatId);
  }

  @override
  Future<void> sendTextMessage(String text, String chatId) async {
    await fireStoreManager.sendTextMessage(
      text,
      chatId,
      sharedPreferenceManager.getUid(),
    );
  }
}
