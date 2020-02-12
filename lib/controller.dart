import 'package:mobx/mobx.dart';

import 'models/client.dart';

part 'controller.g.dart';
class Controller = ControllerBase with _$Controller;

abstract class ControllerBase with Store {
  var client = Client();

  @computed
  bool get isValid {
    return validateName() == null &&
           validateEmail() == null &&
           validateCpf() == null;
  }

  String validateName() {
    if (client.name == null || client.name.isEmpty) {
      return 'O nome é obrigatório!';
    }

    return null;
  }

  String validateEmail() {
    if (client.email == null || client.email.isEmpty || !client.email.contains('@')) {
      return 'Email inválido!';
    }

    return null;
  }

  String validateCpf() {
    if (client.cpf == null || client.cpf.isEmpty) {
      return 'O CPF é obrigatório!';
    }

    return null;
  }

  dispose() {}
}