import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: buildBody(),
      floatingActionButton: FloatingActionButton(onPressed: triggerAnimation),
    );
  }

  Widget buildBody() {
    return Stack();
  }

  void triggerAnimation() {}
}
