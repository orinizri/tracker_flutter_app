import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:uuid/uuid.dart';

const uuid = Uuid();

final formatter = DateFormat.yMd();

enum ActivityType { meal, sugarTest }

const categoryIcons = {
  ActivityType.meal: Icons.lunch_dining,
  ActivityType.sugarTest: Icons.monitor_heart,
};

class Activity {
  Activity({
    required this.description,
    this.sugarLevel,
    required this.date,
    required this.type,
  }) : id = uuid.v4();

  final String id;
  final String? description;
  final int? sugarLevel;
  final DateTime date;
  final ActivityType type;


  get formattedDate {
    return DateFormat('yyyy-MM-dd kk:mm').format(date);
  }
}
