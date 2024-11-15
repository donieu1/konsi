import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_svg/svg.dart';

class RequestEmpty extends StatelessWidget {
  const RequestEmpty({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final width = constraints.maxWidth;
        final height = constraints.maxHeight;

        return Padding(
          padding: EdgeInsets.symmetric(horizontal: width * 0.05),
          child: ListView(
            shrinkWrap: true,
            children: [
              SizedBox(height: height * 0.05),
              Text(
                'Sem solicitações!',
                textAlign: TextAlign.center,
                style: Theme.of(context)
                    .textTheme
                    .bodyLarge
                    ?.copyWith(fontSize: 22, fontWeight: FontWeight.w900),
              ),
              SizedBox(height: height * 0.03),
              Center(
                child: SvgPicture.asset(
                  'assets/images/question.svg',
                  width: width * 0.7,
                  height: width * 0.7,
                ),
              ),
              SizedBox(height: height * 0.03),
              Text(
                "Você não tem Solicitações de reformas atualmente no ReformaFácil.",
                style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                    fontSize: 15,
                    fontWeight: FontWeight.w400,
                    color: Colors.grey[700]),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ).animate().fade(curve: Curves.easeInOut, duration: 1900.ms);
      },
    );
  }
}
