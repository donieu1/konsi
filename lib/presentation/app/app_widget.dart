import 'package:desafio/domain/entities/theme/themes.dart';
import 'package:desafio/domain/infra/app_providers.dart';
import 'package:desafio/l10n/language.dart';
import 'package:desafio/presentation/shared/app_lifecycle_manager/app_lifecycle_manager.dart';
import 'package:desafio/presentation/shared/remove_glow/remove_glow_effect.dart';
import 'package:desafio/presentation/shared/system_manager/system_ui_overlay.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import '../../domain/entities/routes/routes.dart';
import 'app_routes.dart';

final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

class AppWidget extends StatelessWidget {
  const AppWidget({super.key});

  @override
  Widget build(BuildContext context) {
    ThemeMode themeMode = ThemeMode.light;

    SystemUiOverlayManager.setSystemUIOverlayStyle(themeMode);

    return MultiBlocProvider(
      providers: getAppProviders(),
      child: AppLifecycleManager(
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          builder: (_, child) {
            return ScrollConfiguration(
              behavior: const RemoveGlowEffect(),
              child: child ?? Container(),
            );
          },
          supportedLocales: [Language.portuguese.locale, Language.english.locale],
          localizationsDelegates: const [
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          themeMode: themeMode,
          theme: themeMode == ThemeMode.light
              ? AppThemes().defaultTheme
              : AppThemes().defaultTheme,
          initialRoute: NamedRoutes.splashScreen.route,
          routes: appRoutes,
        ),
      ),
    );
  }
}
