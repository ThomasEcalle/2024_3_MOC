import 'package:flutter/material.dart';
import 'package:moc_2024_3/layouts/red_circle.dart';

class LayoutsScreen extends StatelessWidget {
  const LayoutsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    return SafeArea(
      child: LayoutBuilder(
        builder: (context, constraints) {
          final availableHeight = constraints.maxHeight;
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  child: Container(
                    child: Column(
                      children: [
                        Expanded(
                          flex: 2,
                          child: Container(
                            color: Colors.yellow,
                          ),
                        ),
                        Expanded(
                          child: Container(
                            width: double.infinity,
                            color: Colors.amber,
                            child: const Padding(
                              padding: EdgeInsets.symmetric(
                                horizontal: 12,
                                vertical: 10,
                              ),
                              child: Wrap(
                                direction: Axis.horizontal,
                                spacing: 10,
                                runSpacing: 5,
                                children: [
                                  RedCircle(),
                                  RedCircle(),
                                  RedCircle(),
                                  RedCircle(),
                                  RedCircle(),
                                  RedCircle(),
                                  RedCircle(),
                                  RedCircle(),
                                  RedCircle(),
                                  RedCircle(),
                                  RedCircle(),
                                  RedCircle(),
                                  RedCircle(),
                                  RedCircle(),
                                  RedCircle(),
                                  RedCircle(),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: Stack(
                    children: [
                      Row(
                        children: [
                          Expanded(
                            child: Container(
                              color: Colors.blue,
                              height: double.infinity,
                              child: const Padding(
                                padding: EdgeInsets.all(8.0),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    RedCircle(),
                                    SizedBox(width: 5),
                                    RedCircle(),
                                    Spacer(),
                                    RedCircle(),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            child: Container(
                              color: Colors.purple,
                            ),
                          ),
                        ],
                      ),
                      Positioned.fill(
                        child: Container(
                          color: Colors.black.withOpacity(.1),
                        ),
                      ),
                      Center(
                        child: Container(
                          height: 100,
                          width: 100,
                          color: Colors.red,
                        ),
                      ),

                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
