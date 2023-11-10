import 'package:flutter/material.dart';

import 'package:audioplayers/audioplayers.dart';
import 'package:radio_app/src/home/banner.dart';

import 'package:radio_app/helpers/globals.dart' as globals;

// ignore: must_be_immutable
class Player extends StatefulWidget {
  Player({
    super.key,
  });

  bool isPlaying = true;

  @override
  State<Player> createState() => _PlayerState();
}

class _PlayerState extends State<Player> {
  final audioPlayer = AudioPlayer();
  bool newScreen = true;
  int stationId = 0;

  @override
  void dispose() {
    audioPlayer.pause();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (newScreen) {
      final args = ModalRoute.of(context)!.settings.arguments! as Map;
      stationId = args['id'];
      newScreen = false;
    }

    List stations = globals.activeStations;

    getStation(id) {
      return stations.where((i) => i['id'] == id).toList()[0];
    }

    var selectedStation = getStation(stationId);

    if (widget.isPlaying) {
      audioPlayer.play(UrlSource(selectedStation['url']));
    }

    void pressPrevious() {
      audioPlayer.pause();
      stationId = stationId - 1;
      if (stationId == 0) {
        stationId = 50;
      }
      setState(() {});
    }

    void pressNext() {
      audioPlayer.pause();
      stationId = stationId + 1;
      if (stationId == 51) {
        stationId = 1;
      }
      setState(() {});
    }

    void pressPlay() async {
      if (widget.isPlaying) {
        await audioPlayer.pause();
      } else {
        await audioPlayer.play(UrlSource(selectedStation['url']));
      }
      widget.isPlaying = !widget.isPlaying;
      setState(() {});
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Player'),
      ),
      body: Column(
        children: [
          const SizedBox(
            height: 50,
          ),
          selectedStation['favicon'].isEmpty
              ? Image.asset(
                  'assets/images/radio.jpg',
                  width: 300,
                  height: 300,
                )
              : Image.network(
                  selectedStation['favicon'],
                  width: 300,
                  height: 300,
                ),
          const SizedBox(
            height: 50,
          ),
          Text(
            selectedStation['name'],
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
          ),
          const SizedBox(
            height: 50,
          ),
          // const Text('Song name'),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              RawMaterialButton(
                onPressed: () => pressPrevious(),
                elevation: 2.0,
                fillColor: Colors.orange,
                padding: const EdgeInsets.all(15.0),
                shape: const CircleBorder(),
                child: const Icon(
                  Icons.skip_previous,
                  size: 25.0,
                ),
              ),
              RawMaterialButton(
                onPressed: () => pressPlay(),
                elevation: 2.0,
                fillColor: Colors.orange,
                padding: const EdgeInsets.all(15.0),
                shape: const CircleBorder(),
                child: widget.isPlaying
                    ? const Icon(
                        Icons.pause,
                        size: 35.0,
                      )
                    : const Icon(
                        Icons.play_arrow,
                        size: 35.0,
                      ),
              ),
              RawMaterialButton(
                onPressed: () => pressNext(),
                elevation: 2.0,
                fillColor: Colors.orange,
                padding: const EdgeInsets.all(15.0),
                shape: const CircleBorder(),
                child: const Icon(
                  Icons.skip_next,
                  size: 25.0,
                ),
              )
            ],
          ),
          const Expanded(
            child: SizedBox(
              width: double.infinity,
            ),
          ),
          const AdBanner(),
        ],
      ),
    );
  }
}
