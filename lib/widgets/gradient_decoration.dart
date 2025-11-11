import 'package:flutter/material.dart';

import '../core/utils/app_colors.dart';

Gradient get gradientDecoration => 
  const LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [AppColors.primaryColor, AppColors.secondaryColor],
  );