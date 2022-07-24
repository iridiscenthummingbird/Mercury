part of 'chats_cubit.dart';

@immutable
abstract class ChatsState {}

class ChatsInitial extends ChatsState {}

class ChatsLoaded extends ChatsState {
  final Stream<QuerySnapshot<Object?>> chatsStream;

  ChatsLoaded(this.chatsStream);
}
