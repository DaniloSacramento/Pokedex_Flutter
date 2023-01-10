import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:pokedex/features/pokedex/screens/login/const/conts_app.dart';
import 'package:pokedex/features/pokedex/screens/pages/home_page.dart';
import 'package:validatorless/validatorless.dart';

import '../registration/registration_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();

  final _email = TextEditingController();

  final _senha = TextEditingController();

  bool _showSenha = false;

  late final Function onTap;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(
                32,
              ),
              child: Opacity(
                opacity: 0.6,
                child: Image.asset(ConstsApp.pokedex),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8),
              child: Form(
                key: _formKey,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      const Text(
                        'Pokedex',
                        style: TextStyle(fontSize: 32, fontFamily: 'Teko', color: Colors.red),
                      ),
                      TextFormField(
                        controller: _email,
                        validator: Validatorless.multiple(
                          [
                            Validatorless.required('Digite seu email'),
                            Validatorless.email('Email inválido'),
                          ],
                        ),
                        decoration: const InputDecoration(
                          hintText: 'Digite seu email',
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.red),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 6),
                        child: TextFormField(
                          controller: _senha,
                          validator: Validatorless.multiple(
                            [
                              Validatorless.required('Digite sua senha'),
                              Validatorless.min(6, 'Senha invalida'),
                            ],
                          ),
                          decoration: InputDecoration(
                            hintText: 'Digite sua senha',
                            enabledBorder: const UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.red),
                            ),
                            suffixIcon: GestureDetector(
                                child: Icon(_showSenha == false ? Icons.visibility_off : Icons.visibility),
                                onTap: () {
                                  setState(() {
                                    _showSenha = !_showSenha;
                                  });
                                }),
                          ),
                          obscureText: _showSenha == false ? true : false,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(1),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            TextButton(
                                onPressed: () {
                                  Navigator.of(context).push(
                                    MaterialPageRoute(
                                      builder: (context) => CadastresePage(),
                                    ),
                                  );
                                },
                                style: const ButtonStyle(),
                                child: const Text('Cadastre-se')),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(
              width: 300,
              child: ElevatedButton(
                onPressed: () {
                  var formValid = _formKey.currentState?.validate() ?? false;
                  if (formValid) {}
                },
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(24),
                  ),
                ),
                child: const Text('Login'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
