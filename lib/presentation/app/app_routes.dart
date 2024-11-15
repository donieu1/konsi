import 'package:desafio/domain/entities/routes/routes.dart';
import 'package:desafio/presentation/shared/menu_bottom_app/menu_bottom_app_bar.dart';
import 'package:desafio/presentation/splash/splash_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

final Map<String, Widget Function(BuildContext)> appRoutes =
    <String, Widget Function(BuildContext)>{
  NamedRoutes.splashScreen.route: (BuildContext context) =>
      const SplashScreen(),
   NamedRoutes.homeScreen.route: (BuildContext context) =>
      const CustomAppBar(),
};
