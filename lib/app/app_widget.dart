import 'package:car_api_challenge/app/pages/car_create/car_create_page.dart';
import 'package:car_api_challenge/app/pages/login/login_page.dart';
import 'package:car_api_challenge/app/pages/sign_up/sign_up_controller.dart';
import 'package:car_api_challenge/app/pages/sign_up/sign_up_page.dart';
import 'package:car_api_challenge/app/repositories/local_repository.dart';
import 'package:car_api_challenge/app/repositories/login_repository.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sqflite/sqflite.dart';

import 'pages/car_list/car_list_page.dart';
import 'pages/login/login_controller.dart';
import 'shared/car_list_controller.dart';

class MyApp extends StatelessWidget {
  final Database db;

  const MyApp({Key key, this.db}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<LocalRepository>(create: (context) => LocalRepository(db)),
        ProxyProvider<LocalRepository, CarListController>(
          update: (context, repository, previous) =>
              CarListController(repository),
        ),
        Provider<LoginRepository>(create: (context) => LoginRepository(db)),
        ProxyProvider<LoginRepository, LoginController>(
          update: (context, repository, previous) =>
              LoginController(repository),
        ),
        ProxyProvider<LoginRepository, SignUpController>(
          update: (context, repository, previous) =>
              SignUpController(repository),
        ),
      ],
      child: MaterialApp(
        theme: ThemeData(
            primaryColor: Colors.red[900], accentColor: Colors.grey[900]),
        debugShowCheckedModeBanner: false,
        initialRoute: '/',
        routes: {
          '/': (context) => LoginPage(),
          '/sign_up': (context) => SignUpPage(),
          '/home': (context) => CarListPage(),
          '/create': (context) => CarCreatePage(),
          '/edit': (context) => CarCreatePage(),
        },
      ),
    );
  }
}
