// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:pokedex/common/error/failure.dart';
import 'package:pokedex/common/models/pokemon.dart';
import 'package:pokedex/common/repositorys/pokemon_repository.dart';
import 'package:pokedex/common/widgets/po_error.dart';
import 'package:pokedex/common/widgets/po_loading.dart';
import 'package:pokedex/features/pokedex/screens/details/pages/detail_page.dart';

class DetailArguments {
  final Pokemon pokemon;
  DetailArguments({
    required this.pokemon,
  });
}

class DetailContainer extends StatelessWidget {
  const DetailContainer({
    Key? key,
    required this.repository,
    required this.arguments,
  }) : super(key: key);
  final IPokemonRepository repository;
  final DetailArguments arguments;
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Pokemon>>(
      future: repository.getAllPokemons(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const PoLoading();
        }
        if (snapshot.connectionState == ConnectionState.done && snapshot.hasData) {
          return DetailPage(
            pokemon: arguments.pokemon,
            list: snapshot.data!,
          );
        }
        if (snapshot.hasError) {
          return PoError(error: (snapshot.error as Failure).message!);
        }
        return const Text('Error desconhecido');
      },
    );
  }
}
