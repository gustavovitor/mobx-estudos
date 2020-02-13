import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobx_estudo/app/models/item_model.dart';

class ItemWidget extends StatelessWidget {

  final ItemModel item;
  final Function onRemove;

  ItemWidget({this.item, this.onRemove});

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (_) =>
          ListTile(
            title: Text(item.title),
            leading: Checkbox(
              value: item.check,
              onChanged: item.setCheck,
            ),
            trailing: IconButton(
              onPressed: this.onRemove,
              icon: Icon(Icons.remove_circle),
              color: Colors.red,
            ),
          )
    );
  }
}
