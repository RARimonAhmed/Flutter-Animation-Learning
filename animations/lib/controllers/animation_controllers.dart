import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Animations extends StatefulWidget {
  const Animations({super.key});

  @override
  State<Animations> createState() => _AnimationsState();
}

class _AnimationsState extends State<Animations> with TickerProviderStateMixin {
  late AnimationController animationController;
  late Animation<double> animation;
  bool isPlaying = false;
  @override
  void initState() {
    super.initState();
    animationController = AnimationController(
      vsync: this,
      duration: const Duration(
        seconds: 1,
      ),
    );
    animation = Tween<double>(begin: 1, end: 1.2).animate(animationController);
    animation.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        animationController.reverse();
      } else if (status == AnimationStatus.dismissed) {
        animationController.forward();
      }
    });
  }

  void animatedThis() {
    if (isPlaying) {
      animationController.stop();
    } else {
      animationController.forward();
    }
    setState(() {
      isPlaying = !isPlaying;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ScaleTransition(
          scale: animation,
          child: Container(
            height: 100.h,
            width: 100.w,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage(
                  "images/heart.png",
                ),
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
        FloatingActionButton(
            child: isPlaying
                ? const Icon(Icons.pause_circle)
                : const Icon(Icons.play_circle),
            onPressed: () {
              animatedThis();
            })
      ],
    );
  }
}
