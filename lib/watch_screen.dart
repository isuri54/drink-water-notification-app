import 'package:flutter/material.dart';
import 'package:wear/wear.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class WatchScreen extends StatefulWidget {
  @override
  _WatchScreenState createState() => _WatchScreenState();
}

class _WatchScreenState extends State<WatchScreen> {
  final String backendUrl = 'http://localhost:5000/send-reminder';

  Future<void> sendReminder() async {
    final String deviceToken = 'DEVICE_TOKEN';

    try {
      
      final response = await http.post(
        Uri.parse(backendUrl),
        headers: <String, String>{
          'Content-Type': 'application/json',
        },
        body: jsonEncode({
          'deviceToken': deviceToken,
        }),
      );

      if (response.statusCode == 200) {
        print('Reminder sent successfully');
      } else {
        print('Failed to send reminder: ${response.body}');
      }
    } catch (e) {
      print('Error sending reminder: $e');
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