import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:pricelocq_assessment/config/config.dart';
import 'package:pricelocq_assessment/di/injector.dart';
import 'package:pricelocq_assessment/l10n/generated/locq_localization.dart';
import 'package:pricelocq_assessment/presentation/observers/simple_bloc_observer.dart';
import 'package:pricelocq_assessment/presentation/router/route_generator.dart';
import 'package:pricelocq_assessment/presentation/screens/home_screen.dart';
import 'package:pricelocq_assessment/presentation/theme/theme_data.dart';

void main() {
  Bloc.observer = SimpleBlocObserver();
  WidgetsFlutterBinding.ensureInitialized();

  setupInjector(StagingConfig(baseUrl: 'https://staging.api.locq.com'));

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider.value(value: Injector.mapBloc),
        BlocProvider.value(
          value: Injector.authBloc,
        ),
        BlocProvider.value(
          value: Injector.stationBloc,
        ),
        BlocProvider.value(
          value: Injector.stationBloc,
        ),
      ],
      child: MaterialApp(
        title: 'Locq',
        locale: const Locale('en'),
        supportedLocales: const [Locale('en')],
        localizationsDelegates: const [
          LocqLocalizations.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate
        ],
        onGenerateRoute: RouteGenerator.generateRoute,
        theme: theme,
      ),
    );
  }
}
