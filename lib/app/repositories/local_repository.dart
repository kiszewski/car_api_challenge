import 'package:car_api_challenge/app/models/car_model.dart';
import 'package:sqflite/sqflite.dart';

class LocalRepository {
  final Database db;

  LocalRepository(this.db);

  Future insertCar(CarModel car) async {
    final existingCars =
        await db.query('cars', where: 'model = ?', whereArgs: [car.model]);

    if (existingCars.isEmpty) {
      await db.insert('cars', car.toJson());
    }
  }

  insertCloneCar(CarModel car) async {
    final existingCars = await db
        .query('clone_cars', where: 'model = ?', whereArgs: [car.model]);

    if (existingCars.isEmpty) {
      await db.insert('clone_cars', car.toJson());
    }
  }

  Future<List<CarModel>> getCloneCars() async {
    final maps = await db.query('clone_cars');
    return maps.map((json) => CarModel.fromJson(json)).toList();
  }

  Future updateCar(CarModel car) async {
    await db.update('clone_cars', car.toJson(),
        where: 'model = ?', whereArgs: [car.model]);
  }
}
