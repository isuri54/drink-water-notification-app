import 'package:flutter/material.dart';
import 'package:water_notification_app/services/notification_service.dart';
import 'package:water_notification_app/views/home_view.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  NotificationService().initNotifications();
  runApp(WaterReminderApp());
}

class WaterReminderApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Water Reminder',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: HomeScreen(),
    );
  }
}