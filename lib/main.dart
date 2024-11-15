import 'package:desafio/data/repositories/cep_repository/cep_repository.dart';
import 'package:desafio/data/repositories/cep_repository/cep_repository_impl.dart';
import 'package:desafio/data/repositories/hive_repository/hive_repository.dart';
import 'package:desafio/data/repositories/hive_repository/hive_repository_impl.dart';
import 'package:desafio/domain/constants/app_constants.dart';
import 'package:desafio/presentation/app/app_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get_it/get_it.dart';
import 'package:hive_flutter/hive_flutter.dart';

final getIt = GetIt.instance;

Future<void> setupLocator() async {
  getIt.registerLazySingleton<CepRepository>(() => CepRepositoryImpl());
  getIt.registerLazySingleton<HiveRepository>(() => HiveRepositoryImpl());
}

Future<void> setupHive() async {
  await Hive.initFlutter();
  await Hive.openBox(StorageKeys.mainBox);
}

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load(fileName: ".env");
  await Future.wait([
    setupLocator(),
    setupHive(),
  ]);

  runApp(const AppWidget());
}
