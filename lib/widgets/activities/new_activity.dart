import 'package:flutter/material.dart';
import 'package:tracker_app/models/activity.dart';

class NewActivity extends StatefulWidget {
  const NewActivity(this.registeredActivities, {super.key});
  final List<Activity> registeredActivities;
  @override
  State<StatefulWidget> createState() {
    return _NewActivity();
  }
}

class _NewActivity extends State<NewActivity> {
  final _descriptionController = TextEditingController();
  final _sugarLevelController = TextEditingController();
  DateTime? _selectedDate;
  ActivityType _selectedActivityType = ActivityType.meal;

  void _presetDatePicker() async {
    final now = DateTime.now();
    DateTime? datePicker = await showDatePicker(
      context: context,
      initialDate: now,
      firstDate: DateTime(now.year - 1, now.month, now.day),
      lastDate: now,
    );
    setState(() {
      _selectedDate = datePicker;
    });
  }

  void _submitForm() {
    final enteredSugarLevel = double.tryParse(_sugarLevelController.text);
    final validSugarLevel = enteredSugarLevel == null || enteredSugarLevel <= 0;
    if (_descriptionController.text.trim().isEmpty ||
        validSugarLevel ||
        _selectedDate == null) {
      showDialog(
          context: context,
          builder: (dialogContext) {
            return AlertDialog(
              title: const Text('Invalid Input'),
              content: const Text('Please make sure all inputs are entered.'),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text('Ok'),
                )
              ],
            );
          });
      return;
    }
    setState(() {
      widget.registeredActivities.add(
        Activity(
          description: _descriptionController.text.trim(),
          date: _selectedDate!,
          type: _selectedActivityType,
          sugarLevel: enteredSugarLevel.toInt(),
        ),
      );
    });
    Navigator.pop(context);
  }

  @override
  void dispose() {
    _descriptionController.dispose();
    _sugarLevelController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          TextField(
            maxLength: 50,
            decoration: const InputDecoration(label: Text('Description')),
            controller: _descriptionController,
          ),
          Row(
            children: [
              Expanded(
                child: TextField(
                  maxLength: 3,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(label: Text('Sugar Level')),
                  controller: _sugarLevelController,
                ),
              ),
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(_selectedDate == null
                        ? 'Select Date'
                        : formatter.format(_selectedDate!)),
                    IconButton(
                      onPressed: _presetDatePicker,
                      icon: const Icon(Icons.calendar_month),
                    ),
                  ],
                ),
              ),
            ],
          ),
          Row(
            children: [
              DropdownButton(
                value: _selectedActivityType,
                items: ActivityType.values
                    .map(
                      (activityType) => DropdownMenuItem(
                        value: activityType,
                        child: Text(
                          activityType.name.toUpperCase(),
                        ),
                      ),
                    )
                    .toList(),
                onChanged: (value) {
                  if (value == null) {
                    return;
                  }
                  setState(() {
                    _selectedActivityType = value;
                  });
                },
              ),
              const Spacer(),
              ElevatedButton(
                onPressed: _submitForm,
                child: const Text('Save Activity'),
              ),
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text('Cancel'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}