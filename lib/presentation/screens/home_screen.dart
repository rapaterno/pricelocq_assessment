import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:pricelocq_assessment/presentation/widgets/home/locqy_spin_modal.dart';
import 'package:pricelocq_assessment/presentation/widgets/home/success_spin_modal.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: buildBody(),
      floatingActionButton:
          FloatingActionButton(onPressed: (() => triggerAnimation(context))),
    );
  }

  Widget buildBody() {
    //Add home screen

    return Container(
      color: Colors.amber,
    );
  }

  void triggerAnimation(BuildContext context) async {
    final luckySpin = List.generate(4, (index) => Random().nextInt(6));

    final discount = await showDialog<double?>(
      context: context,
      builder: (context) => Center(
        child: LocqSpinModal(
          luckySpin: luckySpin,
        ),
      ),
    );

    if (discount != null) {
      await showDialog(
          context: context,
          builder: (context) =>
              Center(child: SuccessSpinModal(discount: discount)));
    }
  }
}
