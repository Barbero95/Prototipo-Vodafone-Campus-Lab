import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:geolocator/geolocator.dart';

class MoreInfoPage extends StatefulWidget {
  MoreInfoPage();

  @override
  _MoreInfoPageState createState() => _MoreInfoPageState();
}

class _MoreInfoPageState extends State<MoreInfoPage> {

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text('Vodafone App'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(left: 25.0, right: 25.0, bottom: 20.0),
              child: Text(
                '¿Sabías qué los incendios forestales es un problema muy grave en España? En el 2019 se pierden cerca de 375.000 hectáreas de masa forestal debido a los incendios forestales, causando pérdidas económicas y en ocaciones humanas.',
                style: TextStyle(fontSize: 16.0),
                textAlign: TextAlign.center,
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 25.0, right: 25.0, bottom: 20.0),
              child: Text(
                'Prefire es un sistema de monitoreo por medio de sensores distribuidos en áreas estratégicas que tiene como objetivo el evitar los incendios forestales ó en lo posible reducir el impacto, los daños y pérdidas que ocasionan.',
                style: TextStyle(fontSize: 16.0),
                textAlign: TextAlign.center,
              )
            ),

          ],
        ),
      ),// This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

