import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:water_notification_app/services/reminder_service.dart';
import 'settings_screen.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final ReminderService reminderService = ReminderService();
  final FirebaseMessaging _firebaseMessaging = FirebaseMessaging.instance;
  String? _deviceToken;

   @override
  void initState() {
    super.initState();
    _getDeviceToken();
  }

  Future<void> _getDeviceToken() async {
    try {
      // Request permission for notifications (required for iOS)
      await _firebaseMessaging.requestPermission();

      // Get the device token
      final String? token = await _firebaseMessaging.getToken();
      if (token != null) {
        setState(() {
          _deviceToken = token;
        });
        print('Device Token: $token');
      } else {
        print('Failed to get device token');
      }
    } catch (e) {
      print('Error getting device token: $e');
    }
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Water Reminder')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Stay hydrated!'),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => reminderService.scheduleReminder(2), // Every 2 hours
              child: Text('Set Reminder Every 2 Hours'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => SettingsScreen()),
              ),
              child: Text('Settings'),
            ),
            _deviceToken != null
            ? SelectableText(
              _deviceToken!,
              style: TextStyle(fontSize: 12),
            )
            : CircularProgressIndicator(),
          ],
        ),
      ),
    );
  }
}