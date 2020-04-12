import 'dart:io';
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import 'incidens.dart';
import 'moreInfo.dart';
import 'myReports.dart';

void main () => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Vodafone App',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: MyHomePage(title: 'Vodafone App'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Hola David, estás son las opciones que dispones:',
            ),
            SizedBox(
              height: 30,
            ),
            FlatButton(
              child: Text(
                "Reportar una incidencia",
              ),
              color: Colors.green,
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => IncidensPage()),
                );
              },
            ),
/*            SizedBox(
              height: 15,
            ),
            FlatButton(
              child: Text(
                "Ver mis incidencias reportadas",
              ),
              color: Colors.green,
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => MyReportsPage()),
                );
              },
            ),*/
            SizedBox(
              height: 15,
            ),
            FlatButton(
              child: Text(
                "Más información",
              ),
              color: Colors.green,
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => MoreInfoPage()),
                );
              },
            )
          ],
        ),
      ),// This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
