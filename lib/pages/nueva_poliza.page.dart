import 'package:flutter/material.dart';
import 'package:poliza/models/poliza.model.dart';
import 'package:poliza/providers/poliza.provider.dart';

class NewPoliza extends StatefulWidget {
  NewPoliza({Key key}) : super(key: key);

  @override
  _NewPolizaState createState() => _NewPolizaState();
}

class _NewPolizaState extends State<NewPoliza> {
  final polizaProvider = new PolizaProvider();
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  // Cada vez que notifique, modifique la proxima notificación
  // el campo notificacion = vigencia - 5 días de cada {formaPago}
  // formaPago = {Mensual, Trimestral, Anula}
  // Ver la forma de generar un correo para el cliente de un Edo Cta
  String cliente = '';
  String poliza = '';
  String nombre = '';
  double prima = 0.0;
  String formaPago = '';

  String _fecha = '';
  TextEditingController _inputFieldDateController = new TextEditingController();

  _showSnackBar(String texto) {
    final snackBar = new SnackBar(
      content: Text(texto),
    );
    _scaffoldKey.currentState.showSnackBar(snackBar);
  }

  String _opcionSelecionada = 'Seleccione una forma de pago';
  List<String> _formasPago = [
    'Seleccione una forma de pago',
    'Mensual',
    'Trimestral',
    'Semestral',
    'Anual'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        toolbarHeight: 5.0,
        elevation: 0.0,
      ),
      body: Container(
        child: Stack(
          children: [_crearFondo(context)],
        ),
      ),
    );
  }

  Widget _crearFondo(context) {
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
      ListView(
        children: [
          _formulario(),
        ],
      )
    ]);
  }

  Widget _formulario() {
    Size sizeWindow = MediaQuery.of(context).size;
    return Container(
      height: sizeWindow.height * 1,
      decoration: BoxDecoration(
          color: Theme.of(context).primaryColorLight,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20.0), topRight: Radius.circular(20.0))),
      padding: EdgeInsets.only(left: 20.0, top: 40.0, right: 20.0),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Agregar Póliza',
                style: TextStyle(
                    fontSize: 30.0,
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context).primaryColor),
              ),
              IconButton(
                  icon: Icon(
                    Icons.arrow_back_ios,
                    color: Theme.of(context).primaryColor,
                    size: 30.0,
                  ),
                  onPressed: () {
                    Navigator.pushReplacementNamed(context, 'home');
                  })
            ],
          ),
          SizedBox(height: 40.0),
          _crearInputCliente(),
          Divider(),
          _crearInputPoliza(),
          Divider(),
          _crearInputNombre(),
          Divider(),
          //_crearInputVigencia(),
          _crearFecha(context),
          Divider(),
          _crearInputPrima(),
          Divider(),
          _crearDropdown(),
          Divider(),
          _boton(),
        ],
      ),
    );
  }

  Widget _crearInputCliente() {
    return TextField(
      autofocus: true,
      textCapitalization: TextCapitalization.sentences,
      decoration: InputDecoration(
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(20.0)),
          hintText: 'Número del Cliente',
          labelText: 'Cliente',
          icon: Icon(Icons.account_circle)),
      onChanged: (valor) {
        setState(() {
          cliente = valor;
        });
      },
    );
  }

  Widget _crearInputPoliza() {
    return TextField(
      autofocus: true,
      textCapitalization: TextCapitalization.sentences,
      decoration: InputDecoration(
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(20.0)),
          hintText: 'Número de Póliza',
          labelText: 'Póliza',
          icon: Icon(Icons.assignment)),
      onChanged: (valor) {
        setState(() {
          poliza = valor;
        });
      },
    );
  }

  Widget _crearInputNombre() {
    return TextField(
      autofocus: true,
      textCapitalization: TextCapitalization.sentences,
      decoration: InputDecoration(
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(20.0)),
          hintText: 'Nombre del Cliente',
          labelText: 'Nombre',
          icon: Icon(Icons.account_box)),
      onChanged: (valor) {
        setState(() {
          nombre = valor;
        });
      },
    );
  }

  Widget _crearFecha(BuildContext context) {
    return TextField(
      enableInteractiveSelection: false,
      controller: _inputFieldDateController,
      decoration: InputDecoration(
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(20.0)),
          hintText: 'Fecha de Nacimiento',
          labelText: 'Fecha',
          suffixIcon: Icon(Icons.calendar_today),
          icon: Icon(Icons.calendar_today)),
      onTap: () {
        FocusScope.of(context).requestFocus(new FocusNode());
        _selectedDate(context);
      },
    );
  }

  _selectedDate(BuildContext context) async {
    DateTime picked = await showDatePicker(
        context: context,
        initialDate: new DateTime.now(),
        firstDate: new DateTime(2018),
        lastDate: new DateTime(2025),
        locale: Locale('es', 'ES'));

    if (picked != null) {
      setState(() {
        _fecha = picked.toString();
        _inputFieldDateController.text = _fecha;
      });
    }
  }

  Widget _crearInputPrima() {
    return TextField(
      autofocus: true,
      textCapitalization: TextCapitalization.sentences,
      decoration: InputDecoration(
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(20.0)),
          hintText: 'Prima de Póliza',
          labelText: 'Prima',
          icon: Icon(Icons.monetization_on)),
      onChanged: (valor) {
        setState(() {
          prima = double.parse(valor);
        });
      },
    );
  }

  List<DropdownMenuItem<String>> getOpcionesDropdown() {
    List<DropdownMenuItem<String>> lista = new List();
    _formasPago.forEach((fp) {
      lista.add(DropdownMenuItem(
        child: Text(fp),
        value: fp,
      ));
    });
    return lista;
  }

  Widget _crearDropdown() {
    return Row(
      children: <Widget>[
        Icon(Icons.payment),
        SizedBox(width: 30.0),
        Expanded(
          child: DropdownButton(
            value: _opcionSelecionada,
            items: getOpcionesDropdown(),
            onChanged: (opt) {
              setState(() {
                _opcionSelecionada = opt;
                formaPago = opt;
              });
            },
          ),
        )
      ],
    );
  }

  Widget _boton() {
    return FlatButton(
      color: Theme.of(context).primaryColor,
      textColor: Theme.of(context).primaryColorLight,
      onPressed: () {
        print('Guardar Póliza');

        if (cliente.length == 0) {
          _showSnackBar("No se ha agregado un cliente");
          return;
        }

        if (poliza.length == 0) {
          _showSnackBar("No se ha agregado una póliza");
          return;
        }

        if (nombre.length == 0) {
          _showSnackBar("No se ha agregado un nombre");
          return;
        }

        if (_fecha.length == 0) {
          _showSnackBar("No se ha agregado una fecha");
          return;
        }

        if (prima == 0) {
          _showSnackBar("No se ha agregado una prima");
          return;
        }

        if (formaPago.length == 0) {
          _showSnackBar("No se ha agregado una forma de pago");
          return;
        }

        print('Mensaje despues del primer if');
        print(cliente);
        print(poliza);
        print(nombre);
        print(_fecha);
        print(prima);
        print(formaPago);

        // Navigator.pushReplacementNamed(context, 'home');
        Poliza pol = new Poliza();
        pol.cliente = cliente;
        pol.poliza = poliza;
        pol.nombre = nombre;
        pol.vigencia = _fecha;
        pol.prima = prima;
        pol.formaPago = formaPago;

        this.polizaProvider.postPoliza(pol).then((value) async {
          print(value.cliente);
        });
      },
      child: Text(
        "Agregar Póliza",
      ),
    );
  }
}
