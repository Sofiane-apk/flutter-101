import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class BMIScreenResult extends StatelessWidget {
  final int age;
  final bool isMale;
  final double result;

  const BMIScreenResult(
      {required this.age, required this.isMale, required this.result});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('BMI Result'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Gender : ${isMale ? 'Male' : 'Female'}',
              style: const TextStyle(fontSize: 30),
            ),
            Text(
              'age : $age',
              style: const TextStyle(fontSize: 30),
            ),
            Text(
              'Result : ${result.round()}',
              style: const TextStyle(fontSize: 30),
            ),
          ],
        ),
      ),
    );
  }
}
