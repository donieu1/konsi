import 'package:flutter/material.dart';

import '../../../domain/entities/theme/app_colors.dart';

enum ToastType { alert, info, message, success, pendent }

class ToastMessages extends StatelessWidget {
  final String message;
  final ToastType type;

  const ToastMessages({
    super.key,
    required this.message,
    required this.type,
  });

  Color get borderColor {
    switch (type) {
      case ToastType.alert:
        return const Color(0xFFE63D56);
      case ToastType.info:
        return const Color(0xFFE3910F);
      case ToastType.success:
        return AppColors.success;
      case ToastType.message:
        return const Color(0xFF0C87BD);
      case ToastType.pendent:
        return const Color(0xffAD69E3);
      default:
        return Colors.black;
    }
  }

  Color get backgroundColor {
    switch (type) {
      case ToastType.alert:
        return const Color(0xFFFDE6E7);
      case ToastType.info:
        return const Color(0xFFFFF5D1);
      case ToastType.message:
        return const Color(0xFFE1F3FD);
      case ToastType.success:
        return const Color(0xFFD8FFEF);
      default:
        return Colors.white;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: MediaQuery.sizeOf(context).width * 0.85,
          height: MediaQuery.sizeOf(context).height * 0.13,
          padding: const EdgeInsets.all(16),
          clipBehavior: Clip.antiAlias,
          decoration: BoxDecoration(
            color: backgroundColor,
            borderRadius: BorderRadius.circular(8),
            border: Border(
              left: BorderSide(width: 5, color: borderColor),
              top: BorderSide(color: borderColor, width: 0.1),
              right: BorderSide(color: borderColor, width: 0.1),
              bottom: BorderSide(color: borderColor, width: 0.1),
            ),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Icon(
                Icons.info_outline,
                color: borderColor,
                size: 24,
              ),
              const SizedBox(width: 10),
              
              Expanded(
                child: Wrap(
                  children: [Text(
                    message,
                    style:  TextStyle(
                      color: const Color(0xFF292929),
                      fontSize: MediaQuery.sizeOf(context).width * 0.03,
                      fontFamily: 'Montserrat',
                      fontWeight: FontWeight.w400,
                    ),
                  ),],
                 
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
