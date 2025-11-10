import 'package:flutter/material.dart';

Widget homeAppBar() {
  return Row(
    children: [
      const Text("MoodLog"),
      const Spacer(),
      IconButton(onPressed: () {}, icon: const Icon(Icons.settings_outlined)),
    ],
  );
}
