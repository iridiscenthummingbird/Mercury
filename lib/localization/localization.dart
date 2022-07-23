import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_sheet_localization/flutter_sheet_localization.dart';

part 'localization.g.dart';

@SheetLocalization('1t1rS9G0VXBDmqOxYpgjBQxgdX6iGA13cmp_7EL1rZXE', '0', 1)
// the `1` is the generated version. You must increment it each time you want to regenerate
// a new version of the labels.

class AppLocalizationsDelegate extends LocalizationsDelegate<AppLocalizationsData> {
  const AppLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) => localizedLabels.containsKey(locale);
  @override
  Future<AppLocalizationsData> load(Locale locale) => SynchronousFuture<AppLocalizationsData>(localizedLabels[locale]!);

  @override
  bool shouldReload(AppLocalizationsDelegate old) => false;
}

abstract class AppLocalizations {
  static AppLocalizationsData of(BuildContext context) {
    return Localizations.of<AppLocalizationsData>(context, AppLocalizationsData)!;
  }
}

//flutter clean && flutter pub get && flutter packages pub run build_runner build --delete-conflicting-outputs
//https://docs.google.com/spreadsheets/d/1t1rS9G0VXBDmqOxYpgjBQxgdX6iGA13cmp_7EL1rZXE/edit#gid=0

