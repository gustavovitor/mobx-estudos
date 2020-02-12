import 'package:mobx/mobx.dart';

part 'controller.g.dart';
class Controller = ControllerBase with _$Controller;

abstract class ControllerBase with Store {
  @observable
  String nome = '';

  @observable
  String sobrenome = '';

  @computed
  String get nomeCompleto => "$nome $sobrenome";

  @action
  changeName(String text) {
    nome = text;
  }

  @action
  changeSobrenome(String text) {
    sobrenome = text;
  }
}