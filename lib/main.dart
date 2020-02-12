import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobx_estudo/body.dart';
import 'package:provider/provider.dart';

import 'controller.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<Controller>(
          create: (_) => Controller(), dispose: (_, controller) => controller.dispose(),)
      ],
      child: MaterialApp(
        title: 'MobX',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: MyHomePage(),
      ),
    );
  }
}

class MyHomePage extends StatelessWidget {
  MyHomePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Provider.of<Controller>(context);

    return Scaffold(
        appBar: AppBar(
          title: Observer(
            builder: (_) => Text(controller.isValid ? 'Form Valid' : 'Form Invalid'),
          ),
        ),
        body: BodyWidget());
  }
}
