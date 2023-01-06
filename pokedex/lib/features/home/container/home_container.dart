// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:pokedex/common/models/pokemon.dart';
import 'package:pokedex/common/repositorys/pokemon_repository.dart';
import 'package:pokedex/features/home/pages/home_error.dart';
import 'package:pokedex/features/home/pages/home_loading.dart';
import 'package:pokedex/features/home/pages/home_page.dart';

class HomeContainer extends StatelessWidget {
  const HomeContainer({
    Key? key,
    required this.repository,
  }) : super(key: key);
  final IPokemonRepository repository;
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Pokemon>>(
      future: repository.getAllPokemons(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const HomeLoading();
        }
        if (snapshot.connectionState == ConnectionState.done && snapshot.hasData) {
          return HomePage(list: snapshot.data!);
        }
        if (snapshot.hasError) {
          return HomeError(error: snapshot.error.toString());
        }
        return const Text('Error desconhecido');
      },
    );
  }
}
