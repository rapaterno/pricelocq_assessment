import 'package:flutter/material.dart';
import 'package:pricelocq_assessment/data/model/time.dart';
import 'package:pricelocq_assessment/l10n/generated/locq_localization.dart';

class SelectedStationTile extends StatelessWidget {
  const SelectedStationTile({
    super.key,
    required this.stationName,
    required this.address,
    required this.city,
    required this.province,
    required this.distanceFromUser,
    required this.opensAt,
    required this.closesAt,
  });

  final String stationName, address, city, province;
  final double? distanceFromUser; //kilometers
  final Time opensAt;
  final Time closesAt;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            stationName,
            style: textTheme.subtitle2,
          ),
          Text(
            address,
            style: textTheme.caption,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
          Text(
            '${city.toUpperCase()}, ${province.toUpperCase()}',
            style: textTheme.caption,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
          const SizedBox(height: 20),
          buildDetails(context)
        ],
      ),
    );
  }

  Widget buildIconWithLabel(IconData icon, String label, TextTheme textTheme) {
    return Row(
      children: [
        Icon(
          icon,
          size: 16,
        ),
        const SizedBox(
          width: 4,
        ),
        Text(
          label,
          style: textTheme.caption,
          overflow: TextOverflow.ellipsis,
        )
      ],
    );
  }

  Widget buildDetails(BuildContext context) {
    final localizations = LocqLocalizations.of(context)!;
    final textTheme = Theme.of(context).textTheme;
    return Row(
      children: [
        if (distanceFromUser != null)
          buildIconWithLabel(Icons.directions_car_filled_outlined,
              localizations.kmAway(distanceFromUser!), textTheme),
        const SizedBox(
          width: 12,
        ),
        buildIconWithLabel(
            Icons.access_time, getOpenDetailText(context), textTheme),
      ],
    );
  }

  String getOpenDetailText(BuildContext context) {
    final localizations = LocqLocalizations.of(context)!;
    if (opensAt.isStartOfDay() && closesAt.isEndOfDay()) {
      return localizations.open24hours;
    } else {
      return localizations.openFromTimeToTime(
          opensAt.toFormattedString(), closesAt.toFormattedString());
    }
  }
}
