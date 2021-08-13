import 'package:car_api_challenge/app/pages/login/login_controller.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController _password = TextEditingController();

  bool _showPassword = false;

  _toggleShowPassword() {
    setState(() {
      _showPassword = !_showPassword;
    });
  }

  @override
  Widget build(BuildContext context) {
    final controller = Provider.of<LoginController>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
      ),
      body: Container(
        padding: EdgeInsets.all(20),
        child: SingleChildScrollView(
          child: Column(
            children: [
              TextField(
                controller: TextEditingController(text: ''),
                onChanged: controller.setUsername,
                decoration: InputDecoration(labelText: 'Username'),
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
              Container(
                padding: EdgeInsets.all(16),
                child: InkWell(
                  child: Text('Criar novo usuário'),
                  onTap: () => Navigator.of(context).pushNamed('/sign_up'),
                ),
              )
            ],
          ),
        ),
      ),
      floatingActionButton: Builder(
        builder: (context) => controller.allFieldsCorrect
            ? FloatingActionButton(
                child: Icon(Icons.check),
                onPressed: () async {
                  final canLogin = await controller.login();

                  if (canLogin) {
                    Navigator.of(context).pushReplacementNamed('/home');
                  } else {
                    Scaffold.of(context).showSnackBar(
                      SnackBar(
                        content: Text('Usuário não existente ou senha errada'),
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
