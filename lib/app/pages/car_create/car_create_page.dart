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
    bool isEdit = false;

    if (ModalRoute.of(context).settings.arguments != null) {
      carArgument = ModalRoute.of(context).settings.arguments;
      isEdit = true;
    }

    final CarListController globalCarController =
        Provider.of<CarListController>(context);

    final controller = CarCreateController(carArgument, globalCarController);

    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        centerTitle: true,
        title: Text(isEdit ? 'Editar Carro' : 'Criar novo carro'),
        actions: [
          isEdit
              ? IconButton(
                  icon: Icon(Icons.delete),
                  onPressed: () async {
                    await showDialog(
                        context: context,
                        child: AlertDialog(
                          title: Text(
                              'Tem certeza que deseja deletar esse carro?'),
                          actions: [
                            TextButton(
                                onPressed: () async {
                                  await globalCarController
                                      .deleteCar(carArgument);

                                  Navigator.of(context).pop();
                                  Navigator.of(context).pop();
                                },
                                child: Text('Deletar'))
                          ],
                        ));
                  },
                )
              : Container()
        ],
      ),
      body: TextFieldListWidget(
        isEdit: isEdit,
        controller: controller,
      ),
      floatingActionButton: FloatingActionButton(
          backgroundColor: Theme.of(context).primaryColor,
          child: Icon(Icons.check),
          onPressed: () async {
            isEdit ? await controller.editCar() : await controller.addNewCar();
            Navigator.of(context).pop();
          }),
    );
  }
}
