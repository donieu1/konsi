import 'package:flutter/material.dart';

enum Language {
  portuguese(Locale('pt', 'BR'), 'dd/MM/yyyy'),
  english(Locale('en', 'US'), 'MM-dd-yyyy');

  final Locale locale;
  final String dateFormat;

  const Language(this.locale, this.dateFormat);
}
