import 'package:flutter/material.dart';
import 'package:watch_test/exercise_page.dart';

class Exercise extends StatefulWidget {
  const Exercise({Key? key}) : super(key: key);

  @override
  State<Exercise> createState() => _ExerciseState();
}

class _ExerciseState extends State<Exercise> {
  @override
  Widget build(BuildContext context) {
    return ExercisePage(
      exerciseTitle: 'Push-Ups',
      endTime: DateTime.now().add(Duration(seconds: 60)),
      exerciseNum: 1,
    );
  }
}
