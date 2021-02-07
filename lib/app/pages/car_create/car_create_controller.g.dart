// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'car_create_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$CarCreateController on _CarCreateControllerBase, Store {
  final _$modelAtom = Atom(name: '_CarCreateControllerBase.model');

  @override
  String get model {
    _$modelAtom.reportRead();
    return super.model;
  }

  @override
  set model(String value) {
    _$modelAtom.reportWrite(value, super.model, () {
      super.model = value;
    });
  }

  final _$brandAtom = Atom(name: '_CarCreateControllerBase.brand');

  @override
  String get brand {
    _$brandAtom.reportRead();
    return super.brand;
  }

  @override
  set brand(String value) {
    _$brandAtom.reportWrite(value, super.brand, () {
      super.brand = value;
    });
  }

  final _$photoAtom = Atom(name: '_CarCreateControllerBase.photo');

  @override
  String get photo {
    _$photoAtom.reportRead();
    return super.photo;
  }

  @override
  set photo(String value) {
    _$photoAtom.reportWrite(value, super.photo, () {
      super.photo = value;
    });
  }

  final _$yearAtom = Atom(name: '_CarCreateControllerBase.year');

  @override
  int get year {
    _$yearAtom.reportRead();
    return super.year;
  }

  @override
  set year(int value) {
    _$yearAtom.reportWrite(value, super.year, () {
      super.year = value;
    });
  }

  final _$priceAtom = Atom(name: '_CarCreateControllerBase.price');

  @override
  int get price {
    _$priceAtom.reportRead();
    return super.price;
  }

  @override
  set price(int value) {
    _$priceAtom.reportWrite(value, super.price, () {
      super.price = value;
    });
  }

  final _$addNewCarAsyncAction =
      AsyncAction('_CarCreateControllerBase.addNewCar');

  @override
  Future addNewCar() {
    return _$addNewCarAsyncAction.run(() => super.addNewCar());
  }

  final _$editCarAsyncAction = AsyncAction('_CarCreateControllerBase.editCar');

  @override
  Future editCar() {
    return _$editCarAsyncAction.run(() => super.editCar());
  }

  final _$_CarCreateControllerBaseActionController =
      ActionController(name: '_CarCreateControllerBase');

  @override
  dynamic setModel(String value) {
    final _$actionInfo = _$_CarCreateControllerBaseActionController.startAction(
        name: '_CarCreateControllerBase.setModel');
    try {
      return super.setModel(value);
    } finally {
      _$_CarCreateControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setBrand(String value) {
    final _$actionInfo = _$_CarCreateControllerBaseActionController.startAction(
        name: '_CarCreateControllerBase.setBrand');
    try {
      return super.setBrand(value);
    } finally {
      _$_CarCreateControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setPhoto(String value) {
    final _$actionInfo = _$_CarCreateControllerBaseActionController.startAction(
        name: '_CarCreateControllerBase.setPhoto');
    try {
      return super.setPhoto(value);
    } finally {
      _$_CarCreateControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setYear(String value) {
    final _$actionInfo = _$_CarCreateControllerBaseActionController.startAction(
        name: '_CarCreateControllerBase.setYear');
    try {
      return super.setYear(value);
    } finally {
      _$_CarCreateControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setPrice(String value) {
    final _$actionInfo = _$_CarCreateControllerBaseActionController.startAction(
        name: '_CarCreateControllerBase.setPrice');
    try {
      return super.setPrice(value);
    } finally {
      _$_CarCreateControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
model: ${model},
brand: ${brand},
photo: ${photo},
year: ${year},
price: ${price}
    ''';
  }
}
