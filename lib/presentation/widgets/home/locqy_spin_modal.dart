import 'dart:developer';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:geolocator/geolocator.dart';
import 'package:gif/gif.dart';
import 'package:pricelocq_assessment/res/assets.dart';
import 'package:pricelocq_assessment/res/colors.dart';

class NumberClipper extends CustomClipper<Rect> {
  final double value, width, height;
//value is the height of the crop
  NumberClipper(
      {required this.width, required this.height, required this.value});

  @override
  Rect getClip(Size size) {
    return Rect.fromCenter(
        center: Offset(0, value), width: width, height: height);
  }

  @override
  bool shouldReclip(covariant CustomClipper<Rect> oldClipper) => true;
}

class LocqSpinModal extends StatefulWidget {
  const LocqSpinModal({super.key, required this.luckySpin});
  final List<int> luckySpin;

  @override
  State<LocqSpinModal> createState() => _LocqSpinModalState();
}

class _LocqSpinModalState extends State<LocqSpinModal>
    with TickerProviderStateMixin {
  late final GifController leverController, confettiController;
  late AnimationController backLightController;
  late AnimationController numberController;
  late AnimationController buttonController;

  late Animation<double> _animation;
  late Animation<double> fullAnimation;
  late Animation<double> buttonAnimation;

  @override
  void initState() {
    super.initState();

    numberController = AnimationController(
        duration: const Duration(milliseconds: 1000), vsync: this);
    fullAnimation = Tween(begin: 0.0, end: 1.0).animate(
        CurvedAnimation(parent: numberController, curve: Curves.easeInOut))
      ..addListener(() {
        setState(() {});
      });

    confettiController = GifController(
      vsync: this,
    )..duration = const Duration(seconds: 1);

    confettiController.stop();

    leverController = GifController(
      vsync: this,
    )..duration = const Duration(seconds: 1);

    leverController.stop();
    backLightController =
        AnimationController(vsync: this, duration: const Duration(seconds: 4))
          ..repeat();
    _animation = Tween<double>(begin: 0, end: 0.08).animate(leverController);
    _animation.addListener(() {
      setState(() {
        if (leverController.value > 0.08) {
          leverController.stop();
        }
      });
    });
  }

  @override
  void dispose() {
    leverController.dispose();
    numberController.dispose();
    confettiController.dispose();
    backLightController.dispose();
    super.dispose();
  }

  void startAnimation() {
    if (numberController.isCompleted) {
      final discountText =
          '${widget.luckySpin[0]}${widget.luckySpin[1]}.${widget.luckySpin[2]}${widget.luckySpin[3]}';

      Navigator.of(context).pop(double.tryParse(discountText));
    }

    leverController.reset();
    leverController.forward(from: 0.03);

    numberController.reset();
    numberController.forward();

    confettiController.reset();
    confettiController.forward(from: 0.16);
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 500,
      width: 350,
      child: GestureDetector(
        onTap: () => startAnimation(),
        child: Container(
          child: Stack(
            alignment: Alignment.center,
            children: [
              Positioned(
                top: 120,
                child: Align(
                  child: RotationTransition(
                    turns: Tween<double>(begin: 0, end: 1)
                        .animate(backLightController),
                    child: SvgPicture.asset(
                      LocqAssets.backLightSvg,
                      width: 150,
                    ),
                  ),
                ),
              ),
              Gif(
                fps: 60,
                controller: confettiController,
                image: const AssetImage(LocqAssets.animatedConfetti),
              ),
              Positioned.fill(child: buildNumberSlots()),
              buildMachineContainer(),
              buildPlaceholderLever(),
              buildAnimatedLever(),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildPlaceholderLever() {
    return Positioned(
      right: 47,
      child: Opacity(
        opacity: leverController.isAnimating ? 0 : 1,
        child: SvgPicture.asset(
          LocqAssets.placeholderLever,
          height: 71,
        ),
      ),
    );
  }

  Positioned buildAnimatedLever() {
    return Positioned.fill(
      right: -17,
      top: -30,
      child: Gif(
        fps: 60,
        controller: leverController,
        image: const AssetImage(LocqAssets.animatedLever),
      ),
    );
  }

  Positioned buildButton() {
    const double originalValue = 130;
    const double sizeDecrease = 60;
    final animationValue = fullAnimation.value;
    double value;

    if (0 <= animationValue && animationValue <= 0.2) {
      value = originalValue - sizeDecrease * animationValue;
    } else if (0.2 <= animationValue && animationValue <= 0.4) {
      value = originalValue -
          sizeDecrease * (0.2) +
          sizeDecrease * (animationValue - 0.2);
    } else {
      value = originalValue;
    }

    return Positioned.fill(
      top: 170,
      child: Align(
        child: SvgPicture.asset(
          LocqAssets.button,
          width: value,
        ),
      ),
    );
  }

  buildMachineContainer() {
    return SizedBox.square(
      dimension: 350,
      child: Stack(
        children: [
          Positioned.fill(
              right: 60,
              left: 25,
              child: SvgPicture.asset(
                LocqAssets.slotMachineBodySvg,
              )),
          buildButton()
        ],
      ),
    );
  }

  Widget buildNumberSlots() {
    return ClipRect(
        clipper: NumberClipper(width: 500, height: 80, value: 260),
        child: Stack(children: [
          buildNumberSlot(133, widget.luckySpin[0]),
          buildNumberSlot(63, widget.luckySpin[1]),
          buildNumberSlot(-35, widget.luckySpin[2]),
          buildNumberSlot(-108, widget.luckySpin[3])
        ]));
  }

  Positioned buildNumberSlot(
    double horizontalPositionOffset,
    int number,
  ) {
    const verticalPosition = 499;
    final verticalPositionOffset =
        fullAnimation.value * (1025 - (64 * (5 - number)));

    return Positioned.fill(
        top: verticalPosition - verticalPositionOffset,
        right: horizontalPositionOffset,
        child: Align(
          child: SvgPicture.asset(
            LocqAssets.numbers,
            fit: BoxFit.fitWidth,
            width: 30,
            clipBehavior: Clip.none,
            allowDrawingOutsideViewBox: true,
            // ),
          ),
        ));
  }
}
