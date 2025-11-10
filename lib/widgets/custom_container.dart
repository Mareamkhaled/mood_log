import 'package:flutter/material.dart';
import '../core/utils/app_colors.dart';
import 'cutom_shadow.dart';

class CustomContainer extends StatelessWidget {
  const CustomContainer({super.key, required this.child});
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
              padding:const EdgeInsets.symmetric(
                horizontal: 20,
                vertical: 10
              ),
              decoration: BoxDecoration(
                boxShadow: [
                  customShadow()
                ],
                color: AppColors.myWhite,
                borderRadius: BorderRadius.circular(10)
              ),
              child: child
             );
  }
}