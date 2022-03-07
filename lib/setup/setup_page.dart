import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:app/setup/setup_services.dart';

class SetupPage extends StatelessWidget {
  SetupPage({Key? key}) : super(key: key);
  final name = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final String? nameSetup = Provider.of<SetupService>(context).nameSetup;
    final String? wheather = Provider.of<SetupService>(context).weather;
    final double AeroFront = Provider.of<SetupService>(context).aeroFront;
    final double AeroBack = Provider.of<SetupService>(context).aeroBack;
    final double TransAccel = Provider.of<SetupService>(context).transAccel;
    final double TransDeccel = Provider.of<SetupService>(context).transDeccel;
    final double GeoFront = Provider.of<SetupService>(context).geoFront;
    final double GeoBack = Provider.of<SetupService>(context).geoBack;
    final double ConvFront = Provider.of<SetupService>(context).convFront;
    final double ConvBack = Provider.of<SetupService>(context).convBack;
    final double suspensFront = Provider.of<SetupService>(context).suspensFront;
    final double suspensRear = Provider.of<SetupService>(context).suspensRear;
    double suspensFrontAnti =
        Provider.of<SetupService>(context).suspensFrontAnti;
    double suspensRearAnti = Provider.of<SetupService>(context).suspensRearAnti;
    double suspensFrontRide =
        Provider.of<SetupService>(context).suspensFrontRide;
    double suspensRearRide = Provider.of<SetupService>(context).suspensRearRide;
    final double breakPressure =
        Provider.of<SetupService>(context).brakePressure;
    final double breakBias = Provider.of<SetupService>(context).brakeBias;
    final double tyreFrontLeft =
        Provider.of<SetupService>(context).tyreFrontLeft;
    final double tyreFrontRight =
        Provider.of<SetupService>(context).tyreFrontRight;
    final double rearRight = Provider.of<SetupService>(context).rearRight;
    final double rearLeft = Provider.of<SetupService>(context).rearLeft;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Add a setup"),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 10, top: 10),
                  child: TextField(
                    controller: name,
                    onChanged: (text) => {
                      Provider.of<SetupService>(context, listen: false)
                          .setNameSetup(text)
                    },
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Name of Setup',
                    ),
                  ),
                ),
                Row(
                  children: [
                    Expanded(
                      child: SizedBox(
                        height: 140,
                        child: Card(
                          child: Center(
                            child: Column(
                              children: [
                                const Text("Weather"),
                                Expanded(
                                    child: CarouselSlider(
                                  options: CarouselOptions(
                                    height: double.infinity,
                                    onPageChanged: (index, reason) => {
                                      if (index == 0)
                                        {
                                          Provider.of<SetupService>(context,
                                                  listen: false)
                                              .setWeather("sun.svg")
                                        }
                                      else
                                        {
                                          Provider.of<SetupService>(context,
                                                  listen: false)
                                              .setWeather("rain.svg")
                                        }
                                    },
                                  ),
                                  items: ["sun.svg", "rain.svg"].map((i) {
                                    return Builder(
                                      builder: (BuildContext context) {
                                        return Center(
                                          child: SvgPicture.asset("assets/" + i,
                                              height: 80,
                                              semanticsLabel: 'Acme Logo'),
                                        );
                                      },
                                    );
                                  }).toList(),
                                ))
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: SizedBox(
                        height: 140,
                        child: Card(
                          child: Center(
                            child: Column(
                              children: [
                                const Text("Controller"),
                                Expanded(
                                    child: CarouselSlider(
                                  options: CarouselOptions(
                                    height: double.infinity,
                                    onPageChanged: (index, reason) => {
                                      if (index == 0)
                                        {
                                          Provider.of<SetupService>(context,
                                                  listen: false)
                                              .setController("manette.svg")
                                        }
                                      else
                                        {
                                          Provider.of<SetupService>(context,
                                                  listen: false)
                                              .setController("volant.svg")
                                        }
                                    },
                                  ),
                                  items: ["manette.svg", "volant.svg"].map((i) {
                                    return Builder(
                                      builder: (BuildContext context) {
                                        return Center(
                                          child: SvgPicture.asset("assets/" + i,
                                              height: 60,
                                              semanticsLabel: 'Acme Logo'),
                                        );
                                      },
                                    );
                                  }).toList(),
                                ))
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  width: double.infinity,
                  child: Card(
                    child: Padding(
                      padding: const EdgeInsets.all(10),
                      child: Column(
                        children: [
                          const Text("Aerodynamics"),
                          Slider(
                            value: AeroFront,
                            min: 1,
                            max: 11,
                            divisions: 10,
                            label: AeroFront.round().toString(),
                            onChanged: (double value) {
                              Provider.of<SetupService>(context, listen: false)
                                  .setAeroFront(value);
                            },
                          ),
                          Slider(
                            value: AeroBack,
                            min: 1,
                            max: 11,
                            divisions: 10,
                            label: AeroBack.round().toString(),
                            onChanged: (double value) {
                              Provider.of<SetupService>(context, listen: false)
                                  .setAeroBack(value);
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: double.infinity,
                  child: Card(
                    child: Padding(
                      padding: const EdgeInsets.all(10),
                      child: Column(
                        children: [
                          const Text("Transmission"),
                          Slider(
                            value: TransAccel,
                            min: 50,
                            max: 100,
                            divisions: 50,
                            label: TransAccel.round().toString(),
                            onChanged: (double value) {
                              Provider.of<SetupService>(context, listen: false)
                                  .setTransAccel(value);
                            },
                          ),
                          Slider(
                            value: TransDeccel,
                            min: 50,
                            max: 100,
                            divisions: 50,
                            label: TransDeccel.round().toString(),
                            onChanged: (double value) {
                              Provider.of<SetupService>(context, listen: false)
                                  .setTransDeccel(value);
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: double.infinity,
                  child: Card(
                    child: Padding(
                      padding: const EdgeInsets.all(10),
                      child: Column(
                        children: [
                          const Text("Géométrie"),
                          Slider(
                            value: GeoFront,
                            min: -3.50,
                            max: -2.50,
                            divisions: 10,
                            label: GeoFront.toString(),
                            onChanged: (double value) {
                              Provider.of<SetupService>(context, listen: false)
                                  .setGeoFront(value);
                            },
                          ),
                          Slider(
                            value: GeoBack,
                            min: -2,
                            max: -1,
                            divisions: 10,
                            label: GeoBack.toString(),
                            onChanged: (double value) {
                              Provider.of<SetupService>(context, listen: false)
                                  .setGeoBack(value);
                            },
                          ),
                          Slider(
                            value: ConvFront,
                            min: 0.05,
                            max: 0.15,
                            divisions: 10,
                            label: ConvFront.toStringAsFixed(2),
                            onChanged: (double value) {
                              Provider.of<SetupService>(context, listen: false)
                                  .setConvFront(value);
                            },
                          ),
                          Slider(
                            value: ConvBack,
                            min: 0.20,
                            max: 0.50,
                            divisions: 10,
                            label: ConvBack.toStringAsFixed(2),
                            onChanged: (double value) {
                              Provider.of<SetupService>(context, listen: false)
                                  .setConvBack(value);
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: double.infinity,
                  child: Card(
                    child: Padding(
                      padding: const EdgeInsets.all(10),
                      child: Column(
                        children: [
                          const Text("Suspension"),
                          Slider(
                            value: suspensFront,
                            min: 1,
                            max: 11,
                            divisions: 10,
                            label: suspensFront.round().toString(),
                            onChanged: (double value) {
                              Provider.of<SetupService>(context, listen: false)
                                  .setSuspenFront(value);
                            },
                          ),
                          Slider(
                            value: suspensRear,
                            min: 1,
                            max: 11,
                            divisions: 10,
                            label: suspensRear.round().toString(),
                            onChanged: (double value) {
                              Provider.of<SetupService>(context, listen: false)
                                  .setSuspenRear(value);
                            },
                          ),
                          Slider(
                            value: suspensFrontAnti,
                            min: 1,
                            max: 11,
                            divisions: 10,
                            label: suspensFrontAnti.round().toString(),
                            onChanged: (double value) {
                              Provider.of<SetupService>(context, listen: false)
                                  .setSuspenFrontAnti(value);
                            },
                          ),
                          Slider(
                            value: suspensRearAnti,
                            min: 1,
                            max: 11,
                            divisions: 10,
                            label: suspensRearAnti.round().toString(),
                            onChanged: (double value) {
                              Provider.of<SetupService>(context, listen: false)
                                  .setSuspenRearAnti(value);
                            },
                          ),
                          Slider(
                            value: suspensFrontRide,
                            min: 1,
                            max: 11,
                            divisions: 10,
                            label: suspensFrontRide.round().toString(),
                            onChanged: (double value) {
                              Provider.of<SetupService>(context, listen: false)
                                  .setSuspenFrontRide(value);
                            },
                          ),
                          Slider(
                            value: suspensRearRide,
                            min: 1,
                            max: 11,
                            divisions: 10,
                            label: suspensRearRide.round().toString(),
                            onChanged: (double value) {
                              Provider.of<SetupService>(context, listen: false)
                                  .setSuspenRearRide(value);
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: double.infinity,
                  child: Card(
                    child: Padding(
                      padding: const EdgeInsets.all(10),
                      child: Column(
                        children: [
                          const Text("Break"),
                          Slider(
                            value: breakPressure,
                            min: 50,
                            max: 100,
                            divisions: 50,
                            label: breakPressure.round().toString(),
                            onChanged: (double value) {
                              Provider.of<SetupService>(context, listen: false)
                                  .setBreakPressure(value);
                            },
                          ),
                          Slider(
                            value: breakBias,
                            min: 50,
                            max: 70,
                            divisions: 10,
                            label: breakBias.round().toString(),
                            onChanged: (double value) {
                              Provider.of<SetupService>(context, listen: false)
                                  .setBreakBias(value);
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: double.infinity,
                  child: Card(
                    child: Padding(
                      padding: const EdgeInsets.all(10),
                      child: Column(
                        children: [
                          const Text("Tyres"),
                          Slider(
                            value: tyreFrontRight,
                            min: 21,
                            max: 25,
                            divisions: 10,
                            label: tyreFrontRight.toString(),
                            onChanged: (double value) {
                              Provider.of<SetupService>(context, listen: false)
                                  .setTyreFrontRight(value);
                            },
                          ),
                          Slider(
                            value: tyreFrontLeft,
                            min: 21,
                            max: 25,
                            divisions: 10,
                            label: tyreFrontLeft.toString(),
                            onChanged: (double value) {
                              Provider.of<SetupService>(context, listen: false)
                                  .setTyreFrontLeft(value);
                            },
                          ),
                          Slider(
                            value: rearRight,
                            min: 19.5,
                            max: 23.5,
                            divisions: 8,
                            label: rearRight.toString(),
                            onChanged: (double value) {
                              Provider.of<SetupService>(context, listen: false)
                                  .setRearRight(value);
                            },
                          ),
                          Slider(
                            value: rearLeft,
                            min: 19.5,
                            max: 23.5,
                            divisions: 8,
                            label: rearLeft.toString(),
                            onChanged: (double value) {
                              Provider.of<SetupService>(context, listen: false)
                                  .setRearLeft(value);
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                ElevatedButton(
                    onPressed: () {
                      Provider.of<SetupService>(context, listen: false)
                          .saveSetup();
                    },
                    child: const Text("SAVE SETUP"))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
