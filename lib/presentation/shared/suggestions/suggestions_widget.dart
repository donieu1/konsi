import 'package:desafio/domain/entities/theme/theme_constants.dart';
import 'package:desafio/presentation/maps_screen/bloc/maps_bloc_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';


class SuggestionsWidget extends StatelessWidget {
  const SuggestionsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 80,
      left: 16,
      right: 16,
      child: Material(
        elevation: 10,
        borderRadius: BorderRadius.circular(8),
        child: Container(
          color: Colors.white,
          child: BlocBuilder<MapsBlocBloc, MapsBlocState>(
            builder: (context, state) {
              if (state is SuggestionsLoadedState) {
                final suggestions = state.suggestions;

                if (suggestions.isEmpty) {
                  return const SizedBox.shrink();
                }

                return ListView.separated(
                  padding: const EdgeInsets.all(ThemeConstants.button),
                  separatorBuilder: (context, index) {
                    return Divider(
                      color: Colors.grey,
                      thickness: 0.5,
                      indent: MediaQuery.sizeOf(context).width * 0.05,
                      endIndent: MediaQuery.sizeOf(context).width * 0.05,
                    );
                  },
                  shrinkWrap: true,
                  itemCount: suggestions.length,
                  itemBuilder: (context, index) {
                    final suggestion = suggestions[index];
                    return ListTile(
                      leading: SvgPicture.asset(
                        'assets/icon/logo.svg',
                        height: 50,
                        color: Theme.of(context).primaryColor,
                      ),
                      title: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            suggestion.cep,
                            style: Theme.of(context)
                                .textTheme
                                .headlineMedium
                              
                          ),
                          Text(
                            suggestion.description,
                            style: Theme.of(context)
                                .textTheme
                                .headlineMedium
                              ,
                          ),
                        ],
                      ),
                      onTap: () {
                        context.read<MapsBlocBloc>().add(
                              GetLocationFromCepEvent(cep: suggestion.cep),
                            );
                      },
                    );
                  },
                );
              } else {
                return const SizedBox.shrink();
              }
            },
          ),
        ).animate().fade(),
      ),
    );
  }
}
