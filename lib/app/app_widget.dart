import 'package:car_api_challenge/app/pages/car_create/car_create_page.dart';
import 'package:car_api_challenge/app/repositories/local_repository.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sqflite/sqflite.dart';

import 'pages/car_list/car_list_page.dart';
import 'shared/car_list_controller.dart';

class MyApp extends StatelessWidget {
  final Database db;

  const MyApp({Key key, this.db}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<LocalRepository>(create: (context) => LocalRepository(db)),
        Provider<CarListController>(
          create: (context) => CarListController(
            Provider.of<LocalRepository>(context, listen: false),
          ),
        ),
      ],
      child: MaterialApp(
        theme: ThemeData(
            primaryColor: Colors.red[900], accentColor: Colors.grey[900]),
        debugShowCheckedModeBanner: false,
        initialRoute: '/',
        routes: {
          '/': (context) => CarListPage(),
          '/create': (context) => CarCreatePage(),
          '/edit': (context) => CarCreatePage(),
        },
      ),
    );
  }
}
