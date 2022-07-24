import 'package:bloc/bloc.dart';
import 'package:mercury/models/user.dart';
import 'package:mercury/repositories/user_repository.dart';
import 'package:meta/meta.dart';

part 'contacts_state.dart';

class ContactsCubit extends Cubit<ContactsState> {
  ContactsCubit({required this.userRepository}) : super(ContactsInitial());
  final UserRepository userRepository;

  Future<void> getContacts() async {
    emit(ContactsLoadedState(await userRepository.getContacts()));
  }
}
