import 'package:flutter/material.dart';
import 'package:wear/wear.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class WatchScreen extends StatefulWidget {
  @override
  _WatchScreenState createState() => _WatchScreenState();
}

class _WatchScreenState extends State<WatchScreen> {
  final String serverKey = '';
  final String fcmEndpoint = 'https://fcm.googleapis.com/fcm/send';

  Future<void> sendReminder() async {
    final String to = '/topics/water_reminder';
    final Map<String, dynamic> data = {
      'notification': {
        'title': 'Time to Drink Water!',
        'body': 'Stay hydrated and take a sip now!',
      },
      'to': to,
    };

    final response = await http.post(
      Uri.parse(fcmEndpoint),
      headers: <String, String>{
        'Content-Type': 'application/json',
        'Authorization': 'key=$serverKey',
      },
      body: jsonEncode(data),
    );

    if (response.statusCode == 200) {
      print('Reminder sent successfully');
    } else {
      print('Failed to send reminder: ${response.body}');
    }
  }

  @override
  Widget build(BuildContext context) {
    return WatchShape(
      builder: (context, shape, child) {
        return AmbientMode(
          builder: (context, mode, child) {
            return Scaffold(
              body: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Stay Hydrated!', style: TextStyle(fontSize: 18)),
                    SizedBox(height: 10),
                    ElevatedButton(
                      onPressed: sendReminder,
                      child: Text('Send Reminder'),
                    ),
                  ],
                ),
              ),
            );
          },
        );
      },
    );
  }
}