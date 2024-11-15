import 'package:desafio/presentation/revision_screen/bloc/save_address_bloc.dart';
import 'package:desafio/presentation/shared/inputs/custom_input_ref.dart';
import 'package:desafio/presentation/shared/toast_messages/toast_snack.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class MySavedAddresses extends StatefulWidget {
  const MySavedAddresses({super.key});

  @override
  State<MySavedAddresses> createState() => _MySavedAddressesState();
}

class _MySavedAddressesState extends State<MySavedAddresses> {
  final cepEC = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: BlocProvider(
            // Colocando o BlocProvider aqui para garantir que o bloco esteja acessível no contexto
            create: (context) => SaveAddressBloc()..add(GetAddressInStorageEvent()),
            child: Column(
              children: [
                // Input de busca
                CustomInputKonsi(
                  textStyle: Theme.of(context).textTheme.displaySmall,
                  type: TextInputType.text,
                  icon: Icon(
                    Icons.search,
                    color: Colors.grey[100],
                  ),
                  color: Colors.grey[300],
                  label: 'Buscar',
                  controller: cepEC,
                  onChanged: (value) {
                    // Aqui é que o Bloc deve ser acessado corretamente.
                    // A busca no input chama o evento `SearchAddressEvent` no `Bloc`.
                    context.read<SaveAddressBloc>().add(SearchAddressEvent(value));
                  },
                ),
                Expanded(
                  child: BlocConsumer<SaveAddressBloc, SaveAddressState>(
                    listener: (context, state) {
                      if (state is SaveAddressErro) {
                        showToast(context, 'Erro ao deletar CEP', ToastTypeSnack.alert);
                      }
                      if (state is DeleteSucess) {
                        showToast(context, 'Deletado com sucesso', ToastTypeSnack.success);
                        context.read<SaveAddressBloc>().add(GetAddressInStorageEvent());
                      }
                    },
                    builder: (context, state) {
                      if (state is SaveAddressLoading) {
                        return const Center(child: CircularProgressIndicator());
                      }
                      if (state is SaveAddressErro) {
                        return Center(
                          child: Text(
                            'Erro: ${state.msg}',
                            style: Theme.of(context).textTheme.headlineMedium,
                          ),
                        );
                      }
                      if (state is GetAddressLoaded) {
                        final addresses = state.cepModel;
                        return addresses.isEmpty
                            ? Center(
                                child: Text(
                                  "Nenhum endereço encontrado",
                                  style: Theme.of(context).textTheme.headlineMedium,
                                ),
                              )
                            : ListView.separated(
                                itemCount: addresses.length,
                                itemBuilder: (context, index) {
                                  final address = addresses[index];
                                  return ListTile(
                                    title: Text(
                                      address?.cep ?? 'CEP',
                                      style: Theme.of(context)
                                          .textTheme
                                          .headlineMedium
                                          ?.copyWith(fontWeight: FontWeight.w600),
                                    ),
                                    subtitle: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          address?.logradouro ?? 'Endereço',
                                          style: Theme.of(context)
                                              .textTheme
                                              .headlineMedium
                                              ?.copyWith(fontSize: 14),
                                        ),
                                        Text(
                                          "Nº ${address?.unidade}",
                                          style: Theme.of(context)
                                              .textTheme
                                              .headlineMedium
                                              ?.copyWith(fontSize: 14),
                                        ),
                                      ],
                                    ),
                                    trailing: IconButton(
                                      icon: Icon(
                                        Icons.delete,
                                        color: Theme.of(context).primaryColor,
                                      ),
                                      onPressed: () {
                                        if (address != null) {
                                          context.read<SaveAddressBloc>().add(
                                              DeleteAddressEvent(
                                                  cepModel: address));
                                        }
                                      },
                                    ),
                                  );
                                },
                                separatorBuilder: (context, index) {
                                  return const Divider();
                                },
                              ).animate().fade();
                      }
                      return const Center(child: Text('Nenhum endereço encontrado'));
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
