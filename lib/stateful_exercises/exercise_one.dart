import 'package:flutter/material.dart';

class ExerciseOne extends StatelessWidget {
  const ExerciseOne({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SquareButton(),
      ),
    );
  }
}

class SquareButton extends StatefulWidget {
  const SquareButton({super.key});

  @override
  State<SquareButton> createState() => _SquareButtonState();
}

class _SquareButtonState extends State<SquareButton> {
  Color _color = Colors.blue;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _onTap,
      child: Container(
        height: 100,
        width: 100,
        decoration: BoxDecoration(
          color: _color,
          borderRadius: BorderRadius.circular(30),
        ),
      ),
    );
  }

  void _onTap() {
    setState(() {
      _color = _color == Colors.blue ? Colors.orange : Colors.blue;
    });
  }
}
