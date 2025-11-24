import 'package:flutter/material.dart';

import '../core/utils/app_style.dart';
import '../screens/setting_screen.dart';

Widget homeAppBar(BuildContext context) {
  return Row(
    children: [
      Text("MoodLog", style: AppStyle.lemon20sPurple500),
      const Spacer(),
      IconButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const SettingScreen()),
          );
        },
        icon: const Icon(Icons.settings_outlined),
      ),
    ],
  );
}
