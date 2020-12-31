import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:poliza/pages/login.page.dart';
import 'package:poliza/pages/home.page.dart';
import 'package:poliza/pages/nueva_poliza.page.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

Map<int, Color> color = {
  50: Color.fromRGBO(220, 56, 75, .1),
  100: Color.fromRGBO(220, 56, 75, .2),
  200: Color.fromRGBO(220, 56, 75, .3),
  300: Color.fromRGBO(220, 56, 75, .4),
  400: Color.fromRGBO(220, 56, 75, .5),
  500: Color.fromRGBO(220, 56, 75, .6),
  600: Color.fromRGBO(220, 56, 75, .7),
  700: Color.fromRGBO(220, 56, 75, .8),
  800: Color.fromRGBO(220, 56, 75, .9),
  900: Color.fromRGBO(220, 56, 75, 1),
};
void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    systemNavigationBarColor: Colors.blue, // navigation bar color
    statusBarColor: Colors.pink, // status bar color
  ));

  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitDown, DeviceOrientation.portraitUp]);

  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  MaterialColor colorCustom = MaterialColor(0xFFEF2F24, color);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      supportedLocales: [const Locale('es')],
      theme: ThemeData(
          primaryColorDark: Colors.white,
          primaryColorLight: Color.fromRGBO(236, 238, 241, 1.0),
          primaryColor: Color.fromRGBO(37, 80, 157, 1.0),
          primaryIconTheme:
              IconThemeData(color: Color.fromRGBO(37, 80, 157, 1.0)),
          iconTheme: IconThemeData(color: Colors.black45),
          indicatorColor: Colors.indigoAccent,
          disabledColor: Colors.black38,
          focusColor: Colors.black,
          errorColor: colorCustom,
          accentColor: Colors.blueGrey),
      title: 'Poliza',
      initialRoute: 'login',
      routes: {
        'login': (BuildContext context) => LoginPage(),
        'home': (BuildContext context) => HomePage(),
        'new-poliza': (BuildContext context) => NewPoliza()
      },
    );
  }
}
