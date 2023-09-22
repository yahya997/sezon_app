import 'package:flutter/material.dart';

class AppElevationButton extends StatelessWidget {
  const AppElevationButton({
    super.key,
    required this.label,
    required this.onTap,
  });

  final String label;
  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: SizedBox(
        width: MediaQuery.of(context).size.width,
        height: 50,
        child: ElevatedButton(
          onPressed: onTap,
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.red,
            elevation: 0,
          ),
          child: Text(
            label,
            style: const TextStyle(
              fontSize: 17,
            ),
          ),
        ),
      ),
    );
  }
}
