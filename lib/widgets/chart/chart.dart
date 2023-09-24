import 'package:flutter/material.dart';
import 'package:tracker_app/widgets/chart/chart_bar.dart';
import 'package:tracker_app/models/activity.dart';

class Chart extends StatelessWidget {
  const Chart({super.key, required this.activities});

  final List<Activity> activities;

  double get activitiesSum {
    double activitiesSum = 0;
    for (final activity in activities) {
        activitiesSum += activity.sugarLevel as double;
    }
    return activitiesSum;
  }

  @override
  Widget build(BuildContext context) {
    activities.sort((a,b) => a.date.compareTo(b.date));
    // final isDarkMode = MediaQuery.of(context).platformBrightness == Brightness.dark;
    return Container(
      margin: const EdgeInsets.all(16),
      padding: const EdgeInsets.symmetric(
        vertical: 16,
        horizontal: 8,
      ),
      width: double.infinity,
      height: 200,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        gradient: LinearGradient(
          colors: [
            Theme.of(context).colorScheme.primary.withOpacity(0.3),
            Theme.of(context).colorScheme.primary.withOpacity(0.0)
          ],
          begin: Alignment.bottomCenter,
          end: Alignment.topCenter,
        ),
      ),
      child: Column(
        children: [
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                for (final activity in activities)
                  ChartBar(
                    fill: activity.sugarLevel != null ? activity.sugarLevel! / activitiesSum : 0,
                  )
              ],
            ),
          ),
          const SizedBox(height: 12),
          Row(
            children: activities
                .map(
                  (activity) => Expanded(
                    child: Padding(
                      padding:  const EdgeInsets.symmetric(horizontal: 4),
                      child: Center(child: Text(formatter.format(activity.date))),
                      // Icon(
                      //   categoryIcons[activity.type],
                      //   color: isDarkMode
                      //       ? Theme.of(context).colorScheme.secondary
                      //       : Theme.of(context)
                      //           .colorScheme
                      //           .primary
                      //           .withOpacity(0.7),
                      // ),
                    ),
                  ),
                ).toList(),
          )
        ],
      ),
    );
  }
}