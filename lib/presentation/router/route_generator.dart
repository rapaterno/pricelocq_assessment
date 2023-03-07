import 'package:flutter/material.dart';
import 'package:pricelocq_assessment/presentation/router/routes.dart';
import 'package:pricelocq_assessment/presentation/screens/route_not_found_screen.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(
    RouteSettings settings,
  ) {
    switch (settings.name) {
      case LocqRoutes.loginScreen:
        return MaterialPageRoute(
          settings: settings,
          builder: (_) => const Placeholder(),
        );
      default:
        return MaterialPageRoute(
          settings: settings,
          builder: (_) => const RouteNotFoundScreen(),
        );
    }
  }
}
