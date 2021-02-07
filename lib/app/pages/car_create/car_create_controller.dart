import 'package:car_api_challenge/app/models/car_model.dart';
import 'package:car_api_challenge/app/shared/car_list_controller.dart';
import 'package:mobx/mobx.dart';
part 'car_create_controller.g.dart';

class CarCreateController = _CarCreateControllerBase with _$CarCreateController;

abstract class _CarCreateControllerBase with Store {
  final CarModel car;
  final CarListController globalCarController;

  _CarCreateControllerBase(
    this.car,
    this.globalCarController,
  ) {
    if (model == null) setModel(car.model ?? '');
    if (brand == null) setBrand(car.brand ?? '');
    if (photo == null) setPhoto(car.photo ?? '');
    if (price == null) setPrice(car.price?.toString() ?? '0');
    if (year == null) setYear(car.year?.toString() ?? '0');
  }

  @observable
  String model;

  @observable
  String brand;

  @observable
  String photo;

  @observable
  int year;

  @observable
  int price;

  @action
  setModel(String value) {
    model = value;
    car.model = value;
  }

  @action
  setBrand(String value) {
    brand = value;
    car.brand = value;
  }

  @action
  setPhoto(String value) {
    photo = value;
    car.photo = value;
  }

  @action
  setYear(String value) {
    year = int.parse(value);
    car.year = int.parse(value);
  }

  @action
  setPrice(String value) {
    price = int.parse(value);
    car.price = int.parse(value);
  }

  @action
  addNewCar() async {
    await globalCarController.addCar(car);
    brand = '';
    model = '';
    photo = '';
    year = 0;
    price = 0;
  }

  @action
  editCar() async {
    await globalCarController.updateCar(car);
  }
}
