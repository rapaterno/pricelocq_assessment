import 'locq_localization.dart';

/// The translations for English (`en`).
class LocqLocalizationsEn extends LocqLocalizations {
  LocqLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get login => 'Login';

  @override
  String get mobileNumber => 'Mobile Number';

  @override
  String get password => 'Password';

  @override
  String get emptyMobileNumberValidation => 'Please enter your mobile number';

  @override
  String get invalidMobileNumberValidation => 'Please enter a valid mobile number';

  @override
  String get invalidPasswordValidation => 'Please enter your password';

  @override
  String get serverError => 'Oops! Something went wrong. Please try again later';

  @override
  String invalidCredentialsTryAgain(String credential) {
    return 'Invalid $credential or password. Please try again.';
  }

  @override
  String get routeNotFound => 'Route not found';

  @override
  String get searchStation => 'Search Station';

  @override
  String get whichPriceLOCQStationWillYouLikelyVisit => 'Which PriceLOCQ station will you likely visit';

  @override
  String get nearbyStations => 'Nearby Stations';

  @override
  String get done => 'Done';

  @override
  String kmAwayFromYou(int kilometers) {
    return '$kilometers km away from you';
  }

  @override
  String kmAway(int kilometers) {
    return '$kilometers km away';
  }

  @override
  String get open24hours => 'Open 24 hours';

  @override
  String openFromTimeToTime(String opensAt, String closesAt) {
    return 'Open from $opensAt to $closesAt';
  }

  @override
  String get backToList => 'Back to list';

  @override
  String get youGot => 'You got';

  @override
  String get discountOff => 'Off';

  @override
  String get onAllFuelProducts => 'on all fuel products';

  @override
  String offerExpiresIn(String expiry) {
    return 'Offer expires in $expiry';
  }

  @override
  String get buyFuelNow => 'Buy Fuel Now';
}
