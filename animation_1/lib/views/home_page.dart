import 'package:flutter/material.dart';

import '../widgets/containers.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool selected = false;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          selected = !selected;
        });
      },
      child: Center(
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                children: [
                  Container(
                    decoration: const BoxDecoration(
                        color: Colors.blueAccent,
                        borderRadius: BorderRadius.only(
                            bottomRight: Radius.circular(20))),
                    child: MyContainer(
                      selected: selected,
                      alignment: Alignment.topLeft,
                      alignment2: Alignment.bottomRight,
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                    width: 10,
                  ),
                  Container(
                    decoration: const BoxDecoration(
                        color: Colors.blueAccent,
                        borderRadius:
                            BorderRadius.only(bottomLeft: Radius.circular(20))),
                    child: MyContainer(
                      selected: selected,
                      alignment: Alignment.topRight,
                      alignment2: Alignment.bottomLeft,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
                width: 10,
              ),
              Row(
                children: [
                  Container(
                    decoration: const BoxDecoration(
                        color: Colors.blueAccent,
                        borderRadius:
                            BorderRadius.only(topRight: Radius.circular(20))),
                    child: MyContainer(
                      selected: selected,
                      alignment: Alignment.bottomLeft,
                      alignment2: Alignment.topRight,
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                    width: 10,
                  ),
                  Container(
                    decoration: const BoxDecoration(
                        color: Colors.blueAccent,
                        borderRadius:
                            BorderRadius.only(topLeft: Radius.circular(20))),
                    child: MyContainer(
                      selected: selected,
                      alignment: Alignment.bottomRight,
                      alignment2: Alignment.topLeft,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
