import 'package:desafio/data/models/cep_model.dart';
import 'package:desafio/domain/entities/theme/theme_constants.dart';
import 'package:desafio/presentation/revision_screen/bloc/save_address_bloc.dart';
import 'package:desafio/presentation/shared/inputs/custom_input_ref.dart';
import 'package:desafio/presentation/shared/toast_messages/toast_snack.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RevisionScreen extends StatefulWidget {
  final CepModel cepModel;

  const RevisionScreen({
    super.key,
    required this.cepModel,
  });

  @override
  State<RevisionScreen> createState() => _RevisionScreenState();
}

class _RevisionScreenState extends State<RevisionScreen> {
  final cepEC = TextEditingController();
  final addressEC = TextEditingController();
  final numberEC = TextEditingController();
  final complementEC = TextEditingController();

  @override
  void initState() {
    super.initState();
    addressEC.text = widget.cepModel.logradouro ?? '';
    complementEC.text = widget.cepModel.complemento ?? '';
    cepEC.text = widget.cepModel.cep ?? '';
  }

  @override
  Widget build(BuildContext context) {
    final style = Theme.of(context).textTheme.displaySmall;

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        iconTheme: IconThemeData(
          color: Theme.of(context).colorScheme.outlineVariant,
        ),
        title: Text(
          'Revisão',
          style: Theme.of(context).textTheme.headlineLarge,
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(ThemeConstants.padding),
          child: BlocProvider(
            create: (_) => SaveAddressBloc(),
            child: BlocListener<SaveAddressBloc, SaveAddressState>(
              listener: (context, state) {
                if (state is SaveAddressErro) {
                  showToast(context, state.msg, ToastTypeSnack.alert);
                } else if (state is SaveAddressLoaded) {
                  showToast(context, 'Endereço salvo com sucesso!',
                      ToastTypeSnack.success);
                  Navigator.pop(context, true);
                }
              },
              child: Column(
                children: [
                  CustomInputKonsi(
                    label: 'CEP',
                    controller: cepEC,
                    showShadow: false,
                    enableInput: false,
                    textStyle: style,
                  ),
                  CustomInputKonsi(
                    label: 'Endereço',
                    controller: addressEC,
                    showShadow: false,
                    textStyle: style,
                  ),
                  CustomInputKonsi(
                    label: 'Número',
                    controller: numberEC,
                    showShadow: false,
                    textStyle: style,
                  ),
                  CustomInputKonsi(
                    label: 'Complemento',
                    controller: complementEC,
                    showShadow: false,
                    textStyle: style,
                  ),
                  const Spacer(),
                  FractionallySizedBox(
                    widthFactor: 1,
                    child: BlocBuilder<SaveAddressBloc, SaveAddressState>(
                      builder: (context, state) {
                        return ElevatedButton(
                          onPressed: () => saveAddress(
                              context: context,
                              cepModel: CepModel(
                                  cep: cepEC.text,
                                  logradouro: addressEC.text,
                                  complemento: '',
                                  unidade: numberEC.text.isEmpty
                                      ? ''
                                      : numberEC.text,
                                  bairro: '',
                                  localidade: '',
                                  uf: '',
                                  estado: '',
                                  regiao: '',
                                  ibge: '',
                                  gia: '',
                                  ddd: '',
                                  siafi: '')),
                          child: state is SaveAddressLoading
                              ? const CircularProgressIndicator()
                              : Text(
                                  'Confirmar',
                                  style: Theme.of(context)
                                      .textTheme
                                      .displaySmall
                                      ?.copyWith(color: Colors.white),
                                ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    ).animate().fadeIn(curve: Curves.easeInOut);
  }

  void saveAddress(
      {required CepModel cepModel, required BuildContext context}) {
    context
        .read<SaveAddressBloc>()
        .add(SaveAddressInStorageEvent(cepModel: cepModel));
  }
}
