import 'package:car_api_challenge/app/models/car_model.dart';
import 'package:car_api_challenge/app/pages/car_create/car_create_controller.dart';
import 'package:car_api_challenge/app/shared/car_list_controller.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'components/text_field_list_widget.dart';

class CarCreatePage extends StatefulWidget {
  @override
  _CarCreatePageState createState() => _CarCreatePageState();
}

class _CarCreatePageState extends State<CarCreatePage> {
  @override
  Widget build(BuildContext context) {
    CarModel carArgument = CarModel();
    bool edit = false;

    if (ModalRoute.of(context).settings.arguments != null) {
      carArgument = ModalRoute.of(context).settings.arguments;
      edit = true;
    }

    final CarListController globalCarController =
        Provider.of<CarListController>(context);

    final controller = CarCreateController(carArgument, globalCarController);

    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        centerTitle: true,
        title: Text(edit ? 'Editar Carro' : 'Criar novo carro'),
      ),
      body: TextFieldListWidget(
        edit: edit,
        controller: controller,
      ),
      floatingActionButton: FloatingActionButton(
          backgroundColor: Theme.of(context).primaryColor,
          child: Icon(Icons.check),
          onPressed: () async {
            edit ? await controller.editCar() : await controller.addNewCar();
            Navigator.of(context).pop();
          }),
    );
  }
}
