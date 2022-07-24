import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:mercury/repositories/chat_repository.dart';
import 'package:meta/meta.dart';

part 'chats_state.dart';

class ChatsCubit extends Cubit<ChatsState> {
  ChatsCubit({required this.chatRepository}) : super(ChatsInitial());
  final ChatRepository chatRepository;

  void listenChats() {
    emit(ChatsLoaded(chatRepository.listenChats()));
  }
}
