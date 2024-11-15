import 'package:desafio/domain/entities/theme/theme_constants.dart';
import 'package:flutter/material.dart';

enum ToastTypeSnack { alert, info, message, success, pendent }

class ToastSnack extends StatelessWidget {
  final String message;
  final ToastTypeSnack type;

  const ToastSnack({
    super.key,
    required this.message,
    required this.type,
  });

  Color get borderColor {
    switch (type) {
      case ToastTypeSnack.alert:
        return const Color(0xFFE63D56);
      case ToastTypeSnack.info:
        return const Color(0xFFE3910F);
      case ToastTypeSnack.success:
        return const Color(0XFF06B36E);
      case ToastTypeSnack.message:
        return const Color(0xFF0C87BD);
      case ToastTypeSnack.pendent:
        return const Color(0xffAD69E3);
      default:
        return Colors.black;
    }
  }

  Color get backgroundColor {
    switch (type) {
      case ToastTypeSnack.alert:
        return const Color(0xFFFDE6E7);
      case ToastTypeSnack.info:
        return const Color(0xFFFFF5D1);
      case ToastTypeSnack.success:
        return const Color(0XFFDAF7E9);
      case ToastTypeSnack.message:
        return const Color(0xFFE1F3FD);
      case ToastTypeSnack.pendent:
        return const Color(0xFFF1E4FF);
      default:
        return Colors.white;
    }
  }

  IconData get icon {
    switch (type) {
      case ToastTypeSnack.alert:
        return Icons.info_outline;
      case ToastTypeSnack.info:
        return Icons.info_outline;
      case ToastTypeSnack.success:
        return Icons.check_circle_outline;
      case ToastTypeSnack.message:
        return Icons.info_outline;
      case ToastTypeSnack.pendent:
        return Icons.info_outline;
      default:
        return Icons.info_outline;
    }
  }

  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder(
      curve: Curves.fastOutSlowIn,
      duration: const Duration(milliseconds: 500),
      tween: Tween(begin: -80.0, end: 0.0),
      builder: (context, offset, child) {
        return Transform.translate(
          offset: Offset(0, offset),
          child: Opacity(
            opacity: 1.0 - (offset.abs() / 80.0),
            child: child,
          ),
        );
      },
      child: Material(
        elevation: 4.0,
        borderRadius: BorderRadius.circular(8.0),
        child: Container(
          width: MediaQuery.of(context).size.width - 32,
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          decoration: BoxDecoration(
            color: backgroundColor,
            borderRadius: BorderRadius.circular(8),
            border: Border(
              left: BorderSide(width: 5, color: borderColor),
              top: BorderSide(color: borderColor),
              right: BorderSide(color: borderColor),
              bottom: BorderSide(color: borderColor),
            ),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Icon(
                icon,
                color: borderColor,
                size: 24,
              ),
              const SizedBox(width: 8),
              Expanded(
                child: Text(
                  message,
                  style: const TextStyle(
                    color: Color(0xFF292929),
                    fontSize: 12,
                    fontFamily: 'Montserrat',
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

void showToast(BuildContext context, String message, ToastTypeSnack type) {
  final overlay = Overlay.of(context);
  OverlayEntry overlayEntry;

  double larguraDoToast = MediaQuery.of(context).size.width - 1;

  overlayEntry = OverlayEntry(
    builder: (context) => Positioned(
      top: MediaQuery.sizeOf(context).height * 0.1,
      left: (MediaQuery.of(context).size.width - larguraDoToast) / 2,
      child: Padding(
        padding: const EdgeInsets.all(ThemeConstants.padding),
        child: FadeInAndOutToast(
          child: ToastSnack(
            message: message,
            type: type,
          ),
        ),
      ),
    ),
  );

  overlay.insert(overlayEntry);

  Future.delayed(const Duration(seconds: 4), () {
    overlayEntry.remove();
  });
}

class FadeInAndOutToast extends StatefulWidget {
  final Widget child;
  const FadeInAndOutToast({super.key, required this.child});

  @override
  State<FadeInAndOutToast> createState() => _FadeInAndOutToastState();
}

class _FadeInAndOutToastState extends State<FadeInAndOutToast>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _fadeAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 1),
      vsync: this,
    );

    _fadeAnimation = CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOut,
    );

    _controller.forward();

    Future.delayed(const Duration(seconds: 3), () {
      _controller.reverse();
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FadeTransition(
      opacity: _fadeAnimation,
      child: widget.child,
    );
  }
}
