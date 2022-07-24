// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'localization.dart';

// **************************************************************************
// SheetLocalizationGenerator
// **************************************************************************

final localizedLabels = <Locale, AppLocalizationsData>{
  Locale.fromSubtags(languageCode: 'en'): const AppLocalizationsData(
    mainApp: const AppLocalizationsDataMainApp(
      delete: 'Delete',
      edit: 'Edit',
      settings: 'Settings',
      chats: 'Chats',
      contacts: 'Contacts',
      logout: 'Logout',
      darkTheme: 'Dark Theme',
    ),
    registrationScreen: const AppLocalizationsDataRegistrationScreen(
      orSignUpWith: 'or sign up with',
      doYouHaveAccount: 'Do you have an account?',
      signUp: 'Sign up',
    ),
    loginScreen: const AppLocalizationsDataLoginScreen(
      register: 'Register',
      dontHaveAccount: 'Don\'t have an account?',
      orSignInWith: 'or sign in with',
      passwordMustBe: 'Password must be at least 6 characters',
      passwordRequired: 'A password is required',
      password: 'Password',
      validEmailRequired: 'A valid email is required',
      email: 'Email',
      signIn: 'Sign in',
    ),
  ),
  Locale.fromSubtags(languageCode: 'uk'): const AppLocalizationsData(
    mainApp: const AppLocalizationsDataMainApp(
      delete: 'Видалити',
      edit: 'Редагувати',
      settings: 'Налаштування',
      chats: 'Чати',
      contacts: 'Контакти',
      logout: 'Вийти',
      darkTheme: 'Темна тема',
    ),
    registrationScreen: const AppLocalizationsDataRegistrationScreen(
      orSignUpWith: 'або зареєструватися з',
      doYouHaveAccount: 'У вас є аккаунт?',
      signUp: 'Зареєструватися',
    ),
    loginScreen: const AppLocalizationsDataLoginScreen(
      register: 'Реєстрація',
      dontHaveAccount: 'Не маєте облікового запису?',
      orSignInWith: 'або увійдіть із',
      passwordMustBe: 'Пароль повинен бути щонайменше 6 символів',
      passwordRequired: 'Потрібен пароль',
      password: 'Пароль',
      validEmailRequired: 'Потрібна дійсна електронна пошта',
      email: 'Електронна пошта',
      signIn: 'Увійти',
    ),
  ),
};

class AppLocalizationsData {
  const AppLocalizationsData({
    required this.mainApp,
    required this.registrationScreen,
    required this.loginScreen,
  });

  final AppLocalizationsDataMainApp mainApp;
  final AppLocalizationsDataRegistrationScreen registrationScreen;
  final AppLocalizationsDataLoginScreen loginScreen;
  factory AppLocalizationsData.fromJson(Map<String, Object?> map) =>
      AppLocalizationsData(
        mainApp: AppLocalizationsDataMainApp.fromJson(
            map['mainApp']! as Map<String, Object?>),
        registrationScreen: AppLocalizationsDataRegistrationScreen.fromJson(
            map['registrationScreen']! as Map<String, Object?>),
        loginScreen: AppLocalizationsDataLoginScreen.fromJson(
            map['loginScreen']! as Map<String, Object?>),
      );

  AppLocalizationsData copyWith({
    AppLocalizationsDataMainApp? mainApp,
    AppLocalizationsDataRegistrationScreen? registrationScreen,
    AppLocalizationsDataLoginScreen? loginScreen,
  }) =>
      AppLocalizationsData(
        mainApp: mainApp ?? this.mainApp,
        registrationScreen: registrationScreen ?? this.registrationScreen,
        loginScreen: loginScreen ?? this.loginScreen,
      );

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is AppLocalizationsData &&
          mainApp == other.mainApp &&
          registrationScreen == other.registrationScreen &&
          loginScreen == other.loginScreen);
  @override
  int get hashCode =>
      runtimeType.hashCode ^
      mainApp.hashCode ^
      registrationScreen.hashCode ^
      loginScreen.hashCode;
}

class AppLocalizationsDataMainApp {
  const AppLocalizationsDataMainApp({
    required this.delete,
    required this.edit,
    required this.settings,
    required this.chats,
    required this.contacts,
    required this.logout,
    required this.darkTheme,
  });

  final String delete;
  final String edit;
  final String settings;
  final String chats;
  final String contacts;
  final String logout;
  final String darkTheme;
  factory AppLocalizationsDataMainApp.fromJson(Map<String, Object?> map) =>
      AppLocalizationsDataMainApp(
        delete: map['delete']! as String,
        edit: map['edit']! as String,
        settings: map['settings']! as String,
        chats: map['chats']! as String,
        contacts: map['contacts']! as String,
        logout: map['logout']! as String,
        darkTheme: map['darkTheme']! as String,
      );

