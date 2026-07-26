import 'package:flutter/material.dart';
import '../data/mock_data.dart';
import '../widgets/app_header.dart';
import '../widgets/notification_card.dart';

class NotificationsScreen extends StatelessWidget {
  const NotificationsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppHeader(title: 'الإشعارات'),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          for (final notification in MockData.notifications)
            NotificationCard(notification: notification),
        ],
      ),
    );
  }
}
