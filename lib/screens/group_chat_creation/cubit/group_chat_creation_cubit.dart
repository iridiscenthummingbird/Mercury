import 'package:bloc/bloc.dart';
import 'package:mercury/models/user.dart';
import 'package:mercury/repositories/chat_repository.dart';
import 'package:mercury/repositories/user_repository.dart';
import 'package:mercury/utils/enums.dart';
import 'package:meta/meta.dart';

part 'group_chat_creation_state.dart';

class GroupChatCreationCubit extends Cubit<GroupChatCreationState> {
  GroupChatCreationCubit({
    required this.userRepository,
    required this.chatRepository,
  }) : super(GroupChatCreationInitial());

  final UserRepository userRepository;
  final ChatRepository chatRepository;

  Future<void> getContacts() async {
    emit(ContactsLoadedState(await userRepository.getContacts()));
  }

  Future<void> createGroupChat(List<String> ids) async {
    emit(
      GroupChatCreatedState(
        await chatRepository.createChat(ids, ChatType.group),
      ),
    );
  }
}
