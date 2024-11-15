import 'dart:async';

import 'package:desafio/domain/validators/validator.dart';
import 'package:desafio/presentation/maps_screen/bloc/maps_bloc_bloc.dart';
import 'package:desafio/presentation/shared/inputs/custom_input_ref.dart';
import 'package:desafio/presentation/shared/konsi_loading/konsi_loading.dart';
import 'package:desafio/presentation/shared/suggestions/suggestions_widget.dart';
import 'package:desafio/utils/helpers/bottom_sheet_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:permission_handler/permission_handler.dart';

class MapsScreen extends StatefulWidget {
  const MapsScreen({super.key});

  @override
  State<MapsScreen> createState() => _MapsScreenState();
}

class _MapsScreenState extends State<MapsScreen> {
  final searchEC = TextEditingController();
  final Completer<GoogleMapController> _controller =
      Completer<GoogleMapController>();
  final Set<Marker> _markers = {};
  final Validators _validators = Validators();
  final formKey = GlobalKey<FormState>();
  bool _showBottomSheet = false;

  @override
  void initState() {
    super.initState();
    _requestPermissions().then((_) {
      setState(() {});
    });
  }

  Future<void> _requestPermissions() async {
    PermissionStatus status = await Permission.location.status;
    if (!status.isGranted) {
      await Permission.location.request();
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => MapsBlocBloc(),
      child: Scaffold(
        floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
        body: SafeArea(
          child: BlocConsumer<MapsBlocBloc, MapsBlocState>(
            listener: (context, state) {
              if (state is MapsBlocLoaded) {
                _addMarker(state.location, state.cepModel.cep ?? '');
                setState(() {
                  _showBottomSheet = true;
                });
              }
            },
            builder: (context, state) {
              return Stack(
                children: [
                  GoogleMap(
                    mapType: MapType.normal,
                    initialCameraPosition: const CameraPosition(
                        target:
                            LatLng(-12.980451970288506, -38.455636699369855)),
                    onMapCreated: (GoogleMapController controller) {
                      _controller.complete(controller);
                    },
                    markers: _markers,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16),
                    child: Form(
                      key: formKey,
                      child: CustomInputKonsi(
                        showShadow: false,
                        textStyle: Theme.of(context).textTheme.displaySmall,
                        validator: _validators.cep,
                        type: TextInputType.number,
                        maxLenght: 8,
                        icon: Icon(
                          Icons.search,
                          color: Colors.grey[100],
                        ),
                        color: Colors.grey[300],
                        label: 'Buscar',
                        floatingLabelStyle:
                            Theme.of(context).textTheme.displaySmall,
                        controller: searchEC,
                        onChanged: (query) {
                          context
                              .read<MapsBlocBloc>()
                              .add(GetSuggestionsEvent(query: query));
                        },
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 16,
                    right: 16,
                    child: FloatingActionButton(
                      foregroundColor: Colors.white,
                      backgroundColor: Theme.of(context).primaryColor,
                      child: const Icon(Icons.search),
                      onPressed: () => validateInput(searchEC.text, context),
                    ),
                  ),
                  if (state is MapsBlocLoading) const JKonsiLoading(),
                  if (state is SuggestionsLoadedState)
                    const SuggestionsWidget(),
                  if (_showBottomSheet && state is MapsBlocLoaded)
                    CustomBottomSheet(
                      state: state,
                      onSave: () {
                        setState(() {
                          _showBottomSheet = false;
                        });
                      },
                    )
                ],
              );
            },
          ),
        ).animate().fade(),
      ),
    );
  }

  void validateInput(String cep, BuildContext context) {
    if (formKey.currentState?.validate() ?? false) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        FocusScope.of(context).unfocus();
      });

      context.read<MapsBlocBloc>().add(GetLocationFromCepEvent(cep: cep));
    }
  }

  void _addMarker(LatLng position, String title) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      FocusScope.of(context).unfocus();
    });
    setState(() {
      _markers.clear();
      _markers.add(
        Marker(
          markerId: MarkerId(title),
          position: position,
          infoWindow: InfoWindow(title: title),
        ),
      );
    });
    _controller.future.then((controller) {
      controller.animateCamera(CameraUpdate.newLatLngZoom(position, 14));
    });
  }
}
