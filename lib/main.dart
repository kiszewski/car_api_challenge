import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'dart:async';

import 'app/app_widget.dart';

final String sql1 =
    'CREATE TABLE cars(id INTEGER PRIMARY KEY, model TEXT, brand TEXT, price INTEGER, year INTEGER, photo TEXT);';

final String sql2 =
    'CREATE TABLE users(id INTEGER PRIMARY KEY, name TEXT, password TEXT, username TEXT, age INTEGER);';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final Future<Database> database = openDatabase(
    join(await getDatabasesPath(), 'cars_database.db'),
    onCreate: (db, version) async {
      await db.execute(sql1);
      await db.execute(sql2);
    },
    version: 1,
  );

  final Database db = await database;

  runApp(MyApp(db: db));
}
