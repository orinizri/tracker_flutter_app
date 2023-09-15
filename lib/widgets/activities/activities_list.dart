import 'package:flutter/material.dart';
import 'package:tracker_app/models/activity.dart';
import 'package:tracker_app/widgets/activities/activity_item.dart';

class ActivitiesList extends StatelessWidget {
  const ActivitiesList(this.activities, {super.key});

  final List<Activity> activities;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, index) => ActivityItem(
        activityItem: activities[index],
      ),
      itemCount: activities.length,
    );
  }
}
