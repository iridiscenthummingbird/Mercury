import 'package:bloc/bloc.dart';
import 'package:mercury/extentions/error_handler.dart';
import 'package:mercury/repositories/user_repository.dart';
import 'package:meta/meta.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit({required this.userRepository}) : super(LoginInitial());

  final UserRepository userRepository;

  Future<void> signIn(String email, String password) async {
    await userRepository.signIn(email, password).withErrorHandler(this);
    emit(LoginSuccessState());
  }

  Future<void> googleSignIn() async {
    await userRepository.googleSignIn().withErrorHandler(this);
    emit(LoginSuccessState());
  }
}
