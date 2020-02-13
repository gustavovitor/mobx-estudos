import 'package:mobx/mobx.dart';
import 'package:mobx_estudo/app/models/item_model.dart';

part 'home_controller.g.dart';

class HomeController = _HomeControllerBase with _$HomeController;

abstract class _HomeControllerBase with Store {

  @observable
  ObservableList<ItemModel> listItems = ObservableList<ItemModel>().asObservable();

  @computed
  int get totalChecked => listItems.where((i) => i.check).length;

  @action
  void addItem(ItemModel item) => listItems.add(item);

  @action
  void removeItem(ItemModel item) => listItems.removeWhere((i) => item.title == i.title);
}
