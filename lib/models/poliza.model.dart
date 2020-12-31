class Polizas {
  List<Poliza> items = new List();
  Polizas();

  Polizas.fromJsonList(List<dynamic> jsonList) {
    if (jsonList == null) return;

    for (var item in jsonList) {
      final poliza = new Poliza.fromJson(item);
      items.add(poliza);
    }
  }
}

class Poliza {
  String cliente;
  String poliza;
  String nombre;
  String vigencia;
  double prima;
  String formaPago;

  Poliza({
    this.cliente,
    this.poliza,
    this.nombre,
    this.vigencia,
    this.prima,
    this.formaPago,
  });

  factory Poliza.fromJson(Map<String, dynamic> json) => Poliza(
      cliente: json["cliente"],
      poliza: json["poliza"],
      nombre: json["nombre"],
      vigencia: json["vigencia"],
      prima: json["prima"],
      formaPago: json["formaPago"]);

  Map<String, dynamic> toJson() => {
        "cliente": cliente,
        "poliza": poliza,
        "nombre": nombre,
        "vigencia": vigencia,
        "prima": prima,
        "formaPago": formaPago,
      };
}
