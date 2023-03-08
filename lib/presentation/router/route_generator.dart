import 'package:flutter/material.dart';
import 'package:pricelocq_assessment/presentation/router/routes.dart';
import 'package:pricelocq_assessment/presentation/screens/landing_screen.dart';
import 'package:pricelocq_assessment/presentation/screens/login_screen.dart';
import 'package:pricelocq_assessment/presentation/screens/route_not_found_screen.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(
    RouteSettings settings,
  ) {
    switch (settings.name) {
      case LocqRoutes.loginScreen:
        return MaterialPageRoute(
          settings: settings,
          builder: (_) => const LoginScreen(),
        );
      case LocqRoutes.landingScreen:
        return MaterialPageRoute(
          settings: settings,
          builder: (_) => const LandingScreen(),
        );
      default:
        return MaterialPageRoute(
          settings: settings,
          builder: (_) => const RouteNotFoundScreen(),
        );
    }
  }
}
