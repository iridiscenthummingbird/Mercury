import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:mercury/managers/firestore_manager.dart';
import 'package:mercury/managers/shared_preference_manager_impl.dart';
import 'package:mercury/utils/enums.dart';

abstract class ChatRepository {
  Stream<QuerySnapshot> listenChats();

  Future<String> createChat(List<String> participantsIdList, ChatType chatType);
}

class ChatRepositoryImpl extends ChatRepository {
  final SharedPreferenceManager sharedPreferenceManager;
  final FireStoreManager fireStoreManager;

  ChatRepositoryImpl({
    required this.sharedPreferenceManager,
    required this.fireStoreManager,
  });

  @override
  Future<String> createChat(List<String> participantsIdList, ChatType chatType) async {
    return await fireStoreManager.createChat(participantsIdList, chatType);
  }

  @override
  Stream<QuerySnapshot<Object?>> listenChats() {
    return fireStoreManager.listenChats(sharedPreferenceManager.getUid());
  }
}
