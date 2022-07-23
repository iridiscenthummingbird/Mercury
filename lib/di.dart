import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mercury/managers/auth_manager.dart';
import 'package:mercury/managers/firestore_manager.dart';
import 'package:mercury/managers/shared_preference_manager_impl.dart';
import 'package:mercury/repositories/chat_repository.dart';
import 'package:mercury/repositories/message_repository.dart';
import 'package:mercury/repositories/user_repository.dart';

class DI extends StatelessWidget {
  final Widget child;

  const DI({
    Key? key,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider<SharedPreferenceManager>(
          create: (context) => SharedPreferenceManagerImpl(),
        ),
        RepositoryProvider<AuthManager>(
          create: (context) => AuthManagerImpl(),
        ),
        RepositoryProvider<FireStoreManager>(
          create: (context) => FireStoreManagerImpl(),
        ),
        RepositoryProvider<UserRepository>(
          create: (context) => UserRepositoryImpl(
            authManager: context.read<AuthManager>(),
            sharedPreferenceManager: context.read<SharedPreferenceManager>(),
            fireStoreManager: context.read<FireStoreManager>(),
          ),
        ),
        RepositoryProvider<ChatRepository>(
          create: (context) => ChatRepositoryImpl(
            sharedPreferenceManager: context.read<SharedPreferenceManager>(),
            fireStoreManager: context.read<FireStoreManager>(),
          ),
        ),
        RepositoryProvider<MessageRepository>(
          create: (context) => MessageRepositoryImpl(
            sharedPreferenceManager: context.read<SharedPreferenceManager>(),
            fireStoreManager: context.read<FireStoreManager>(),
          ),
        ),
      ],
      child: child,
    );
  }
}
