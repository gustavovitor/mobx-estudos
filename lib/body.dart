import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobx_estudo/controller.dart';
import 'package:provider/provider.dart';

class BodyWidget extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final Controller controller = Provider.of<Controller>(context);

    return Padding(
      padding: EdgeInsets.all(50),
      child: Center(
        child: ListView(
          children: <Widget>[
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Observer(
                  builder: (_) {
                    return _textField(
                        label: "Nome",
                        onChanged: controller.client.setName,
                        errorText: controller.validateName
                    );
                  },
                ),
                SizedBox(height: 20,),
                Observer(
                  builder: (_) {
                    return _textField(
                        label: "Email",
                        onChanged: controller.client.setEmail,
                        errorText: controller.validateEmail
                    );
                  },
                ),
                SizedBox(height: 20,),
                Observer(
                  builder: (_) {
                    return _textField(
                        label: "CPF",
                        onChanged: controller.client.setCpf,
                        errorText: controller.validateCpf
                    );
                  },
                ),
                SizedBox(height: 20,),
                Row(
                  children: <Widget>[
                    Expanded(
                      child: Container(
                        height: 46,
                        child: Observer(
                          builder: (_) => RaisedButton(
                            color: Colors.blue,
                            textColor: Colors.white,
                            onPressed: controller.isValid ? () {} : null,
                            child: Text("Salvar"),
                          ),
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ],
        ),
      ),
    );
  }

  _textField({String label, Function onChanged, String Function() errorText}) {
    return TextField(
      onChanged: onChanged,
      decoration: InputDecoration(
        border: OutlineInputBorder(),
        labelText: label,
        errorText: errorText == null ? null : errorText(),
      ),
    );
  }
}
