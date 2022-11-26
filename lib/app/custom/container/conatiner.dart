import 'package:flutter/material.dart';

class CustomConatiner extends StatelessWidget {
  const CustomConatiner({Key? key, required this.anyText}) : super(key: key);
  final Text anyText;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(),
        borderRadius: BorderRadius.circular(20),
        color: Colors.white,
      ),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: anyText,
      ),
    );
  }
}
