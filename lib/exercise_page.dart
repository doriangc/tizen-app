import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

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
  Duration? lastDurationSinceStart;

  @override
  void initState() {
    super.initState();
    _updateTiming(null);
  }

  @override
  Widget build(BuildContext context) {
    final currentDatetime = DateTime.now();
    final durationSinceStart = widget.endTime.difference(currentDatetime);

    if (durationSinceStart.inSeconds != lastDurationSinceStart?.inSeconds) {
      HapticFeedback.heavyImpact();
    }

    lastDurationSinceStart = durationSinceStart;

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          '${widget.exerciseNum.toString()} / 5',
          style: Theme.of(context).textTheme.headline4,
        ),
        Text(
          '${durationSinceStart.inMinutes.toString().padLeft(2, '0')}:${(durationSinceStart.inSeconds % 60).toString().padLeft(2, '0')}',
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
