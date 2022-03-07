import 'package:app/authentification/authentification_service.dart';
import 'package:flutter/foundation.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class SetupService extends ChangeNotifier {
  final FirebaseFirestore firestore = FirebaseFirestore.instance;
  final CollectionReference setup =
      FirebaseFirestore.instance.collection('setup');

  String? nameSetup;
  String? tracks;
  String weather = "sun.png";
  String controller = "manette.svg";
  double aeroFront = 1;
  double aeroBack = 1;
  double transAccel = 50;
  double transDeccel = 50;
  double geoFront = -3.50;
  double geoBack = -2;
  double convFront = 0.05;
  double convBack = 0.20;
  double suspensFront = 1;
  double suspensRear = 1;
  double suspensFrontAnti = 1;
  double suspensRearAnti = 1;
  double suspensFrontRide = 1;
  double suspensRearRide = 1;
  double brakePressure = 50;
  double brakeBias = 70;
  double tyreFrontRight = 21.0;
  double tyreFrontLeft = 21.0;
  double rearRight = 19.5;
  double rearLeft = 19.5;

  List<String> tracksName = [
    "BAHRAIN",
    "PORTUGAL",
    "MONACO",
    "FRANCE",
    "SILVERSTONE",
    "BELGIQUE",
    "ITALY",
    "JAPAN",
    "MEXICO",
    "AUSTRALIA",
    "ABUDHABI",
    "CHINA",
    "IMOLA",
    "SPAIN",
    "AZERBAIJAN",
    "AUSTRIA",
    "HUNGARY",
    "NETHERLANDS",
    "RUSSIA",
    "USA",
    "BRAZIL",
    "JEDDAH",
    "CANADA",
    "SINGAPORE"
  ];

  setNameSetup(value) {
    nameSetup = value;
    notifyListeners();
  }

  setTracks(value) {
    tracks = value;
    notifyListeners();
  }

  setWeather(value) {
    weather = value;
    notifyListeners();
  }

  setController(value) {
    controller = value;
    notifyListeners();
  }

  setAeroFront(value) {
    aeroFront = value;
    notifyListeners();
  }

  setAeroBack(value) {
    aeroBack = value;
    notifyListeners();
  }

  setTransAccel(value) {
    transAccel = value;
    notifyListeners();
  }

  setTransDeccel(value) {
    transDeccel = value;
    notifyListeners();
  }

  setGeoFront(value) {
    geoFront = value;
    notifyListeners();
  }

  setGeoBack(value) {
    geoBack = value;
    notifyListeners();
  }

  setConvFront(value) {
    convFront = value;
    notifyListeners();
  }

  setConvBack(value) {
    convBack = value;
    notifyListeners();
  }

  setSuspenFront(value) {
    suspensFront = value;
    notifyListeners();
  }

  setSuspenRear(value) {
    suspensRear = value;
    notifyListeners();
  }

  setSuspenFrontAnti(value) {
    suspensFrontAnti = value;
    notifyListeners();
  }

  setSuspenRearAnti(value) {
    suspensRearAnti = value;
    notifyListeners();
  }

  setSuspenFrontRide(value) {
    suspensFrontRide = value;
    notifyListeners();
  }

  setSuspenRearRide(value) {
    suspensRearRide = value;
    notifyListeners();
  }

  setBreakPressure(value) {
    brakePressure = value;
    notifyListeners();
  }

  setBreakBias(value) {
    brakeBias = value;
    notifyListeners();
  }

  setTyreFrontLeft(value) {
    tyreFrontLeft = value;
    notifyListeners();
  }

  setTyreFrontRight(value) {
    tyreFrontRight = value;
    notifyListeners();
  }

  setRearRight(value) {
    rearRight = value;
    notifyListeners();
  }

  setRearLeft(value) {
    rearLeft = value;
    notifyListeners();
  }

  saveSetup() async {
    try {
      AuthService().user!.forEach((element) {
        setup
            .add({
              'uid': element!.uid,
              'name': nameSetup,
              'track': tracks,
              'weather': weather,
              'controller': controller,
              'aeroFront': aeroFront,
              'aeroBack': aeroBack,
              'transAccel': transAccel,
              'transDeccel': transDeccel,
              'geoFront': geoFront,
              'geoBack': geoBack,
              'convFront': convFront,
              'convBack': convBack,
              'suspensFront': suspensFront,
              'suspensRear': suspensRear,
              'suspensFrontAnti': suspensFrontAnti,
              'suspensRearAnti': suspensRearAnti,
              'suspensFrontRide': suspensFrontRide,
              'suspensRearRide': suspensRearRide,
              'brakePressure': brakePressure,
              'brakeBias': brakeBias,
              'tyreFrontRight': tyreFrontRight,
              'tyreFrontLeft': tyreFrontLeft,
              'rearRight': rearRight,
              'rearLeft': rearLeft,
            })
            .then((value) => print("User Added"))
            .catchError((error) => print("Failed to add user: $error"));
      });
    } catch (err) {
      print(err);
    }
  }
}
