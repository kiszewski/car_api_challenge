// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'car_list_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$CarListController on _CarListControllerBase, Store {
  final _$carsAtom = Atom(name: '_CarListControllerBase.cars');

  @override
  List<CarModel> get cars {
    _$carsAtom.reportRead();
    return super.cars;
  }

  @override
  set cars(List<CarModel> value) {
    _$carsAtom.reportWrite(value, super.cars, () {
      super.cars = value;
    });
  }

  final _$addCarAsyncAction = AsyncAction('_CarListControllerBase.addCar');

  @override
  Future addCar(CarModel value) {
    return _$addCarAsyncAction.run(() => super.addCar(value));
  }

  final _$updateCarAsyncAction =
      AsyncAction('_CarListControllerBase.updateCar');

  @override
  Future updateCar(CarModel updatedCar) {
    return _$updateCarAsyncAction.run(() => super.updateCar(updatedCar));
  }

  final _$_CarListControllerBaseActionController =
      ActionController(name: '_CarListControllerBase');

  @override
  dynamic _initCars(List<CarModel> value) {
    final _$actionInfo = _$_CarListControllerBaseActionController.startAction(
        name: '_CarListControllerBase._initCars');
    try {
      return super._initCars(value);
    } finally {
      _$_CarListControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
cars: ${cars}
    ''';
  }
}
