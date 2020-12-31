import 'package:flutter/material.dart';

class FondoWidget extends StatelessWidget {
  const FondoWidget({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return _fondo(context);
  }

  Widget _fondo(BuildContext context) {
    final fondoAzul = Container(
      height: double.infinity,
      width: double.infinity,
      decoration: BoxDecoration(
          gradient: LinearGradient(colors: <Color>[
        Color.fromRGBO(37, 80, 157, 1.0),
        Color.fromRGBO(37, 80, 157, 1.0)
      ])),
    );

    return Stack(children: [
      fondoAzul,
      _cuadro(60, 100, 10, 0, 0.03),
      _cuadro(60, 150, 48, 0, 0.05),
      _cuadro(100, 100, 250, 200, 0.03),
      _cuadro(100, 150, 250, 200, 0.03),
      Container(
        padding: EdgeInsets.only(top: 150.0),
        child: Column(
          children: [
            Icon(Icons.person_pin_circle, color: Colors.white, size: 100.0),
            SizedBox(height: 10.0, width: double.infinity),
            Text(
              'Pólizas',
              style: TextStyle(color: Colors.white, fontSize: 25.0),
            )
          ],
        ),
      ),
    ]);
  }

  Widget _cuadro(double w, double h, double x, double y, double t) {
    return Positioned(
      left: x,
      top: y,
      child: Transform(
        child: Container(
          width: w,
          height: h,
          decoration: BoxDecoration(color: Color.fromRGBO(250, 250, 250, t)),
        ),
        alignment: FractionalOffset.center,
        transform: Matrix4.skewX(-0.7),
      ),
    );
  }
}
