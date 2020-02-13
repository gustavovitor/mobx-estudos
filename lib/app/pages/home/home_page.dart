import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobx_estudo/app/models/item_model.dart';
import 'package:mobx_estudo/app/pages/home/components/home_controller.dart';
import 'package:mobx_estudo/app/pages/home/components/item_widget.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final controller = HomeController();

  _dialog() {
    var model = ItemModel();

    showDialog(
        context: context,
        builder: (_) {
          return AlertDialog(
            title: Text('Adicionar Item'),
            content: TextField(
              onChanged: model.setTitle,
              decoration: InputDecoration(hintText: 'Novo Item'),
            ),
            actions: <Widget>[
              FlatButton(
                onPressed: () {
                  controller.addItem(model);
                  Navigator.of(context).pop();
                },
                child: Text('Salvar'),
              ),
              FlatButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text('Cancelar'),
              )
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          actions: <Widget>[
            IconButton(
              onPressed: () {},
              icon: Observer(
                builder: (_) => Text('${controller.totalChecked}'),
              ),
            )
          ],
          title: TextField(
            decoration: InputDecoration(hintText: 'Pesquisa'),
          )),
      body: Observer(
        builder: (_) {
          return ListView.builder(
              itemCount: controller.listItems.length,
              itemBuilder: (_, index) {
                var item = controller.listItems[index];
                return ItemWidget(
                  item: item,
                  onRemove: () {
                    controller.removeItem(item);
                  },
                );
              });
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          _dialog();
        },
      ),
    );
  }
}
