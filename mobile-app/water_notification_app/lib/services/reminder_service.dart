import 'notification_service.dart';

class ReminderService {
  final NotificationService _notificationService = NotificationService();

  void scheduleReminder(int hours) async {
    await _notificationService.showNotification(
      'Time to Drink Water!',
      'Stay hydrated and take a sip now!',
    );
  }
}