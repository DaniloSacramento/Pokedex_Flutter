import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:validatorless/validatorless.dart';

class CadastresePage extends StatefulWidget {
  CadastresePage({super.key});

  @override
  State<CadastresePage> createState() => _CadastresePageState();
}

class _CadastresePageState extends State<CadastresePage> {
  final _formKey = GlobalKey<FormState>();

  final _email = TextEditingController();

  final _numero = TextEditingController();

  final _senha = TextEditingController();

  bool _showSenha = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: Padding(
            padding: const EdgeInsets.only(right: 10.0),
            child: IconButton(
              icon: const Icon(Icons.arrow_back, color: Colors.red),
              onPressed: () => Navigator.of(context).pop(),
            ),
          ),
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              const Padding(
                padding: EdgeInsets.only(top: 35, left: 0, right: 240),
                child: Text(
                  'CADASTRE-SE',
                  style: TextStyle(fontSize: 36, fontFamily: 'Teko'),
                ),
              ),
              Column(
                children: const [
                  Padding(
                    padding: EdgeInsets.only(left: 0, top: 1, right: 131),
                    child: Text(
                      'E VIRE UM MESTRE POKEMON',
                      style: TextStyle(fontSize: 19, fontFamily: 'Google', color: Colors.red),
                    ),
                  ),
                ],
              ),
              Form(
                key: _formKey,
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(17),
                      child: TextFormField(
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
                    ),
                    Padding(
                      padding: const EdgeInsets.all(17),
                      child: TextFormField(
                        controller: _numero,
                        validator: Validatorless.multiple(
                          [
                            Validatorless.required('Digite seu numero de telefone'),
                            Validatorless.number('Numero invalido'),
                          ],
                        ),
                        decoration: const InputDecoration(
                          hintText: 'Digite seu numero de telefone',
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.red),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(17),
                      child: TextFormField(
                        controller: _senha,
                        validator: Validatorless.multiple([
                          Validatorless.required('Digite sua senha'),
                          Validatorless.min(6, 'Senha invalida'),
                        ]),
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
                    )
                  ],
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
                  child: const Text('Confirmar'),
                ),
              ),
            ],
          ),
        ));
  }
}
