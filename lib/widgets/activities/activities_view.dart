import 'package:flutter/material.dart';
import 'package:tracker_app/models/activity.dart';
import 'package:tracker_app/widgets/activities/activities_list.dart';

class ActivitiesView extends StatefulWidget {
  const ActivitiesView({super.key});

  @override
  State<StatefulWidget> createState() {
    return _ActivitiesView();
  }
}

class _ActivitiesView extends State<ActivitiesView> {
  final List<Activity> _registeredActivities = [
    Activity(
        description: 'Ate an apple',
        sugarLevel: null,
        date: DateTime.now(),
        type: ActivityType.meal),
    Activity(
        description: null,
        sugarLevel: 100,
        date: DateTime.now(),
        type: ActivityType.sugarTest)
  ];

  @override
  Widget build(BuildContext context) {
    return ActivitiesList(_registeredActivities);
  }
}
