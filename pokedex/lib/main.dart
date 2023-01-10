import 'package:dio/dio.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:pokedex/common/repositorys/pokemon_repository.dart';
import 'package:pokedex/features/home/container/home_container.dart';
import 'package:pokedex/features/pokedex/route.dart';
import 'package:pokedex/features/pokedex/screens/login/pages/login/login_page.dart';

void main() async {
  runApp(const MyApp());
  await Firebase.initializeApp();
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
      home: const LoginPage(),
      // PokedexRoute(
      // repository: PokemonRepository(dio: Dio()),
      //   ));
    );
  }
}
