import 'package:car_api_challenge/app/pages/login/login_controller.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    final controller = Provider.of<LoginController>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
      ),
      body: Column(
        children: [
          TextField(
            controller: TextEditingController(text: ''),
            onChanged: controller.setUsername,
            decoration: InputDecoration(labelText: 'Username'),
          ),
          TextField(
            controller: TextEditingController(text: ''),
            onChanged: controller.setPassword,
            decoration: InputDecoration(labelText: 'Senha'),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
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
      ),
    );
  }
}
