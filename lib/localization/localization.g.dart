// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'localization.dart';

// **************************************************************************
// SheetLocalizationGenerator
// **************************************************************************

final localizedLabels = <Locale, AppLocalizationsData>{
  Locale.fromSubtags(languageCode: 'en'): const AppLocalizationsData(
    mainScreen: const AppLocalizationsDataMainScreen(
      favorite: 'Favorite',
      all: 'All',
      noNotes: 'No notes',
      darkTheme: 'Dark theme',
      myNotes: 'My Notes',
      logout: 'Logout',
      text: 'text',
      mainScreen: 'Main screen',
    ),
    noteScreen: const AppLocalizationsDataNoteScreen(
      no: 'No',
      yes: 'Yes',
      doYouWantSave: 'Do you want to save the note?',
      descriptionRequired: 'Description is required',
      description: 'Description',
      title: 'Title',
      titleRequired: 'Title is required',
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
    mainScreen: const AppLocalizationsDataMainScreen(
      favorite: 'Улюблений',
      all: 'Все',
      noNotes: 'Немає нотаток',
      darkTheme: 'Темна тема',
      myNotes: 'Мої Нотатки',
      logout: 'Вийти',
      text: 'текст',
      mainScreen: 'Головний екран',
    ),
    noteScreen: const AppLocalizationsDataNoteScreen(
      no: 'Ні',
      yes: 'Так',
      doYouWantSave: 'Ви хочете зберегти запис?',
      descriptionRequired: 'Потрібен опис',
      description: 'Опис',
      title: 'Титул',
      titleRequired: 'Назва потрібна',
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
    required this.mainScreen,
    required this.noteScreen,
    required this.registrationScreen,
    required this.loginScreen,
  });

  final AppLocalizationsDataMainScreen mainScreen;
  final AppLocalizationsDataNoteScreen noteScreen;
  final AppLocalizationsDataRegistrationScreen registrationScreen;
  final AppLocalizationsDataLoginScreen loginScreen;
  factory AppLocalizationsData.fromJson(Map<String, Object?> map) =>
      AppLocalizationsData(
        mainScreen: AppLocalizationsDataMainScreen.fromJson(
            map['mainScreen']! as Map<String, Object?>),
        noteScreen: AppLocalizationsDataNoteScreen.fromJson(
            map['noteScreen']! as Map<String, Object?>),
        registrationScreen: AppLocalizationsDataRegistrationScreen.fromJson(
            map['registrationScreen']! as Map<String, Object?>),
        loginScreen: AppLocalizationsDataLoginScreen.fromJson(
            map['loginScreen']! as Map<String, Object?>),
      );

  AppLocalizationsData copyWith({
    AppLocalizationsDataMainScreen? mainScreen,
    AppLocalizationsDataNoteScreen? noteScreen,
    AppLocalizationsDataRegistrationScreen? registrationScreen,
    AppLocalizationsDataLoginScreen? loginScreen,
  }) =>
      AppLocalizationsData(
        mainScreen: mainScreen ?? this.mainScreen,
        noteScreen: noteScreen ?? this.noteScreen,
        registrationScreen: registrationScreen ?? this.registrationScreen,
        loginScreen: loginScreen ?? this.loginScreen,
      );

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is AppLocalizationsData &&
          mainScreen == other.mainScreen &&
          noteScreen == other.noteScreen &&
          registrationScreen == other.registrationScreen &&
          loginScreen == other.loginScreen);
  @override
  int get hashCode =>
      runtimeType.hashCode ^
      mainScreen.hashCode ^
      noteScreen.hashCode ^
      registrationScreen.hashCode ^
      loginScreen.hashCode;
}

class AppLocalizationsDataMainScreen {
  const AppLocalizationsDataMainScreen({
    required this.favorite,
    required this.all,
    required this.noNotes,
    required this.darkTheme,
    required this.myNotes,
    required this.logout,
    required this.text,
    required this.mainScreen,
  });

