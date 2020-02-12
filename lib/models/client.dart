import 'package:mobx/mobx.dart';
part 'client.g.dart';

class Client = ClientBase with _$Client;

abstract class ClientBase with Store {

  @observable
  String name;

  @observable
  String email;

  @observable
  String cpf;

  @action
  setName(String text) => name = text;

  @action
  setEmail(String text) => email = text;

  @action
  setCpf(String text) => cpf = text;

}
