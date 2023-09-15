import 'package:flutter/material.dart';
import 'package:tracker_app/models/activity.dart';

class ActivityItem extends StatelessWidget {
  const ActivityItem({super.key, required this.activityItem});

  final Activity activityItem;

  @override
  Widget build(BuildContext context) {
    // return Column(
    //   children: [
    //     Text(activityItem.id),
    //     Text(activityItem.date.toString()),
    //     Text(activityItem.sugarLevel.toString()),
    //     Text(activityItem.description.toString()),
    //   ],
    // );
    return Card(
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 16,
        ),
        child: Column(
          children: [
            Row(children: [
              Icon(categoryIcons[activityItem.type]),
              const SizedBox(width: 6),
              Text(activityItem.formattedDate),
            ]),
            const SizedBox(
              height: 6,
            ),
            Row(children: [
              Text(activityItem.description.toString()),
              const Spacer(),
              Text(activityItem.sugarLevel.toString()),
            ]),
          ],
        ),
      ),
    );
  }
}
