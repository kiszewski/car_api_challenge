import 'package:car_api_challenge/app/repositories/login_repository.dart';
import 'package:mobx/mobx.dart';
part 'login_controller.g.dart';

class LoginController = _LoginControllerBase with _$LoginController;

abstract class _LoginControllerBase with Store {
  final LoginRepository _repository;

  _LoginControllerBase(this._repository);
  @action
  setUsername(String value) => username = value;

  @observable
  String username = '';

  @observable
  String password = '';
  @action
  setPassword(String value) => password = value;

  @computed
  bool get allFieldsCorrect {
    return password.isNotEmpty && username.isNotEmpty;
  }

  Future<bool> login() async {
    final canLogin = await _repository.login(username, password);

    return canLogin;
  }
}
