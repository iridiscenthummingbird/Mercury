part of 'chat_cubit.dart';

@immutable
abstract class ChatState {}

class ChatInitial extends ChatState {}

class ChatLoadedState extends ChatState {
  final Chat chat;
  final Stream<QuerySnapshot> messagesStream;
  ChatLoadedState(this.chat, this.messagesStream);
}

class ChatCreatedState extends ChatState {
  final String chatId;

  ChatCreatedState(this.chatId);
}
