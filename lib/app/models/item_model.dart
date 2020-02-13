import 'package:mobx/mobx.dart';

part 'item_model.g.dart';

class ItemModel = _ItemModelBase with _$ItemModel;

abstract class _ItemModelBase with Store {

  _ItemModelBase({this.title, this.check = false});

  @observable
  String title;

  @observable
  bool check;

  @action
  void setTitle(String text) => title = text;

  @action
  void setCheck(bool value) => check = value;
}
