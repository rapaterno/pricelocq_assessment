import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:pricelocq_assessment/presentation/widgets/home/locqy_spin_modal.dart';

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
    // return Stack(
    //   children: [
    //     Positioned.fill(
    //       left: 0,
    //       right: 0,
    //       // height: double.infinity,
    //       child: LocqSpinModal(),
    //     ),
    //   ],
    // );
    return Container();
  }

  void triggerAnimation(BuildContext context) async {
    await showDialog(
      context: context,
      builder: (context) {
        return Dialog(
          backgroundColor: Colors.transparent,
          child: LocqSpinModal(),
        );
      },
    );
  }
}
