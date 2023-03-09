import 'package:flutter/material.dart';
import 'package:pricelocq_assessment/l10n/generated/locq_localization.dart';

class StationListTile extends StatelessWidget {
  const StationListTile(
      {super.key,
      required this.stationName,
      required this.distanceFromUser,
      required this.onTap});
  final String stationName;
  final double? distanceFromUser; //Kilometers
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return ListTile(
      onTap: onTap,
      title: Text(stationName, style: textTheme.subtitle2),
      subtitle: buildDistanceFromUser(context),
      trailing: Radio(
          value: false, groupValue: true, toggleable: false, onChanged: (_) {}),
    );
  }

  Widget? buildDistanceFromUser(BuildContext context) {
    final localizations = LocqLocalizations.of(context)!;
    final textTheme = Theme.of(context).textTheme;

    if (distanceFromUser != null) {
      return Text(
        localizations.kmAwayFromYou(distanceFromUser!),
        style: textTheme.caption,
      );
    }

    return null;
  }
}
