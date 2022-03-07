import 'package:app/setup/setup_services.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

class SetupTrackPage extends StatelessWidget {
  SetupTrackPage({Key? key}) : super(key: key);

  final name = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final List<String> tracksName =
        Provider.of<SetupService>(context).tracksName;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Choose a track"),
        leading: IconButton(
          onPressed: () => {Navigator.pop(context)},
          icon: const Icon(
            Icons.keyboard_arrow_down,
            size: 30,
          ),
        ),
      ),
      body: SafeArea(
        child: ListView.builder(
          padding: const EdgeInsets.all(8),
          itemCount: tracksName.length,
          itemBuilder: (BuildContext context, int index) {
            return GestureDetector(
              onTap: () async {
                await Provider.of<SetupService>(context, listen: false)
                    .setTracks(tracksName[index]);
                Navigator.pushNamed(context, '/setup');
              },
              child: Card(
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: Center(
                    child: Column(
                      children: [
                        Text('${tracksName[index]}'),
                        SvgPicture.asset("assets/tracks.svg",
                            height: 100, semanticsLabel: 'Acme Logo'),
                      ],
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
