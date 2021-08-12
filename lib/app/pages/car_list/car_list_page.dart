import 'package:car_api_challenge/app/pages/car_list/components/car_card_widget.dart';
import 'package:car_api_challenge/app/shared/car_list_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';

class CarListPage extends StatefulWidget {
  @override
  _CarListPageState createState() => _CarListPageState();
}

class _CarListPageState extends State<CarListPage> {
  @override
  Widget build(BuildContext context) {
    final CarListController controller =
        Provider.of<CarListController>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Carros'),
        centerTitle: true,
        actions: [
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () => Navigator.pushNamed(context, '/create'),
          )
        ],
      ),
      body: FutureBuilder(
          future: controller.fetchInitialData(),
          builder: (_, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              return Container(
                color: Theme.of(context).accentColor,
                child: Observer(
                  builder: (context) {
                    return ListView.builder(
                      physics: BouncingScrollPhysics(),
                      itemCount: controller.cars.length,
                      itemBuilder: (context, index) =>
                          CarCardWidget(car: controller.cars[index]),
                    );
                  },
                ),
              );
            } else {
              return CircularProgressIndicator();
            }
          }),
    );
  }
}
