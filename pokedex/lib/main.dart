import 'package:flutter/material.dart';
import 'package:pokedex/common/repositorys/pokemon_repository.dart';
import 'package:pokedex/features/home/container/home_container.dart';
import 'package:pokedex/features/home/pages/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Pokedex',
      theme: ThemeData(primarySwatch: Colors.red),
      home: HomeContainer(
        repository: PokemonRepository(),
      ),
    );
  }
}
