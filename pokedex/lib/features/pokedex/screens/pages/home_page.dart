// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:pokedex/common/models/pokemon.dart';
import 'package:pokedex/common/repositorys/pokemon_repository.dart';
import 'package:pokedex/features/pokedex/screens/details/container/detail_container.dart';
import 'package:pokedex/features/pokedex/screens/pages/widgets/pokemon_item_widget.dart';

class HomePage extends StatelessWidget {
  const HomePage({
    Key? key,
    required this.list,
    required this.repository,
    required this.onItemTap,
  }) : super(key: key);
  final List<Pokemon> list;
  final IPokemonRepository repository;
  final Function(String, DetailArguments) onItemTap;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.white,
          title: const Padding(
            padding: EdgeInsets.only(left: 8.0),
            child: Text(
              'Pokedex',
              style: TextStyle(color: Colors.black, fontFamily: 'Teko', fontSize: 32),
            ),
          ),
          centerTitle: false,
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 8.0),
              child: IconButton(
                onPressed: () {},
                icon: const Icon(Icons.menu, color: Colors.black),
              ),
            ),
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: GridView.count(
            crossAxisCount: 2,
            mainAxisSpacing: 12,
            crossAxisSpacing: 12,
            children: list
                .map((e) => PokemonItemWidget(
                      pokemon: e,
                      onTap: onItemTap,
                    ))
                .toList(),
          ),
        ));
  }
}
