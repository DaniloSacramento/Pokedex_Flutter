// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/cupertino.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:pokedex/common/models/pokemon.dart';
import 'package:pokedex/features/pokedex/screens/pages/widgets/type_widget.dart';

class PokemonItemWidget extends StatelessWidget {
  const PokemonItemWidget({
    Key? key,
    required this.pokemon,
  }) : super(key: key);
  final Pokemon pokemon;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: pokemon.baseColor!.withOpacity(0.6), borderRadius: BorderRadius.circular(16)),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(pokemon.name),
            Row(
              children: [
                Column(
                  children: pokemon.type
                      .map((e) => TypeWidget(
                            name: e,
                          ))
                      .toList(),
                ),
                Flexible(child: Image.network(pokemon.image))
              ],
            )
          ],
        ),
      ),
    );
  }
}
