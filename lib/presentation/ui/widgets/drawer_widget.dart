import 'package:ai_chat/presentation/ui/widgets/chat_history_item.dart';
import 'package:flutter/material.dart';

class SideDrawer extends StatelessWidget {
  const SideDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: const Color(0xFF1E1E1E),
      child: SafeArea(
        child: Column(
          children: [
            // App title and logo
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Chatify',
                    style: TextStyle(
                      color: Colors.white70,
                      fontSize: 24,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.all(4),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.white30),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: const Icon(Icons.menu, color: Colors.white70),
                  ),
                ],
              ),
            ),

            // New chat button
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: ElevatedButton.icon(
                onPressed: () {},
                icon: const Icon(Icons.refresh, color: Colors.white),
                label: const Text(
                  'New chat',
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF3D5AFE),
                  minimumSize: const Size(double.infinity, 45),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25),
                  ),
                ),
              ),
            ),

            const SizedBox(height: 10),

            // Section divider with "Today" label
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Today',
                  style: TextStyle(color: Colors.grey, fontSize: 12),
                ),
              ),
            ),

            // Today's chat item
            const ChatHistoryItem(
              title: 'Microprocessor History and Evolution',
              hasMoreOptions: true,
            ),

            const SizedBox(height: 15),

            // Section divider with "7 Days" label
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  '7 Days ago',
                  style: TextStyle(color: Colors.grey, fontSize: 12),
                ),
              ),
            ),

            // Chat history items
            Expanded(
              child: ListView(
                padding: EdgeInsets.zero,
                children: const [
                  ChatHistoryItem(
                      title: 'Strategy Pattern for Payment Processing'),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
