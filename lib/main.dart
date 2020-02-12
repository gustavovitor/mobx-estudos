import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:mobx_estudo/body.dart';

import 'controller.dart';

void main() {
  GetIt getIt = GetIt.I;

  getIt.registerSingleton<Controller>(Controller());


  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MobX',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  MyHomePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = GetIt.I.get<Controller>();

    return Scaffold(
        appBar: AppBar(
          title: Observer(
            builder: (_) => Text(controller.isValid ? 'Form Valid' : 'Form Invalid'),
          ),
        ),
        body: BodyWidget());
  }
}
