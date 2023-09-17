import 'package:flutter/material.dart';
import 'package:tracker_app/widgets/activities/activities_view.dart';
import 'package:tracker_app/chart.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<StatefulWidget> createState() {
    return _HomePage();
  }
}

class _HomePage extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return const Column(children: [
      Expanded(
        child: ActivitiesView(),
      ),
    ]);
  }
}
