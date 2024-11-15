import 'package:desafio/presentation/maps_screen/bloc/maps_bloc_bloc.dart';
import 'package:desafio/presentation/revision_screen/bloc/save_address_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

List<BlocProvider> getAppProviders() {
  return [
    BlocProvider<MapsBlocBloc>(
      create: (context) => MapsBlocBloc(),
    ),
    BlocProvider<SaveAddressBloc>(
      create: (context) => SaveAddressBloc(),
    ),
  ];
}
