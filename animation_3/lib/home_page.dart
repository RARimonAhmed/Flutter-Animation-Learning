import 'package:animation_3/glass_view_page.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation<double> animation;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
        duration: const Duration(milliseconds: 200), vsync: this);
    animation = Tween<double>(begin: 0.0, end: -0.05).animate(
      CurvedAnimation(
          parent: controller,
          curve: Curves.easeIn,
          reverseCurve: Curves.easeOut),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapUp: (details) {
        controller.forward();
      },
      onTapDown: (details) {
        controller.reverse();
      },
      child: AnimatedBuilder(
        animation: animation,
        builder: (BuildContext context, child) {
          return Transform.rotate(
            angle: animation.value,
            child: const GlassViewPage(),
          );
        },
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    controller.dispose();
  }
}
