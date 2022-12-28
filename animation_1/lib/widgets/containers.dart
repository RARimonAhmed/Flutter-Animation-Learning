// ignore_for_file: public_member_api_docs, sort_constructors_first
// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

class MyContainer extends StatefulWidget {
  bool selected;
  Alignment alignment, alignment2;
  MyContainer({
    Key? key,
    required this.selected,
    required this.alignment,
    required this.alignment2,
  }) : super(key: key);

  @override
  State<MyContainer> createState() => _MyContainerState();
}

class _MyContainerState extends State<MyContainer> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 250,
      height: 250,
      child: AnimatedAlign(
        alignment: widget.selected ? widget.alignment2 : widget.alignment,
        duration: const Duration(seconds: 1),
        curve: Curves.fastOutSlowIn,
        child: const FlutterLogo(size: 50),
      ),
    );
  }
}
