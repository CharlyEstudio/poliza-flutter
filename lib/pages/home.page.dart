import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  TabController _controlador;
  double sizeIcon = 33.0;
  int index = 0;
  bool notification = false;

  @override
  void initState() {
    super.initState();
    _controlador = new TabController(length: 4, vsync: this);
  }

  @override
  void dispose() {
    _controlador.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size sizeWindow = MediaQuery.of(context).size;

    return DefaultTabController(
      length: 2,
      child: Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            print('Agregar Nueva Póliza');
            Navigator.pushReplacementNamed(context, 'new-poliza');
          },
          child: Icon(Icons.add),
          backgroundColor: Theme.of(context).primaryColor,
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        body: TabBarView(
          children: [
            Stack(
              children: [
                _crearFondo(context),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Container(
                    height: sizeWindow.height * 0.60,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20.0),
                        topRight: Radius.circular(20.0),
                      ),
                      color: Theme.of(context).primaryColorLight,
                    ),
                    padding:
                        EdgeInsets.only(left: 20.0, top: 20.0, right: 20.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Pólizas Recientes',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20.0,
                                  color: Theme.of(context).primaryColor),
                            ),
                            Text(
                              'Ver Todos',
                              style: TextStyle(
                                  fontSize: 14.0,
                                  color: Theme.of(context).primaryColor,
                                  fontWeight: FontWeight.w600),
                            )
                          ],
                        ),
                        SizedBox(
                          height: 10.0,
                        ),
                        Row(
                          children: [
                            RaisedButton(
                              padding: EdgeInsets.all(0.0),
                              color: Theme.of(context).primaryColorLight,
                              elevation: 0.0,
                              onPressed: () {
                                print('Ver Todos');
                              },
                              child: Chip(
                                  label: Text(
                                    'Todas',
                                    style: TextStyle(
                                        color: Theme.of(context).primaryColor,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  backgroundColor: Colors.white),
                            ),
                            SizedBox(
                              width: 10.0,
                            ),
                            RaisedButton(
                              padding: EdgeInsets.all(0.0),
                              color: Theme.of(context).primaryColorLight,
                              elevation: 0.0,
                              onPressed: () {
                                print('Ver Agregados');
                              },
                              child: Chip(
                                  avatar: Icon(
                                    Icons.add_circle,
                                    color: Colors.green,
                                  ),
                                  label: Text(
                                    'Agregados',
                                    textAlign: TextAlign.start,
                                  ),
                                  backgroundColor: Colors.white),
                            ),
                            SizedBox(
                              width: 10.0,
                            ),
                            RaisedButton(
                              padding: EdgeInsets.all(0.0),
                              color: Theme.of(context).primaryColorLight,
                              elevation: 0.0,
                              onPressed: () {
                                print('Ver Cancelados');
                              },
                              child: Chip(
                                  avatar: Icon(
                                    Icons.do_not_disturb_on,
                                    color: Colors.orange,
                                  ),
                                  label: Text('Cancelados'),
                                  backgroundColor: Colors.white),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 15.0,
                        ),
                        Text(
                          'ULTIMOS AGREGADOS',
                          style: TextStyle(
                              color: Color.fromRGBO(37, 80, 157, .5),
                              fontSize: 13.0,
                              letterSpacing: 2.0),
                        ),
                        SizedBox(
                          height: 15.0,
                        ),
                        Container(
                          height: 185.0,
                          decoration: BoxDecoration(
                              color: Theme.of(context).primaryColorDark,
                              borderRadius: BorderRadius.circular(10.0)),
                          child: ListView(
                            padding: EdgeInsets.all(12.0),
                            children: [
                              ListTile(
                                leading: Container(
                                  height: 50.0,
                                  width: 50.0,
                                  decoration: BoxDecoration(
                                      color:
                                          Theme.of(context).primaryColorLight,
                                      borderRadius:
                                          BorderRadius.circular(10.0)),
                                  child: Icon(Icons.directions_car,
                                      size: 30.0,
                                      color: Theme.of(context).primaryColor),
                                ),
                                title: Text(
                                  'Cliente A',
                                  style: TextStyle(
                                      color: Theme.of(context).primaryColor,
                                      fontWeight: FontWeight.bold),
                                ),
                                subtitle: Text(
                                  'Subtitulo',
                                  style: TextStyle(
                                      color: Color.fromRGBO(37, 80, 157, .5)),
                                ),
                                trailing: Container(
                                  child: Column(
                                    children: [
                                      Text(
                                        '+50.68',
                                        style: TextStyle(
                                            color: Colors.green,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      Text(
                                        'Ago 15',
                                        style: TextStyle(
                                            color: Color.fromRGBO(
                                                37, 80, 157, .5)),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                              Divider(),
                              ListTile(
                                leading: Container(
                                  height: 50.0,
                                  width: 50.0,
                                  decoration: BoxDecoration(
                                      color:
                                          Theme.of(context).primaryColorLight,
                                      borderRadius:
                                          BorderRadius.circular(10.0)),
                                  child: Icon(Icons.directions_car,
                                      size: 30.0,
                                      color: Theme.of(context).primaryColor),
                                ),
                                title: Text('Cliente B',
                                    style: TextStyle(
                                        color: Theme.of(context).primaryColor,
                                        fontWeight: FontWeight.bold)),
                                subtitle: Text(
                                  'Subtitulo',
                                  style: TextStyle(
                                      color: Color.fromRGBO(37, 80, 157, .5)),
                                ),
                                trailing: Container(
                                  child: Column(
                                    children: [
                                      Text(
                                        '+50.68',
                                        style: TextStyle(
                                            color: Colors.green,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      Text(
                                        'Ago 15',
                                        style: TextStyle(
                                            color: Color.fromRGBO(
                                                37, 80, 157, .5)),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 25.0,
                        ),
                        Text(
                          'ULTIMO CANCELADO',
                          style: TextStyle(
                              color: Color.fromRGBO(37, 80, 157, .5),
                              fontSize: 13.0,
                              letterSpacing: 2.0),
                        ),
                        SizedBox(
                          height: 15.0,
                        ),
                        Container(
                          height: 95.0,
                          decoration: BoxDecoration(
                              color: Theme.of(context).primaryColorDark,
                              borderRadius: BorderRadius.circular(10.0)),
                          child: ListView(
                            padding: EdgeInsets.all(12.0),
                            children: [
                              ListTile(
                                leading: Container(
                                  height: 50.0,
                                  width: 50.0,
                                  decoration: BoxDecoration(
                                      color:
                                          Theme.of(context).primaryColorLight,
                                      borderRadius:
                                          BorderRadius.circular(10.0)),
                                  child: Icon(Icons.directions_car,
                                      size: 30.0, color: Colors.orange),
                                ),
                                title: Text('Cliente A',
                                    style: TextStyle(
                                        color: Colors.orange,
                                        fontWeight: FontWeight.bold)),
                                subtitle: Text(
                                  'Subtitulo',
                                  style: TextStyle(
                                      color: Color.fromRGBO(37, 80, 157, .5)),
                                ),
                                trailing: Container(
                                  child: Column(
                                    children: [
                                      Text(
                                        '-50.68',
                                        style: TextStyle(
                                            color: Colors.orange,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      Text(
                                        'Ago 15',
                                        style: TextStyle(
                                            color: Color.fromRGBO(
                                                37, 80, 157, .5)),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
            NewPage('Perfil'),
          ],
        ),
        bottomNavigationBar: Container(
          color: Theme.of(context).primaryColorLight,
          height: 100.0,
          child: TabBar(
            indicatorColor: Theme.of(context).primaryColor,
            unselectedLabelColor: Color.fromRGBO(37, 80, 157, 0.5),
            labelColor: Theme.of(context).primaryColor,
            tabs: [
              Tab(
                icon: Icon(
                  Icons.dashboard,
                  size: this.sizeIcon,
                ),
                child: Text('Home'),
              ),
              Tab(
                icon: Icon(
                  Icons.person_pin,
                  size: this.sizeIcon,
                ),
                child: Text('Perfil'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _crearFondo(BuildContext context) {
    Size sizeWindow = MediaQuery.of(context).size;

    final fondoAzul = Container(
      height: double.infinity,
      width: double.infinity,
      decoration: BoxDecoration(
          gradient: LinearGradient(colors: <Color>[
        Color.fromRGBO(37, 80, 157, 1.0),
        Color.fromRGBO(37, 80, 157, 1.0)
      ])),
    );

    final saldo = Container(
      child: Text(
        '2,589.50',
        style: TextStyle(
            color: Colors.white, fontSize: 30.0, fontWeight: FontWeight.bold),
      ),
    );

    return Stack(
      children: [
        fondoAzul,
        cuadro(60, 100, 10, 0, 0.03),
        cuadro(60, 150, 48, 0, 0.05),
        cuadro(100, 100, 250, 200, 0.03),
        cuadro(100, 150, 250, 200, 0.03),
        SafeArea(
          child: Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 40.0, right: 40.0, top: 20.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      saldo,
                      Column(
                        children: [
                          Row(
                            children: [
                              IconButton(
                                icon: Icon(
                                  notification
                                      ? Container(
                                          width: 30,
                                          height: 30,
                                          child: Stack(
                                            children: [
                                              Icon(
                                                Icons.notifications,
                                                color: Colors.black,
                                                size: 30,
                                              ),
                                              Container(
                                                width: 30,
                                                height: 30,
                                                alignment: Alignment.topRight,
                                                margin: EdgeInsets.only(top: 5),
                                                child: Container(
                                                  width: 15,
                                                  height: 15,
                                                  decoration: BoxDecoration(
                                                      shape: BoxShape.circle,
                                                      color: Color(0xffc32c37),
                                                      border: Border.all(
                                                          color: Colors.white,
                                                          width: 1)),
                                                  child: Padding(
                                                    padding:
                                                        const EdgeInsets.all(
                                                            0.0),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        )
                                      : Icons.notifications,
                                  color: Colors.white,
                                  size: 30.0,
                                  semanticLabel: 'Notificaciones',
                                ),
                                onPressed: () {
                                  print('Ver Notificaciones');
                                },
                              ),
                              MaterialButton(
                                onPressed: () {
                                  print('Ver Perfil');
                                },
                                color: Colors.white,
                                textColor: Colors.white,
                                child: Container(
                                  height: 45.0,
                                  width: 45.0,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10.0),
                                    border: Border.all(
                                        color: Theme.of(context).primaryColor,
                                        width: 1),
                                    image: DecorationImage(
                                        image: AssetImage(
                                            'assets/images/charly.jpg'),
                                        fit: BoxFit.cover),
                                  ),
                                ),
                                padding: EdgeInsets.all(1.5),
                                minWidth: 10.0,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10.0)),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 40.0),
                  child: Text(
                    'Pólizas por Vencer',
                    style: TextStyle(color: Colors.white54),
                  ),
                ),
                SizedBox(
                  height: 40.0,
                ),
                Container(
                  height: 80.0,
                  width: sizeWindow.width * 1,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Container(
                        child: Column(
                          children: [
                            Container(
                              height: 50.0,
                              width: 50.0,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(17),
                                color: Colors.white,
                              ),
                              child: IconButton(
                                  iconSize: 35.0,
                                  icon: Icon(
                                    Icons.credit_card,
                                    color: Theme.of(context).primaryColor,
                                  ),
                                  onPressed: () {
                                    print('Ver Cartera');
                                  }),
                            ),
                            SizedBox(
                              height: 10.0,
                            ),
                            Text(
                              'Cartera',
                              style: TextStyle(
                                  color: Colors.white54, fontSize: 10.0),
                            )
                          ],
                        ),
                      ),
                      Container(
                        child: Column(
                          children: [
                            Container(
                              height: 50.0,
                              width: 50.0,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(17),
                                color: Colors.white,
                              ),
                              child: IconButton(
                                  iconSize: 35.0,
                                  icon: Icon(
                                    Icons.event_busy,
                                    color: Theme.of(context).primaryColor,
                                  ),
                                  onPressed: () {
                                    print('Ver Polizas Vencidas');
                                  }),
                            ),
                            SizedBox(
                              height: 10.0,
                            ),
                            Text(
                              'Pólizas Vencidas',
                              style: TextStyle(
                                  color: Colors.white54, fontSize: 10.0),
                            )
                          ],
                        ),
                      ),
                      Container(
                        child: Column(
                          children: [
                            Container(
                              height: 50.0,
                              width: 50.0,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(17),
                                color: Colors.white,
                              ),
                              child: IconButton(
                                  iconSize: 35.0,
                                  icon: Icon(
                                    Icons.search,
                                    color: Theme.of(context).primaryColor,
                                  ),
                                  onPressed: () {
                                    print('Ver Cartera');
                                  }),
                            ),
                            SizedBox(
                              height: 10.0,
                            ),
                            Text(
                              'Buscar',
                              style: TextStyle(
                                  color: Colors.white54, fontSize: 10.0),
                            )
                          ],
                        ),
                      ),
                      Container(
                        child: Column(
                          children: [
                            Container(
                              height: 50.0,
                              width: 50.0,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(17),
                                color: Colors.white,
                              ),
                              child: IconButton(
                                  iconSize: 35.0,
                                  icon: Icon(
                                    Icons.laptop_chromebook,
                                    color: Theme.of(context).primaryColor,
                                  ),
                                  onPressed: () {
                                    print('Ver Cartera');
                                  }),
                            ),
                            SizedBox(
                              height: 10.0,
                            ),
                            Text(
                              'Agenda',
                              style: TextStyle(
                                  color: Colors.white54, fontSize: 10.0),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        )
      ],
    );
  }

  Widget cuadro(double w, double h, double x, double y, double t) {
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

class NewPage extends StatelessWidget {
  final String title;
  NewPage(this.title);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(title),
      ),
    );
  }
}
