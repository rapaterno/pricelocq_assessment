import 'locq_localization.dart';

/// The translations for English (`en`).
class LocqLocalizationsEn extends LocqLocalizations {
  LocqLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get login => 'Login';

  @override
  String get mobileNumber => 'mobileNumber';

  @override
  String get password => 'Password';

  @override
  String get emptyMobileNumberValidation => 'Please enter your mobile number';

  @override
  String get invalidMobileNumberValidation => 'Please enter a valid mobile number';

  @override
  String get invalidPasswordValidation => 'Please enter your password';

  @override
  String get routeNotFound => 'Route not found';
}
