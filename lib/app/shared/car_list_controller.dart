import 'package:car_api_challenge/app/models/car_model.dart';
import 'package:car_api_challenge/app/repositories/cars_repository.dart';
import 'package:mobx/mobx.dart';
part 'car_list_controller.g.dart';

class CarListController = _CarListControllerBase with _$CarListController;

abstract class _CarListControllerBase with Store {
  final CarsRepository _localRepository;

  _CarListControllerBase(this._localRepository);

  @observable
  List<CarModel> cars = [];

  @action
  Future fetchInitialData() async {
    final result = await _localRepository.getCars();

    cars = result;
  }

  @action
  addCar(CarModel value) async {
    List<CarModel> newCars = cars.map((e) => e).toList();

    newCars.add(value);
    cars = newCars;

    await _localRepository.insertCar(value);
  }

  @action
  updateCar(CarModel updatedCar) async {
    List<CarModel> newCars = cars.map((e) => e).toList();

    cars = newCars
        .map((value) => value = value.id == updatedCar.id ? updatedCar : value)
        .toList();

    await _localRepository.updateCar(updatedCar);
  }

  @action
  deleteCar(CarModel car) async {
    List<CarModel> newCars = cars.map((e) => e).toList();

    newCars.removeWhere((element) => car.id == element.id);

    cars = newCars;

    await _localRepository.deleteCar(car);
  }
}
