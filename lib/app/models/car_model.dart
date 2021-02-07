class CarModel {
  String model;
  String brand;
  int year;
  int price;
  String photo;

  CarModel({this.model, this.brand, this.year, this.price, this.photo});

  CarModel.fromJson(Map<String, dynamic> json) {
    model = json['model'];
    brand = json['brand'];
    year = json['year'];
    price = json['price'];
    photo = json['photo'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['model'] = this.model;
    data['brand'] = this.brand;
    data['year'] = this.year;
    data['price'] = this.price;
    data['photo'] = this.photo;
    return data;
  }

  CarModel copy() {
    return new CarModel(
      model: this.model,
      brand: this.brand,
      year: this.year,
      price: this.price,
      photo: this.photo,
    );
  }
}
