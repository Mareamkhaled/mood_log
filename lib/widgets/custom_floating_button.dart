import 'package:flutter/material.dart';

import '../core/utils/app_colors.dart';
import '../screens/write_entry_screen.dart';

class CustomFloatingButton extends StatelessWidget {
  const CustomFloatingButton({super.key});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
    onPressed: () {
      Navigator.push(
       context,
        MaterialPageRoute(builder: (context) => const WriteEntryScreen()),
      );
    },
    backgroundColor: AppColors.myLightPurple,
    child: const Icon(Icons.add, color: Colors.white),
  );
  }
}