  final String favorite;
  final String all;
  final String noNotes;
  final String darkTheme;
  final String myNotes;
  final String logout;
  final String text;
  final String mainScreen;
  factory AppLocalizationsDataMainScreen.fromJson(Map<String, Object?> map) =>
      AppLocalizationsDataMainScreen(
        favorite: map['favorite']! as String,
        all: map['all']! as String,
        noNotes: map['noNotes']! as String,
        darkTheme: map['darkTheme']! as String,
        myNotes: map['myNotes']! as String,
        logout: map['logout']! as String,
        text: map['text']! as String,
        mainScreen: map['mainScreen']! as String,
      );

  AppLocalizationsDataMainScreen copyWith({
    String? favorite,
    String? all,
    String? noNotes,
    String? darkTheme,
    String? myNotes,
    String? logout,
    String? text,
    String? mainScreen,
  }) =>
      AppLocalizationsDataMainScreen(
        favorite: favorite ?? this.favorite,
        all: all ?? this.all,
        noNotes: noNotes ?? this.noNotes,
        darkTheme: darkTheme ?? this.darkTheme,
        myNotes: myNotes ?? this.myNotes,
        logout: logout ?? this.logout,
        text: text ?? this.text,
        mainScreen: mainScreen ?? this.mainScreen,
      );

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is AppLocalizationsDataMainScreen &&
          favorite == other.favorite &&
          all == other.all &&
          noNotes == other.noNotes &&
          darkTheme == other.darkTheme &&
          myNotes == other.myNotes &&
          logout == other.logout &&
          text == other.text &&
          mainScreen == other.mainScreen);
  @override
  int get hashCode =>
      runtimeType.hashCode ^
      favorite.hashCode ^
      all.hashCode ^
      noNotes.hashCode ^
      darkTheme.hashCode ^
      myNotes.hashCode ^
      logout.hashCode ^
      text.hashCode ^
      mainScreen.hashCode;
}

class AppLocalizationsDataNoteScreen {
  const AppLocalizationsDataNoteScreen({
    required this.no,
    required this.yes,
    required this.doYouWantSave,
    required this.descriptionRequired,
    required this.description,
    required this.title,
    required this.titleRequired,
  });

  final String no;
  final String yes;
  final String doYouWantSave;
  final String descriptionRequired;
  final String description;
  final String title;
  final String titleRequired;
  factory AppLocalizationsDataNoteScreen.fromJson(Map<String, Object?> map) =>
      AppLocalizationsDataNoteScreen(
        no: map['no']! as String,
        yes: map['yes']! as String,
        doYouWantSave: map['doYouWantSave']! as String,
        descriptionRequired: map['descriptionRequired']! as String,
        description: map['description']! as String,
        title: map['title']! as String,
        titleRequired: map['titleRequired']! as String,
      );

  AppLocalizationsDataNoteScreen copyWith({
    String? no,
    String? yes,
    String? doYouWantSave,
    String? descriptionRequired,
    String? description,
    String? title,
    String? titleRequired,
  }) =>
      AppLocalizationsDataNoteScreen(
        no: no ?? this.no,
        yes: yes ?? this.yes,
        doYouWantSave: doYouWantSave ?? this.doYouWantSave,
        descriptionRequired: descriptionRequired ?? this.descriptionRequired,
        description: description ?? this.description,
        title: title ?? this.title,
        titleRequired: titleRequired ?? this.titleRequired,
      );

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is AppLocalizationsDataNoteScreen &&
          no == other.no &&
          yes == other.yes &&
          doYouWantSave == other.doYouWantSave &&
          descriptionRequired == other.descriptionRequired &&
          description == other.description &&
          title == other.title &&
          titleRequired == other.titleRequired);
  @override
  int get hashCode =>
      runtimeType.hashCode ^
      no.hashCode ^
      yes.hashCode ^
      doYouWantSave.hashCode ^
      descriptionRequired.hashCode ^
      description.hashCode ^
      title.hashCode ^
      titleRequired.hashCode;
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
