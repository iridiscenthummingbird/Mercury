import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mercury/localization/localization.dart';
import 'package:mercury/screens/login/login_screen.dart';
import 'package:mercury/screens/main/main_screen.dart';
import 'package:mercury/screens/registration/cubit/registration_cubit.dart';
import 'package:mercury/widgets/email_field.dart';
import 'package:mercury/widgets/password_field.dart';

class RegistrationScreen extends StatefulWidget {
  const RegistrationScreen({Key? key}) : super(key: key);

  static const String routeName = '/registration';

  @override
  State<RegistrationScreen> createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  late final RegistrationCubit _cubit;

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  late final AppLocalizationsData localization;
  @override
  void initState() {
    _cubit = RegistrationCubit(userRepository: context.read());
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
        if (state is RegistrationSuccessState) {
          Navigator.pushReplacementNamed(context, MainScreen.routeName);
        }
      },
      child: Scaffold(
        backgroundColor: Theme.of(context).primaryColor,
        resizeToAvoidBottomInset: false,
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
                      localization.registrationScreen.signUp,
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
                                  await _cubit.signUp(_emailController.text, _passwordController.text);
                                }
                              },
                              borderRadius: BorderRadius.circular(20),
                              child: Ink(
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    color: Theme.of(context).textTheme.bodyText1!.color!,
                                  ),
                                  borderRadius: BorderRadius.circular(50),
                                ),
                                child: Center(
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(vertical: 10),
                                    child: Text(
                                      localization.registrationScreen.signUp,
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
                          Text(localization.registrationScreen.orSignUpWith),
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
                              Text(localization.registrationScreen.doYouHaveAccount + ' '),
                              GestureDetector(
                                onTap: () {
                                  Navigator.pushReplacementNamed(context, LoginScreen.routeName);
                                },
                                child: Text(
                                  localization.loginScreen.signIn,
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
