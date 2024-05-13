import 'package:flutter/material.dart';

class ExerciseTwo extends StatefulWidget {
  const ExerciseTwo({super.key});

  @override
  State<ExerciseTwo> createState() => _ExerciseTwoState();
}

class _ExerciseTwoState extends State<ExerciseTwo> {
  Color _color = Colors.blue;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SquareButton(
          color: _color,
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _onPressed,
        child: const Icon(Icons.format_paint),
      ),
    );
  }

  void _onPressed() {
    setState(() {
      _color = _color == Colors.blue ? Colors.pink : Colors.blue;
    });
  }
}

class SquareButton extends StatelessWidget {
  const SquareButton({
    super.key,
    required this.color,
  });

  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      width: 100,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(30),
      ),
    );
  }
}
