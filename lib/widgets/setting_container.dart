import 'package:flutter/widgets.dart';
import 'cutom_shadow.dart';

class SettingContainer extends StatelessWidget {
  const SettingContainer({super.key, required this.color, required this.child});
  final Color color;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding:const EdgeInsets.all(20),
      width: double.infinity,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(18),
        color: color, boxShadow: [customShadow()]),

      child: child,
    );
  }
}
