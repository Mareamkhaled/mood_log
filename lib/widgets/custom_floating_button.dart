import 'package:flutter/material.dart';

import '../core/utils/app_colors.dart';

Widget customFloatingButton() {
  return FloatingActionButton(
    onPressed: () {
      // TODO: Navigate to write entry screen
      debugPrint('New Entry button pressed');
    },
    backgroundColor: AppColors.myLightPurple,
    child: const Icon(Icons.add, color: Colors.white),
  );
}
