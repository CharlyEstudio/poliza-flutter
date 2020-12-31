import 'dart:async';
import 'dart:convert';

import 'package:poliza/models/poliza.model.dart';
import 'package:http/http.dart' as http;

class PolizaProvider {
  Future<Poliza> _procesarRespuesta(Uri url, Poliza poliza) async {
    final resp = await http.post(url, body: {
      "cliente": poliza.cliente,
      "poliza": poliza.poliza,
      "nombre": poliza.nombre,
      "vigencia": poliza.vigencia,
      "prima": poliza.prima.toString(),
      "formaPago": poliza.formaPago
    });
    final decodeData = json.decode(resp.body);
    final pol = new Poliza.fromJson(decodeData['payload']);
    return pol;
  }

  Future<Poliza> postPoliza(Poliza poliza) async {
    final url = Uri(
      scheme: 'https',
      host: 'pingestudio.com.mx',
      port: 8345,
      path: 'api/v1/poliza',
    );

    final respuesta = await _procesarRespuesta(url, poliza);
    return respuesta;
  }
}
