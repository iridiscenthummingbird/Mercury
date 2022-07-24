import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mercury/models/chat.dart';
import 'package:mercury/repositories/chat_repository.dart';
import 'package:mercury/repositories/message_repository.dart';
import 'package:mercury/utils/enums.dart';
import 'package:meta/meta.dart';

part 'chat_state.dart';

enum OpenChatType { contactScreen, chatScreen }

class ChatCubit extends Cubit<ChatState> {
  ChatCubit({
    required this.chatRepository,
    required this.messageRepository,
  }) : super(ChatInitial());

  final ChatRepository chatRepository;
  final MessageRepository messageRepository;

  Future<void> loadChat(String chatId) async {
    emit(
      ChatLoadedState(
        await chatRepository.getChat(chatId),
        messageRepository.listenMessages(chatId),
      ),
    );
  }

  Future<void> sendTextMessage(String text, String chatId) async {
    await messageRepository.sendTextMessage(text, chatId);
  }

  Future<void> deleteMessage(String id) async {
    await messageRepository.deleteMessage(id);
  }

  Future<void> createChat(String companionId) async {
    emit(ChatCreatedState(await chatRepository.createChat([companionId], ChatType.private)));
  }

  Future<void> sendImageMessage(XFile xfile, String chatId) async {
    await messageRepository.sendImageMessage(xfile, chatId);
  }
}
