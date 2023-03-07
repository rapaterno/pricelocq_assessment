import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'locq_localization_en.dart';

/// Callers can lookup localized strings with an instance of LocqLocalizations
/// returned by `LocqLocalizations.of(context)`.
///
/// Applications need to include `LocqLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'generated/locq_localization.dart';
///
/// return MaterialApp(
///   localizationsDelegates: LocqLocalizations.localizationsDelegates,
///   supportedLocales: LocqLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the LocqLocalizations.supportedLocales
/// property.
abstract class LocqLocalizations {
  LocqLocalizations(String locale) : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static LocqLocalizations? of(BuildContext context) {
    return Localizations.of<LocqLocalizations>(context, LocqLocalizations);
  }

  static const LocalizationsDelegate<LocqLocalizations> delegate = _LocqLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates = <LocalizationsDelegate<dynamic>>[
    delegate,
    GlobalMaterialLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
  ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('en')
  ];

  /// No description provided for @login.
  ///
  /// In en, this message translates to:
  /// **'Login'**
  String get login;

  /// No description provided for @mobileNumber.
  ///
  /// In en, this message translates to:
  /// **'Mobile Number'**
  String get mobileNumber;

  /// No description provided for @password.
  ///
  /// In en, this message translates to:
  /// **'Password'**
  String get password;

  /// No description provided for @emptyMobileNumberValidation.
  ///
  /// In en, this message translates to:
  /// **'Please enter your mobile number'**
  String get emptyMobileNumberValidation;

  /// No description provided for @invalidMobileNumberValidation.
  ///
  /// In en, this message translates to:
  /// **'Please enter a valid mobile number'**
  String get invalidMobileNumberValidation;

  /// No description provided for @invalidPasswordValidation.
  ///
  /// In en, this message translates to:
  /// **'Please enter your password'**
  String get invalidPasswordValidation;

  /// No description provided for @serverError.
  ///
  /// In en, this message translates to:
  /// **'Oops! Something went wrong. Please try again later'**
  String get serverError;

  /// No description provided for @invalidCredentialsTryAgain.
  ///
  /// In en, this message translates to:
  /// **'Invalid {credential} or password. Please try again.'**
  String invalidCredentialsTryAgain(String credential);

  /// No description provided for @routeNotFound.
  ///
  /// In en, this message translates to:
  /// **'Route not found'**
  String get routeNotFound;

  /// No description provided for @searchStation.
  ///
  /// In en, this message translates to:
  /// **'Search Station'**
  String get searchStation;

  /// No description provided for @whichPriceLOCQStationWillYouLikelyVisit.
  ///
  /// In en, this message translates to:
  /// **'Which PriceLOCQ station will you likely visit'**
  String get whichPriceLOCQStationWillYouLikelyVisit;

  /// No description provided for @nearbyStations.
  ///
  /// In en, this message translates to:
  /// **'Nearby Stations'**
  String get nearbyStations;

  /// No description provided for @done.
  ///
  /// In en, this message translates to:
  /// **'Done'**
  String get done;

  /// No description provided for @kmAwayFromYou.
  ///
  /// In en, this message translates to:
  /// **'{kilometers} km away from you'**
  String kmAwayFromYou(int kilometers);

  /// No description provided for @kmAway.
  ///
  /// In en, this message translates to:
  /// **'{kilometers} km away'**
  String kmAway(int kilometers);

  /// No description provided for @open24hours.
  ///
  /// In en, this message translates to:
  /// **'Open 24 hours'**
  String get open24hours;

  /// No description provided for @openFromTimeToTime.
  ///
  /// In en, this message translates to:
  /// **'Open from {opensAt} to {closesAt}'**
  String openFromTimeToTime(String opensAt, String closesAt);

  /// No description provided for @backToList.
  ///
  /// In en, this message translates to:
  /// **'Back to list'**
  String get backToList;

  /// No description provided for @youGot.
  ///
  /// In en, this message translates to:
  /// **'You got'**
  String get youGot;

  /// No description provided for @discountOff.
  ///
  /// In en, this message translates to:
  /// **'Off'**
  String get discountOff;

  /// No description provided for @onAllFuelProducts.
  ///
  /// In en, this message translates to:
  /// **'on all fuel products'**
  String get onAllFuelProducts;

  /// No description provided for @offerExpiresIn.
  ///
  /// In en, this message translates to:
  /// **'Offer expires in {expiry}'**
  String offerExpiresIn(String expiry);

  /// No description provided for @buyFuelNow.
  ///
  /// In en, this message translates to:
  /// **'Buy Fuel Now'**
  String get buyFuelNow;
}

class _LocqLocalizationsDelegate extends LocalizationsDelegate<LocqLocalizations> {
  const _LocqLocalizationsDelegate();

  @override
  Future<LocqLocalizations> load(Locale locale) {
    return SynchronousFuture<LocqLocalizations>(lookupLocqLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) => <String>['en'].contains(locale.languageCode);

  @override
  bool shouldReload(_LocqLocalizationsDelegate old) => false;
}

LocqLocalizations lookupLocqLocalizations(Locale locale) {


  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'en': return LocqLocalizationsEn();
  }

  throw FlutterError(
    'LocqLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.'
  );
}
