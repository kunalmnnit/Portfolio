import 'package:flutter/material.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

class TechnicalSkills extends StatelessWidget {
  const TechnicalSkills({Key key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ListView(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      padding: const EdgeInsets.all(
        24,
      ),
      children: [
        const Align(
          child: Text(
            'Technical Skills',
            textScaleFactor: 2,
          ),
        ),
        const SizedBox(
          height: 16,
        ),
        ...[
          ['C++', .85],
          ['C', .65],
          ['Java', .75],
          ['Android', .65],
          ['Flutter', .45],
          ['Dart', .45],
        ]
            .map(
              (e) => ListTile(
                title: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  child: Text(
                    e.first,
                  ),
                ),
                subtitle: LinearPercentIndicator(
                  percent: e.last,
                  lineHeight: 15,
                  animationDuration: 1500,
                  animation: true,
                  progressColor: Theme.of(context).accentColor,
                  linearStrokeCap: LinearStrokeCap.roundAll,
                ),
              ),
            )
            .toList(),
      ],
    );
  }
}
