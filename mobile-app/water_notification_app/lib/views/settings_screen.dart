import 'package:flutter/material.dart';

class SettingsScreen extends StatefulWidget {
  @override
  _SettingsScreenState createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  int _selectedInterval = 2;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Settings')),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('Set Reminder Interval:'),
          DropdownButton<int>(
            value: _selectedInterval,
            items: [1, 2, 3, 4].map((int value) {
              return DropdownMenuItem<int>(
                value: value,
                child: Text('$value hours'),
              );
            }).toList(),
            onChanged: (newValue) {
              setState(() {
                _selectedInterval = newValue!;
              });
            },
          ),
        ],
      ),
    );
  }
}