import 'package:flutter/foundation.dart';
import 'package:mobx/mobx.dart';
import 'package:mobx_estudo/app/models/item_model.dart';

part 'home_controller.g.dart';

class HomeController = _HomeControllerBase with _$HomeController;

abstract class _HomeControllerBase with Store {

  @observable
  ObservableList<ItemModel> listItems = ObservableList<ItemModel>().asObservable();

  @observable
  String filter = '';

  @computed
  int get totalChecked => listItems.where((i) => i.check).length;

  @computed
  List<ItemModel> get filteredList {
    if (filter.isEmpty) {
      return listItems;
    } else {
      return listItems.where((i) => i.title.toLowerCase().contains(filter.toLowerCase())).toList();
    }
  }

  @action
  void setFilter(String value) => filter = value;

  @action
  void addItem(ItemModel item) => listItems.add(item);

  @action
  void removeItem(ItemModel item) => listItems.removeWhere((i) => item.title == i.title);
}
