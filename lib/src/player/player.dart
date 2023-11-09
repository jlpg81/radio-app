import 'package:flutter/material.dart';

import 'package:audioplayers/audioplayers.dart';

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

  @override
  void dispose() {
    audioPlayer.pause();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments! as Map;

    if (widget.isPlaying) {
      audioPlayer.play(UrlSource(args['url']));
    }

    void pressPlay() async {
      if (widget.isPlaying) {
        await audioPlayer.pause();
      } else {
        await audioPlayer.play(UrlSource(args['url']));
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
          args['favicon'].isEmpty
              ? Image.asset(
                  'assets/images/radio.jpg',
                  width: 300,
                  height: 300,
                )
              : Image.network(
                  args['favicon'],
                  width: 300,
                  height: 300,
                ),
          const SizedBox(
            height: 50,
          ),
          Text(
            args['name'],
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
                onPressed: () {},
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
                onPressed: () {},
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
        ],
      ),
    );
  }
}
