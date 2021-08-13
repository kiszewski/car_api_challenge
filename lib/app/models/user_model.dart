class UserModel {
  int id;
  String name;
  String username;
  int age;

  UserModel({this.id, this.name, this.username, this.age});

  UserModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    username = json['username'];
    age = json['age'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['username'] = this.username;
    data['age'] = this.age;

    return data;
  }

  UserModel copy() {
    return new UserModel(
      id: this.id,
      name: this.name,
      username: this.username,
      age: this.age,
    );
  }
}
