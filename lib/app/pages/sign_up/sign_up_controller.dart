import 'package:car_api_challenge/app/models/user_model.dart';
import 'package:car_api_challenge/app/repositories/login_repository.dart';
import 'package:mobx/mobx.dart';
part 'sign_up_controller.g.dart';

class SignUpController = _SignUpControllerBase with _$SignUpController;

abstract class _SignUpControllerBase with Store {
  final LoginRepository _repository;
  _SignUpControllerBase(this._repository);

  @observable
  String name = '';
  @action
  setName(String value) => name = value;

  @observable
  int age = 0;
  @action
  setAge(int value) => age = value;

  @observable
  String username = '';
  @action
  setUsername(String value) => username = value;

  @observable
  String password = '';
  @action
  setPassword(String value) => password = value;

  @observable
  String confirmPassword = '';
  @action
  setConfirmPassword(String value) => confirmPassword = value;

  @computed
  bool get allFieldsCorrect {
    return confirmPassword.isNotEmpty &&
        username.isNotEmpty &&
        name.isNotEmpty &&
        confirmPassword == password;
  }

  Future<bool> signUp() async {
    final canLogin = await _repository.signUp(UserModel(
      name: name,
      username: username,
      age: age,
      password: password,
    ));

    return canLogin;
  }
}
