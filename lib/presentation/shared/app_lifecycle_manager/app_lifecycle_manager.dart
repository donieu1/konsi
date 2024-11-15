
import 'dart:developer';

import 'package:flutter/material.dart';

class AppLifecycleManager extends StatefulWidget {
  final Widget child;

  const AppLifecycleManager({super.key, required this.child});

  @override
  _AppLifecycleManagerState createState() => _AppLifecycleManagerState();
}

class _AppLifecycleManagerState extends State<AppLifecycleManager>
    with WidgetsBindingObserver {
 

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    switch (state) {
      case AppLifecycleState.paused:
        log("App minimizado");
        break;
      case AppLifecycleState.resumed:
        log("App retomado");
        break;
      case AppLifecycleState.inactive:
        log("App inativo");
        break;
      case AppLifecycleState.detached:
        log("App desconectado");
        break;
      case AppLifecycleState.hidden:
        log("App oculto");
        break;
      default:
        log("Estado desconhecido: $state");
        break;
    }
  }

 

  @override
  Widget build(BuildContext context) {
    return widget.child;
  }
}
