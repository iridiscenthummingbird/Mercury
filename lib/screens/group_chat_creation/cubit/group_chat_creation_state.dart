part of 'group_chat_creation_cubit.dart';

@immutable
abstract class GroupChatCreationState {}

class GroupChatCreationInitial extends GroupChatCreationState {}

class ContactsLoadedState extends GroupChatCreationState {
  final List<User> contacts;

  ContactsLoadedState(this.contacts);
}

class GroupChatCreatedState extends GroupChatCreationState {
  final String chatId;

  GroupChatCreatedState(this.chatId);
}
