import 'package:car_api_challenge/app/models/car_model.dart';
import 'package:sqflite/sqflite.dart';

class CarsRepository {
  final Database db;

  CarsRepository(this.db);

  Future insertCar(CarModel car) async {
    final existingCars =
        await db.query('cars', where: 'model = ?', whereArgs: [car.model]);

    if (existingCars.isEmpty) {
      await db.insert('cars', car.toJson());
    }
  }

  Future<List<CarModel>> getCars() async {
    final maps = await db.query('cars');
    return maps.map((json) => CarModel.fromJson(json)).toList();
  }

  Future updateCar(CarModel car) async {
    await db.update('cars', car.toJson(),
        where: 'model = ?', whereArgs: [car.model]);
  }

  Future deleteCar(CarModel car) async {
    await db.delete('cars', where: 'model = ?', whereArgs: [car.model]);
  }
}
