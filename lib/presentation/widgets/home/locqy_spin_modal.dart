import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gif/gif.dart';
import 'package:pricelocq_assessment/res/assets.dart';

class NumberClipper extends CustomClipper<Rect> {
  final double value, width, height;
//value is the height of the crop
  NumberClipper(
      {required this.width, required this.height, required this.value});

  @override
  Rect getClip(Size size) {
    return Rect.fromCenter(
        center: Offset(0, value + height / 25),
        width: width,
        height: height / 9);
  }

  @override
  bool shouldReclip(covariant CustomClipper<Rect> oldClipper) => true;
}

class LocqSpinModal extends StatefulWidget {
  const LocqSpinModal({super.key});

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

  int tickCount = 0;

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
    )..duration = Duration(seconds: 1);
    confettiController.stop();
    leverController = GifController(
      vsync: this,
    )..duration = Duration(seconds: 1);
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
    tickCount = 0;
    leverController.reset();
    leverController.forward(from: 0.03);

    numberController.reset();
    numberController.forward();

    confettiController.reset();
    confettiController.forward(from: 0.16);
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox.square(
      dimension: 250,
      child: GestureDetector(
        onTap: () => startAnimation(),
        child: Container(
          // color: ,
          height: double.infinity,
          width: double.infinity,
          child: Stack(
            alignment: Alignment.center,
            children: [
              Positioned(
                child: Align(
                  alignment: FractionalOffset(0.5, 0.4),
                  child: RotationTransition(
                    turns: Tween<double>(begin: 0, end: 1)
                        .animate(backLightController),
                    child: SvgPicture.asset(
                      LocqAssets.backLightSvg,
                      width: 250,
                    ),
                  ),
                ),
              ),
              Container(
                decoration:
                    BoxDecoration(border: Border.all(color: Colors.black)),
                child: Gif(
                  fps: 60,
                  controller: confettiController,
                  image: AssetImage(LocqAssets.animatedConfetti),
                ),
              ),
              ...buildNumberSlots(),
              buildMachineBody(),
              buildButton(),
              Container(
                decoration:
                    BoxDecoration(border: Border.all(color: Colors.black)),
                child: Gif(
                  fps: 60,
                  controller: leverController,
                  image: AssetImage(LocqAssets.animatedLever),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Positioned buildButton() {
    const double originalValue = 120;
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

    return Positioned(
      child: Align(
        alignment: FractionalOffset(0.515, 0.635),
        child: SvgPicture.asset(
          LocqAssets.button,
          width: value,
        ),
      ),
    );
  }

  Widget buildMachineBody() {
    return Positioned(
      child: Align(
        alignment: FractionalOffset(0.41, 0.534),
        child: SvgPicture.asset(
          LocqAssets.slotMachineBodySvg,
          width: 250,
        ),
      ),
    );
  }

  List<Widget> buildNumberSlots() {
    return [
      Positioned(
        child: buildNumberSlot(0, 1),
      ),
      Positioned(
        child: buildNumberSlot(1, 0.2789),
      ),
      Positioned(
        child: buildNumberSlot(2.4, 0.88),
      ),
      Positioned(
        child: buildNumberSlot(3.5, 0.94),
      )
    ];
  }

  LayoutBuilder buildNumberSlot(double positionIndex, double numberIndex) {
    return LayoutBuilder(builder: (context, constraints) {
      final offset = (fullAnimation.value * numberIndex) *
          (constraints.biggest.height / 1.57);
      const verticalPosition = 2.1;
      final verticalPositionOffset =
          ((fullAnimation.value * numberIndex) * 2.632);
      return Align(
          alignment: FractionalOffset(0.335 + (0.09 * positionIndex),
              verticalPosition - verticalPositionOffset),
          child: ClipRect(
            clipper: NumberClipper(
                value: offset, width: 60, height: constraints.biggest.height),
            // clipper: ,
            child: SvgPicture.asset(
              LocqAssets.numbers,
              // width: 250,
              height: 600,
              allowDrawingOutsideViewBox: true,
            ),
          ));
    });
  }
}
