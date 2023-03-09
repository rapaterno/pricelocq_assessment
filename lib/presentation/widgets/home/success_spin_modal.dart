import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pricelocq_assessment/l10n/generated/locq_localization.dart';
import 'package:pricelocq_assessment/res/assets.dart';
import 'package:pricelocq_assessment/res/colors.dart';

class SuccessSpinModal extends StatelessWidget {
  const SuccessSpinModal({super.key, required this.discount});

  final double discount;

  @override
  Widget build(BuildContext context) {
    final localizations = LocqLocalizations.of(context)!;

    return SizedBox(
      height: 550,
      width: 250,
      child: Column(
        children: [
          Expanded(child: buildDiscountModalContainer()),
          ElevatedButton(
              onPressed: (() => Navigator.of(context).pop(true)),
              child: Text(localizations.buyFuelNow))
        ],
      ),
    );
  }

  Widget buildDiscountText() {
    return Builder(builder: (context) {
      final localizations = LocqLocalizations.of(context)!;
      final textTheme = Theme.of(context).textTheme;
      return Column(
        children: [
          Text(localizations.youGot, style: textTheme.bodyMedium),
          const SizedBox(height: 12),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("₱$discount / L",
                  style:
                      textTheme.headline6?.copyWith(color: LocqColors.purple)),
              const SizedBox(
                width: 10,
              ),
              Text(localizations.discountOff, style: textTheme.bodyMedium),
            ],
          ),
          const SizedBox(height: 12),
          Text(localizations.onAllFuelProducts, style: textTheme.bodyMedium),
          const SizedBox(height: 80),
          Text(
            localizations.offerExpiresIn("N/A"),
            style: textTheme.bodySmall?.copyWith(
              color: LocqColors.gray,
            ),
          ),
        ],
      );
    });
  }

  Widget buildDiscountModalContainer() {
    return Stack(
      children: [
        Positioned.fill(child: SvgPicture.asset(LocqAssets.discountModel)),
        Positioned.fill(
          top: 250,
          child: buildDiscountText(),
        ),
      ],
    );
  }
}
