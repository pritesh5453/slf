import 'package:flutter/material.dart';

class NotificationsScreen extends StatelessWidget {
  const NotificationsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // ---------------- TOP BAR ----------------
            Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 18),
              decoration: const BoxDecoration(
                border: Border(bottom: BorderSide(color: Colors.black12)),
              ),
              child: Row(
                children: [
                  const Text(
                    "Notifications",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                  ),
                  const Spacer(),
                  GestureDetector(
                    onTap: () => Navigator.pop(context),
                    child: const Icon(Icons.close, size: 26),
                  ),
                ],
              ),
            ),

            // ---------------- NOTIFICATION LIST ----------------
            Expanded(
              child: ListView(
                padding: EdgeInsets.zero,
                children: [
                  _notificationTile(
                    title: "Your EMI is due. Pay now to stay on track.",
                    subtitle: "Avoid late charges by clearing it on time.",
                    showDot: true,
                  ),

                  _divider(),

                  _notificationTile(
                    title: "You're eligible for extra funds. Check now.",
                    subtitle: "See how much more you can unlock instantly",
                    showDot: true,
                  ),

                  _divider(),

                  _notificationTile(
                    title: "Your payment was successful.",
                    subtitle: "Thank you! Your records have been updated.",
                    showDot: false,
                  ),

                  _divider(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  // ---------------- NOTIFICATION TILE WIDGET ----------------
  Widget _notificationTile({
    required String title,
    required String subtitle,
    required bool showDot,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Title + subtitle
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 6),
                Text(
                  subtitle,
                  style: const TextStyle(fontSize: 13, color: Colors.black54),
                ),
              ],
            ),
          ),

          // Green dot
          if (showDot)
            const Padding(
              padding: EdgeInsets.only(top: 4),
              child: Icon(
                Icons.fiber_manual_record,
                color: Colors.green,
                size: 14,
              ),
            ),
        ],
      ),
    );
  }

  // ---------------- DIVIDER ----------------
  Widget _divider() {
    return const Divider(height: 1, thickness: 1, color: Colors.black12);
  }
}
