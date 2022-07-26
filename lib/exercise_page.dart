import 'package:flutter/material.dart';

class ExercisePage extends StatefulWidget {
  final DateTime endTime;
  final String exerciseTitle;
  final int exerciseNum;

  const ExercisePage({
    Key? key,
    required this.exerciseTitle,
    required this.endTime,
    required this.exerciseNum,
  }) : super(key: key);

  @override
  State<ExercisePage> createState() => _ExercisePageState();
}

class _ExercisePageState extends State<ExercisePage> {
  @override
  void initState() {
    super.initState();
    _updateTiming(null);
  }

  @override
  Widget build(BuildContext context) {
    final currentDatetime = DateTime.now();
    final durationSinceStart = widget.endTime.difference(currentDatetime);

    return Column(
      children: [
        Text(widget.exerciseNum.toString()),
        Text(
          '${durationSinceStart.inMinutes}:${durationSinceStart.inSeconds % 60}',
          style: Theme.of(context).textTheme.headline1,
        ),
        Text(
          this.widget.exerciseTitle,
          style: Theme.of(context).textTheme.headline3,
        ),
        // Text
      ],
    );
  }

  void _updateTiming(dynamic) {
    setState(() => {});
    Future.delayed(Duration(milliseconds: 64)).then(_updateTiming);
  }
}
