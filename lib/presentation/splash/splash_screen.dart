import 'dart:developer';

import 'package:desafio/domain/entities/routes/routes.dart';
import 'package:desafio/presentation/splash/bloc/splash_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    Future.delayed(const Duration(seconds: 2), nextPage);
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SplashBloc()..add(SplashLoad()),
      child: Scaffold(
        backgroundColor: Theme.of(context).colorScheme.primary,
        body: SafeArea(
          child: BlocConsumer<SplashBloc, SplashState>(
            listener: (context, state) {},
            builder: (context, state) {
              log(state.toString());
              switch (state.runtimeType) {
                case SplashSuccess:
                case SplashLoading:
                  return LayoutBuilder(
                    builder: (context, constraints) {
                      return ConstrainedBox(
                        constraints: BoxConstraints(
                            minHeight: constraints.maxHeight,
                            minWidth: constraints.maxWidth),
                        child: Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SvgPicture.asset(
                                'assets/icon/logo.svg',
                                height: 250,
                              )
                                  .animate(
                                    onComplete: (controller) =>
                                        controller.reverse(),
                                  )
                                  .move(
                                    duration: 2000.ms,
                                    begin: const Offset(0, -15),
                                    end: const Offset(0, 15),
                                  )
                            ],
                          ),
                        ),
                      );
                    },
                  );
                case SplashError _:
                  return const Text(
                    'asds',
                  );
                default:
                  return const Text('asds');
              }
            },
          ),
        ),
      ),
    );
  }


  Future<void> nextPage() async {
    Navigator.pushReplacementNamed(context, NamedRoutes.homeScreen.route);
  }


}
