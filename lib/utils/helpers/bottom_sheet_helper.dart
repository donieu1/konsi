// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:desafio/presentation/maps_screen/bloc/maps_bloc_bloc.dart';
import 'package:desafio/presentation/revision_screen/revision_screen.dart';
import 'package:flutter/material.dart';

class CustomBottomSheet extends StatelessWidget {
  final MapsBlocLoaded state;
  final VoidCallback onSave;

  const CustomBottomSheet({
    super.key,
    required this.state,
    required this.onSave,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 0,
      left: 0,
      right: 0,
      child: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: Container(
          width: double.infinity,
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.vertical(top: Radius.circular(0)),
          ),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  state.cepModel.cep ?? '',
                  style: Theme.of(context).textTheme.displaySmall,
                ),
                const SizedBox(height: 8),
                Text(
                  state.cepModel.logradouro ?? '',
                  style: Theme.of(context).textTheme.displaySmall,
                ),
                const SizedBox(height: 16),
                Align(
                  alignment: Alignment.center,
                  child: FractionallySizedBox(
                    widthFactor: 0.9,
                    child: ElevatedButton(
                      onPressed: () {
                        navigate(context);
                        onSave();
                      },
                      child: Text(
                        'Salvar Endereço',
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void navigate(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => RevisionScreen(cepModel: state.cepModel),
      ),
    );
  }
}
