import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:geolocator/geolocator.dart';

class IncidensPage extends StatefulWidget {
  IncidensPage();

  @override
  _IncidensPageState createState() => _IncidensPageState();
}

class _IncidensPageState extends State<IncidensPage> {
  File _imageFile;
  String _name;
  String _Lat;
  String _Long;
  String _Alt;
  bool _message = false;

  @override
  void initState() {
    super.initState();

  }

  @override
  Widget build(BuildContext context) {

    _openCamera() async {
      var picture = await ImagePicker.pickImage(source: ImageSource.camera);
      this.setState(() {
        _imageFile = picture;
      });
      //Navigator.of(context).pop();
    }

    _getCurrentLocation() async {
      final position = await Geolocator().getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
      print(position);
      setState(() {
        _Lat = position.latitude.toString();
        _Long = position.longitude.toString();
        _Alt = position.altitude.toString();
      });
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('Vodafone App'),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              SizedBox(height: 25.0,),
              Padding(
                padding: EdgeInsets.all(25.0),
                child: Text(
                  'Este es el formulario necesario para poder reportar una incidencia.',
                  style: TextStyle(fontSize: 16.0),
                  textAlign: TextAlign.center,
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 35.0, right: 35.0, bottom: 30.0),
                child: TextField(
                  maxLines: 1,
                  decoration: InputDecoration(
                      prefixIcon: Icon(Icons.assignment_ind),
                      border: OutlineInputBorder(),
                      hintText: 'Introduce nombre y apellidos'
                  ),
                  onChanged: (String name) {
                    setState(() {
                      _name = name;
                    });
                  },
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 30.0, right: 30.0, bottom: 15.0),
                child:  (_Lat == null && _Long == null)
                    ? Text('Aún no disponemos de tu ubicación, por favor dale clic en el botón ubicación', style: TextStyle(fontSize: 14.0), textAlign: TextAlign.center,)
                    : Text('Lat: $_Lat / Long: $_Long'),
              ),
              FlatButton(
                child: Text(
                  "Proporcionar ubicación",
                ),
                color: Colors.green,
                onPressed: () async {
                  await _getCurrentLocation();
                },
              ),
              SizedBox(height: 20.0,),
              Padding(
                padding: EdgeInsets.only(left: 20.0, right: 20.0, bottom: 15.0),
                child: _imageFile == null
                    ? Text('No has seleccionado ninguna imagen', style: TextStyle(fontSize: 14.0),)
                    : Image.file(_imageFile, width: 150, height: 150,),
              ),
              FlatButton(
                child: Text(
                  "Hacer fotografía",
                ),
                color: Colors.green,
                onPressed: () {
                  _openCamera();
                },
              ),
              SizedBox(height: 15.0,),
              (_message)
                ? Text(
                  'Debes proporcionar toda la información',
                  style: TextStyle(fontSize: 14.0, color: Colors.red),
              )
                : Text(''),
              FlatButton(
                child: Text(
                  "ENVIAR",
                ),
                color: Colors.greenAccent,
                onPressed: () {
                  if (_Lat != null && _Long != null && _name != null && _name != '' && _imageFile != null)
                    Navigator.of(context).pop();
                  else {
                    setState(() {
                      _message = true;
                    });
                  }
                },
              ),
            ],
          ),
        ),
      )// This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

