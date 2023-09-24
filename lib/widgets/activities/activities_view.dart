import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:tracker_app/widgets/chart/chart.dart';
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
      sugarLevel: 100,
      date: DateTime.now(),
      type: ActivityType.meal,
    ),
    Activity(
      description: null,
      sugarLevel: 87,
      date: DateTime.parse("2023-09-20"),
      type: ActivityType.sugarTest,
    )
  ];

  Widget mainContent = const Center(
    child: Text('No activities found'),
  );

  void _openActivityOverlay() {
    showModalBottomSheet(
        useSafeArea: true,
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
        action: SnackBarAction(
            label: 'Undo',
            onPressed: () {
              setState(() {
                _registeredActivities.insert(activityIndex, activity);
              });
            }),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    // final screenWidth = MediaQuery.of(context).size.width;
    // print("screenWidth");
    // print(screenWidth);

    return LayoutBuilder(builder: (ctx, constraints) {
      double width = constraints.maxWidth;
      double height = constraints.maxHeight;
      print("width");
      print(width);
      print("height");
      print(height);
      return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          title: const Text('Sugar Tracker'),
          actions: [
            IconButton(
              onPressed: _openActivityOverlay,
              icon: const Icon(Icons.add),
            )
          ],
        ),
        body: width > 800
            ? height < 200
                ? Column(children: [
                    Flexible(
                      flex: 1,
                      child: _registeredActivities.isNotEmpty
                          ? ActivitiesList(
                              _registeredActivities, _removeActivity)
                          : mainContent,
                    ),
                  ])
                : Column(children: [
                    Flexible(child: Chart(activities: _registeredActivities)),
                    Flexible(
                      flex: 1,
                      child: _registeredActivities.isNotEmpty
                          ? ActivitiesList(
                              _registeredActivities, _removeActivity)
                          : mainContent,
                    ),
                  ])
            : Row(children: [
                Flexible(
                  flex: 1,
                  child: Chart(activities: _registeredActivities),
                ),
                Flexible(
                  flex: 1,
                  child: _registeredActivities.isNotEmpty
                      ? ActivitiesList(_registeredActivities, _removeActivity)
                      : mainContent,
                ),
              ]),
      );
    });
  }
}
