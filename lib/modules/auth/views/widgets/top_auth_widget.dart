import 'package:flutter/material.dart';

import 'RPS_custom_painter.dart';

class TopAuthWidget extends StatelessWidget {
  const TopAuthWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: 300,
          foregroundDecoration: BoxDecoration(color: Colors.black.withOpacity(0.6)),
          child: Image.asset(
            'assets/images/login.jpg',
            fit: BoxFit.fitHeight,
          ),
        ),
        Positioned(
          top: 90,
          bottom: 110,
          left: 0,
          right: 0,
          child: SizedBox(
            child: Image.asset(
              'assets/images/logo.png',
              fit: BoxFit.fitHeight,
            ),
          ),
        ),
        SizedBox(
          height: 300,
          width: MediaQuery.of(context).size.width,
          child: CustomPaint(
            size: Size(MediaQuery.of(context).size.width, (MediaQuery.of(context).size.width * 1.125).toDouble()), //You can Replace [WIDTH] with your desired width for Custom Paint and height will be calculated automatically
            painter: RPSCustomPainter(),
          ),
        ),
      ],
    );
  }
}