  AppLocalizationsDataMainApp copyWith({
    String? delete,
    String? edit,
    String? settings,
    String? chats,
    String? contacts,
    String? logout,
    String? darkTheme,
  }) =>
      AppLocalizationsDataMainApp(
        delete: delete ?? this.delete,
        edit: edit ?? this.edit,
        settings: settings ?? this.settings,
        chats: chats ?? this.chats,
        contacts: contacts ?? this.contacts,
        logout: logout ?? this.logout,
        darkTheme: darkTheme ?? this.darkTheme,
      );

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is AppLocalizationsDataMainApp &&
          delete == other.delete &&
          edit == other.edit &&
          settings == other.settings &&
          chats == other.chats &&
          contacts == other.contacts &&
          logout == other.logout &&
          darkTheme == other.darkTheme);
  @override
  int get hashCode =>
      runtimeType.hashCode ^
      delete.hashCode ^
      edit.hashCode ^
      settings.hashCode ^
      chats.hashCode ^
      contacts.hashCode ^
      logout.hashCode ^
      darkTheme.hashCode;
}

class AppLocalizationsDataRegistrationScreen {
  const AppLocalizationsDataRegistrationScreen({
    required this.orSignUpWith,
    required this.doYouHaveAccount,
    required this.signUp,
  });

  final String orSignUpWith;
  final String doYouHaveAccount;
  final String signUp;
  factory AppLocalizationsDataRegistrationScreen.fromJson(
          Map<String, Object?> map) =>
      AppLocalizationsDataRegistrationScreen(
        orSignUpWith: map['orSignUpWith']! as String,
        doYouHaveAccount: map['doYouHaveAccount']! as String,
        signUp: map['signUp']! as String,
      );

  AppLocalizationsDataRegistrationScreen copyWith({
    String? orSignUpWith,
    String? doYouHaveAccount,
    String? signUp,
  }) =>
      AppLocalizationsDataRegistrationScreen(
        orSignUpWith: orSignUpWith ?? this.orSignUpWith,
        doYouHaveAccount: doYouHaveAccount ?? this.doYouHaveAccount,
        signUp: signUp ?? this.signUp,
      );

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is AppLocalizationsDataRegistrationScreen &&
          orSignUpWith == other.orSignUpWith &&
          doYouHaveAccount == other.doYouHaveAccount &&
          signUp == other.signUp);
  @override
  int get hashCode =>
      runtimeType.hashCode ^
      orSignUpWith.hashCode ^
      doYouHaveAccount.hashCode ^
      signUp.hashCode;
}

class AppLocalizationsDataLoginScreen {
  const AppLocalizationsDataLoginScreen({
    required this.register,
    required this.dontHaveAccount,
    required this.orSignInWith,
    required this.passwordMustBe,
    required this.passwordRequired,
    required this.password,
    required this.validEmailRequired,
    required this.email,
    required this.signIn,
  });

  final String register;
  final String dontHaveAccount;
  final String orSignInWith;
  final String passwordMustBe;
  final String passwordRequired;
  final String password;
  final String validEmailRequired;
  final String email;
  final String signIn;
  factory AppLocalizationsDataLoginScreen.fromJson(Map<String, Object?> map) =>
      AppLocalizationsDataLoginScreen(
        register: map['register']! as String,
        dontHaveAccount: map['dontHaveAccount']! as String,
        orSignInWith: map['orSignInWith']! as String,
        passwordMustBe: map['passwordMustBe']! as String,
        passwordRequired: map['passwordRequired']! as String,
        password: map['password']! as String,
        validEmailRequired: map['validEmailRequired']! as String,
        email: map['email']! as String,
        signIn: map['signIn']! as String,
      );

  AppLocalizationsDataLoginScreen copyWith({
    String? register,
    String? dontHaveAccount,
    String? orSignInWith,
    String? passwordMustBe,
    String? passwordRequired,
    String? password,
    String? validEmailRequired,
    String? email,
    String? signIn,
  }) =>
      AppLocalizationsDataLoginScreen(
        register: register ?? this.register,
        dontHaveAccount: dontHaveAccount ?? this.dontHaveAccount,
        orSignInWith: orSignInWith ?? this.orSignInWith,
        passwordMustBe: passwordMustBe ?? this.passwordMustBe,
        passwordRequired: passwordRequired ?? this.passwordRequired,
        password: password ?? this.password,
        validEmailRequired: validEmailRequired ?? this.validEmailRequired,
        email: email ?? this.email,
        signIn: signIn ?? this.signIn,
      );

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is AppLocalizationsDataLoginScreen &&
          register == other.register &&
          dontHaveAccount == other.dontHaveAccount &&
          orSignInWith == other.orSignInWith &&
          passwordMustBe == other.passwordMustBe &&
          passwordRequired == other.passwordRequired &&
          password == other.password &&
          validEmailRequired == other.validEmailRequired &&
          email == other.email &&
          signIn == other.signIn);
  @override
  int get hashCode =>
      runtimeType.hashCode ^
      register.hashCode ^
      dontHaveAccount.hashCode ^
      orSignInWith.hashCode ^
      passwordMustBe.hashCode ^
      passwordRequired.hashCode ^
      password.hashCode ^
      validEmailRequired.hashCode ^
      email.hashCode ^
      signIn.hashCode;
}
