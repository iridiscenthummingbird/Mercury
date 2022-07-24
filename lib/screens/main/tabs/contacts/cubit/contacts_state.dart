part of 'contacts_cubit.dart';

@immutable
abstract class ContactsState {}

class ContactsInitial extends ContactsState {}

class ContactsLoadedState extends ContactsState {
  final List<User> contacts;

  ContactsLoadedState(this.contacts);
}
