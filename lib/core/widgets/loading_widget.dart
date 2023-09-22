import 'package:flutter/material.dart';
import '../themes/colors.dart';

class LoadingWidget extends StatelessWidget {
  const LoadingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
        child: CircularProgressIndicator.adaptive(
      valueColor: const AlwaysStoppedAnimation<Color>(ThemeColors.primary),
          backgroundColor: ThemeColors.primary.withOpacity(0.5),
    ));
  }
}
