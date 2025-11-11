import 'package:flutter/material.dart';

import '../core/utils/app_style.dart';

Widget homeAppBar() {
  return Row(
    children: [
      Text("MoodLog",style: AppStyle.lemon20sPurple500,),
      const Spacer(),
      IconButton(onPressed: () {}, icon: const Icon(Icons.settings_outlined)),
    ],
  );
}
