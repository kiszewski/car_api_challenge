import 'package:flutter/material.dart';

import '../car_create_controller.dart';

class TextFieldListWidget extends StatelessWidget {
  final bool isEdit;
  final CarCreateController controller;

  const TextFieldListWidget({Key key, this.isEdit, this.controller})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    final _width = MediaQuery.of(context).size.width;

    return SingleChildScrollView(
      child: Container(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            TextField(
              controller:
                  isEdit ? TextEditingController(text: controller.model) : null,
              onChanged: controller.setModel,
              decoration: InputDecoration(labelText: 'Modelo'),
            ),
            TextField(
              controller:
                  isEdit ? TextEditingController(text: controller.brand) : null,
              onChanged: controller.setBrand,
              decoration: InputDecoration(labelText: 'Marca'),
            ),
            TextField(
              controller:
                  isEdit ? TextEditingController(text: controller.photo) : null,
              onChanged: controller.setPhoto,
              decoration: InputDecoration(labelText: 'Foto URL'),
            ),
            Row(
              children: [
                Container(
                  width: _width * .3,
                  child: TextFormField(
                    maxLength: 4,
                    controller: isEdit
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
                    controller: isEdit
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
    );
  }
}
