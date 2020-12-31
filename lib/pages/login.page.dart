import 'package:flutter/material.dart';
import 'package:poliza/widgets/fondo.widget.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          FondoWidget(),
          _loginForm(context),
        ],
      ),
    );
  }

  Widget _loginForm(BuildContext context) {
    Size sizeWindow = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Column(
        children: [
          SafeArea(
              child: Container(
            height: 250.0,
          )),
          Container(
            width: sizeWindow.width * 0.85,
            margin: EdgeInsets.symmetric(vertical: 30.0),
            padding: EdgeInsets.symmetric(vertical: 50.0),
            decoration: BoxDecoration(
                color: Theme.of(context).primaryColorLight,
                borderRadius: BorderRadius.circular(5.0),
                boxShadow: <BoxShadow>[
                  BoxShadow(
                      color: Colors.black26,
                      blurRadius: 1.0,
                      offset: Offset(0.0, 3.0),
                      spreadRadius: 1.0)
                ]),
            child: Column(
              children: [Text('Ingesar', style: TextStyle(fontSize: 20.0))],
            ),
          ),
        ],
      ),
    );
    /*return SingleChildScrollView(
      child: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              margin: EdgeInsets.all(30.0),
              padding: EdgeInsets.all(30.0),
              height: sizeWindow.height * 0.4,
              decoration: BoxDecoration(
                  color: Theme.of(context).primaryColorLight,
                  borderRadius: BorderRadius.circular(5.0)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [Text('Hola')],
              ),
            ),
          ],
        ),
      ),
    );*/
  }
}
