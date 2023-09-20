import 'package:flutter/material.dart';
import 'package:tracker_app/models/activity.dart';
import 'package:tracker_app/widgets/activities/activity_item.dart';

class ActivitiesList extends StatelessWidget {
  ActivitiesList(this.activities, this.removeActivity, {super.key});
  void Function(Activity activity) removeActivity;
  final List<Activity> activities;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, index) => Dismissible(
          key: ValueKey(activities[index]),
          onDismissed: (direction) {
            removeActivity(activities[index]);
          },
          child: ActivityItem(activityItem: activities[index])),
      itemCount: activities.length,
    );
  }
}
