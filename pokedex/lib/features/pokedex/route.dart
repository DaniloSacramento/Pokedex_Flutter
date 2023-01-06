// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:pokedex/common/repositorys/pokemon_repository.dart';
import 'package:pokedex/features/home/container/home_container.dart';
import 'package:pokedex/features/pokedex/screens/details/container/detail_container.dart';

class PokedexRoute extends StatelessWidget {
  const PokedexRoute({
    Key? key,
    required this.repository,
  }) : super(key: key);
  final PokemonRepository repository;
  @override
  Widget build(BuildContext context) {
    return Navigator(
      initialRoute: '/',
      onGenerateRoute: (settings) {
        if (settings.name == '/') {
          return MaterialPageRoute(builder: (context) {
            return HomeContainer(
              repository: repository,
              onItemTap: (route, arguments) {
                Navigator.of(context).pushNamed(route, arguments: arguments);
              },
            );
          });
        }
        if (settings.name == '/details') {
          return MaterialPageRoute(builder: (context) {
            return DetailContainer(
              repository: repository,
              arguments: (settings.arguments as DetailArguments),
            );
          });
        }
      },
    );
  }
}
