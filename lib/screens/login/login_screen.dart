import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mercury/localization/localization.dart';
import 'package:mercury/repositories/user_repository.dart';
import 'package:mercury/screens/login/cubit/login_cubit.dart';
import 'package:mercury/screens/main/main_screen.dart';
import 'package:mercury/screens/registration/registration_screen.dart';
import 'package:mercury/widgets/email_field.dart';
import 'package:mercury/widgets/password_field.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  static const String routeName = '/login';

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  late final LoginCubit _cubit;

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  late final AppLocalizationsData localization;
  @override
  void initState() {
    _cubit = LoginCubit(
      userRepository: context.read<UserRepository>(),
    );
    super.initState();
  }

  @override
  void didChangeDependencies() {
    localization = AppLocalizations.of(context);
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener(
      bloc: _cubit,
      listener: (context, state) {
        if (state is LoginSuccessState) {
          Navigator.pushReplacementNamed(context, MainScreen.routeName);
        }
      },
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Theme.of(context).primaryColor,
        body: Padding(
          padding: const EdgeInsets.only(top: 240),
          child: Form(
            key: _formKey,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 40),
                    Text(
                      localization.loginScreen.signIn,
                      style: const TextStyle(
                        fontSize: 24,
                      ),
                    ),
                    const SizedBox(height: 10),
                    EmailField(
                      controller: _emailController,
                    ),
                    const SizedBox(height: 10),
                    PasswordField(
                      controller: _passwordController,
                    ),
                    const SizedBox(height: 30),
                    Center(
                      child: Column(
                        children: [
                          Material(
                            color: Theme.of(context).primaryColor,
                            child: InkWell(
                              onTap: () async {
                                if (_formKey.currentState?.validate() ?? false) {
                                  await _cubit.signIn(_emailController.text, _passwordController.text);
                                }
                              },
                              borderRadius: BorderRadius.circular(20),
                              child: Ink(
                                decoration: BoxDecoration(
                                  border: Border.all(color: Theme.of(context).iconTheme.color!),
                                  borderRadius: BorderRadius.circular(50),
                                ),
                                child: Center(
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(vertical: 10),
                                    child: Text(
                                      localization.loginScreen.signIn,
                                      style: const TextStyle(
                                        fontSize: 24,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(height: 20),
                          Text(localization.loginScreen.orSignInWith),
                          const SizedBox(height: 10),
                          GestureDetector(
                            onTap: () async {
                              await _cubit.googleSignIn();
                            },
                            child: SizedBox(
                              height: 50,
                              width: double.infinity,
                              child: SvgPicture.asset(
                                'assets/google_logo.svg',
                                fit: BoxFit.fitHeight,
                              ),
                            ),
                          ),
                          const SizedBox(height: 20),
                          Wrap(
                            alignment: WrapAlignment.center,
                            children: [
                              Text(localization.loginScreen.dontHaveAccount + ' '),
                              GestureDetector(
                                onTap: () {
                                  Navigator.pushReplacementNamed(context, RegistrationScreen.routeName);
                                },
                                child: Text(
                                  localization.loginScreen.register,
                                  style: const TextStyle(
                                    color: Colors.blue,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 10),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
