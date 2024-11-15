import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_svg/flutter_svg.dart';

class JKonsiLoading extends StatelessWidget {
  const JKonsiLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Stack(
        children: [
          Container(
            color: Colors.black.withOpacity(0.5),
          ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SvgPicture.asset(
                  'assets/icon/logo.svg',
                  height: 100,
                )
                    .animate(
                      onComplete: (controller) =>
                          controller.repeat(reverse: true),
                    )
                    .move(
                      duration: 2000.ms,
                      begin: const Offset(0, -15),
                      end: const Offset(0, 15),
                    )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
