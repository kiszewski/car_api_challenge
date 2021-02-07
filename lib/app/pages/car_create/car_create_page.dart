import 'package:car_api_challenge/app/models/car_model.dart';
import 'package:car_api_challenge/app/pages/car_create/car_create_controller.dart';
import 'package:car_api_challenge/app/shared/car_list_controller.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

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

    final _width = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        centerTitle: true,
        title: Text(edit ? 'Editar Carro' : 'Criar novo carro'),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(20),
          child: Column(
            children: [
              edit
                  ? SizedBox()
                  : TextField(
                      controller: edit
                          ? TextEditingController(text: controller.model)
                          : null,
                      onChanged: controller.setModel,
                      decoration: InputDecoration(labelText: 'Modelo'),
                    ),
              TextField(
                controller:
                    edit ? TextEditingController(text: controller.brand) : null,
                onChanged: controller.setBrand,
                decoration: InputDecoration(labelText: 'Marca'),
              ),
              TextField(
                controller:
                    edit ? TextEditingController(text: controller.photo) : null,
                onChanged: controller.setPhoto,
                decoration: InputDecoration(labelText: 'Foto URL'),
              ),
              Row(
                children: [
                  Container(
                    width: _width * .3,
                    child: TextFormField(
                      maxLength: 4,
                      controller: edit
                          ? TextEditingController(
                              text: controller.year.toString(),
                            )
                          : null,
                      keyboardType: TextInputType.number,
                      onChanged: controller.setYear,
                      decoration: InputDecoration(labelText: 'Ano'),
                    ),
                  ),
                  Spacer(),
                  Container(
                    width: _width * .4,
                    child: TextFormField(
                      maxLength: 10,
                      controller: edit
                          ? TextEditingController(
                              text: controller.price.toString())
                          : null,
                      keyboardType: TextInputType.number,
                      onChanged: controller.setPrice,
                      decoration: InputDecoration(labelText: 'Preço'),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
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
