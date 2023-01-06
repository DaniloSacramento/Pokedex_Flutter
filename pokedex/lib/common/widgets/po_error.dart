import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class PoError extends StatelessWidget {
  const PoError({
    Key? key,
    this.error,
  }) : super(key: key);
  final String? error;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text(error ?? 'Não foi possível carregar os dados')),
    );
  }
}
