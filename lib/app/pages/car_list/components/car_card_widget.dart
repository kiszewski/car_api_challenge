import 'package:car_api_challenge/app/models/car_model.dart';
import 'package:flutter/material.dart';

class CarCardWidget extends StatelessWidget {
  final CarModel car;

  const CarCardWidget({Key key, this.car}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _height = MediaQuery.of(context).size.height;
    final _width = MediaQuery.of(context).size.width;

    return Container(
      margin: EdgeInsets.only(bottom: _width * .02),
      width: _width,
      height: _height * .3,
      child: Stack(
        children: [
          Positioned.fill(
              child:
                  FittedBox(fit: BoxFit.fill, child: Image.network(car.photo))),
          Positioned.fill(
            child: Container(color: Colors.black26),
          ),
          Positioned(
              top: 5,
              left: 5,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    car.model,
                    style: TextStyle(color: Colors.white, fontSize: 24),
                  ),
                  Text(car.brand, style: TextStyle(color: Colors.white)),
                ],
              )),
          Positioned(
            bottom: 5,
            right: 5,
            child: Text('R\$ ${car.price}',
                style: TextStyle(color: Colors.white, fontSize: 24)),
          ),
          Positioned(
            bottom: 5,
            left: 5,
            child: Text('Ano ${car.year}',
                style: TextStyle(color: Colors.white, fontSize: 20)),
          ),
          Positioned(
            top: 0,
            right: 0,
            child: IconButton(
              color: Colors.white,
              icon: Icon(Icons.edit),
              onPressed: () =>
                  Navigator.pushNamed(context, '/edit', arguments: car.copy()),
            ),
          )
        ],
      ),
    );
  }
}
