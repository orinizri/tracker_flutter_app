import 'package:flutter/material.dart';
import 'package:tracker_app/models/activity.dart';
import 'package:tracker_app/widgets/activities/activities_list.dart';
import 'package:tracker_app/widgets/activities/new_activity.dart';

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
      type: ActivityType.meal,
    ),
    Activity(
      description: null,
      sugarLevel: 100,
      date: DateTime.now(),
      type: ActivityType.sugarTest,
    )
  ];

  Widget mainContent = const Center(
    child: Text('No activities found'),
  );

  void _openActivityOverlay() {
    showModalBottomSheet(
        isScrollControlled: true,
        context: context,
        builder: (modalContext) =>
            NewActivity(_registeredActivities, _addActivity));
  }

  void _addActivity(Activity activity) {
    setState(() {
      _registeredActivities.add(activity);
    });
  }

  void _removeActivity(Activity activity) {
    int activityIndex = _registeredActivities.indexOf(activity);
    setState(() {
      _registeredActivities.remove(activity);
    });
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: const Text('Activity Deleted'),
        action: SnackBarAction(label: 'Undo', onPressed: () {
          setState(() {
            _registeredActivities.insert(activityIndex, activity);
          });
        }),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sugar Tracker'),
        actions: [
          IconButton(
            onPressed: _openActivityOverlay,
            icon: const Icon(Icons.add),
          )
        ],
      ),
      body: Column(children: [
        Expanded(
          child: _registeredActivities.isNotEmpty
              ? ActivitiesList(_registeredActivities, _removeActivity)
              : mainContent,
        ),
      ]),
    );
  }
}
