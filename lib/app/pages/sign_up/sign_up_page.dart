import 'package:car_api_challenge/app/pages/sign_up/sign_up_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({Key key}) : super(key: key);

  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  TextEditingController _password = TextEditingController();
  TextEditingController _confirmPassword = TextEditingController();

  bool _showPassword = false;

  _toggleShowPassword() {
    setState(() {
      _showPassword = !_showPassword;
    });
  }

  bool _showConfirmPassword = false;

  _toggleConfirmPassword() {
    setState(() {
      _showConfirmPassword = !_showConfirmPassword;
    });
  }

  @override
  Widget build(BuildContext context) {
    final controller = Provider.of<SignUpController>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Criar usuário'),
      ),
      body: Container(
        padding: EdgeInsets.all(20),
        child: SingleChildScrollView(
          child: Column(
            children: [
              TextField(
                controller: TextEditingController(text: ''),
                onChanged: controller.setName,
                decoration: InputDecoration(labelText: 'Nome'),
              ),
              TextField(
                controller: TextEditingController(text: ''),
                onChanged: controller.setUsername,
                decoration: InputDecoration(labelText: 'Username'),
              ),
              TextField(
                keyboardType: TextInputType.numberWithOptions(
                    decimal: false, signed: true),
                inputFormatters: <TextInputFormatter>[
                  FilteringTextInputFormatter.allow(
                      RegExp(r'^\s*[0-9]{1,2}\s*$')),
                ],
                controller: TextEditingController(text: ''),
                onChanged: (value) => controller.setAge(int.parse(value)),
                decoration: InputDecoration(labelText: 'Idade'),
              ),
              TextField(
                controller: _password,
                onChanged: controller.setPassword,
                decoration: InputDecoration(
                    labelText: 'Senha',
                    suffixIcon: IconButton(
                      icon: Icon(_showPassword
                          ? Icons.visibility_off
                          : Icons.visibility),
                      onPressed: _toggleShowPassword,
                    )),
                obscureText: _showPassword ? false : true,
              ),
              TextField(
                controller: _confirmPassword,
                onChanged: controller.setConfirmPassword,
                decoration: InputDecoration(
                    labelText: 'Cofirmar Senha',
                    suffixIcon: IconButton(
                      icon: Icon(_showPassword
                          ? Icons.visibility_off
                          : Icons.visibility),
                      onPressed: _toggleConfirmPassword,
                    )),
                obscureText: _showConfirmPassword ? false : true,
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: Observer(
        builder: (context) => controller.allFieldsCorrect
            ? FloatingActionButton(
                child: Icon(Icons.add),
                onPressed: () async {
                  final canLogin = await controller.signUp();

                  if (canLogin) {
                    Navigator.of(context).pop();
                    Navigator.of(context).pushReplacementNamed('/home');
                  } else {
                    Scaffold.of(context).showSnackBar(
                      SnackBar(
                        content: Text('Erro ao cadastrar usuário'),
                        backgroundColor: Colors.red,
                      ),
                    );
                  }
                },
              )
            : Container(),
      ),
    );
  }
}
