import 'package:car_api_challenge/app/models/car_model.dart';
import 'package:car_api_challenge/app/repositories/external_repository.dart';
import 'package:car_api_challenge/app/repositories/local_repository.dart';
import 'package:mobx/mobx.dart';
part 'car_list_controller.g.dart';

class CarListController = _CarListControllerBase with _$CarListController;

abstract class _CarListControllerBase with Store {
  final ExternalRepository externalRepository;
  final LocalRepository localRepository;

  _CarListControllerBase(this.externalRepository, this.localRepository) {
    localRepository.getCloneCars().then((value) {
      if (value.isEmpty) {
        externalRepository.getCars().then((cars) => cars.forEach((element) {
              localRepository
                  .insertCar(element)
                  .then((_) => localRepository.insertCloneCar(element))
                  .then((_) => localRepository.getCloneCars().then(_initCars));
            }));
      } else {
        localRepository.getCloneCars().then(_initCars);
      }
    });
  }

  @observable
  List<CarModel> cars = [];

  @action
  _initCars(List<CarModel> value) => cars = value;

  @action
  addCar(CarModel value) async {
    List<CarModel> newCars = cars.map((e) => e).toList();

    newCars.add(value);
    cars = newCars;

    await localRepository.insertCloneCar(value);
  }

  @action
  updateCar(CarModel updatedCar) async {
    List<CarModel> newCars = cars.map((e) => e).toList();

    cars = newCars
        .map((value) =>
            value = value.model == updatedCar.model ? updatedCar : value)
        .toList();

    await localRepository.updateCar(updatedCar);
  }
}
