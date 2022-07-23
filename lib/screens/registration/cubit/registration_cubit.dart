import 'package:bloc/bloc.dart';
import 'package:mercury/extentions/error_handler.dart';
import 'package:mercury/repositories/user_repository.dart';
import 'package:meta/meta.dart';

part 'registration_state.dart';

class RegistrationCubit extends Cubit<RegistrationState> {
  RegistrationCubit({required this.userRepository}) : super(RegistrationInitial());
  final UserRepository userRepository;

  Future<void> signUp(String email, String password) async {
    await userRepository.signUp(email, password).withErrorHandler(this);
    emit(RegistrationSuccessState());
  }

  Future<void> googleSignIn() async {
    await userRepository.googleSignIn().withErrorHandler(this);
    emit(RegistrationSuccessState());
  }
}
