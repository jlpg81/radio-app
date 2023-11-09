import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class Player extends StatefulWidget {
  Player({
    super.key,
  });

  bool isPlaying = false;

  @override
  State<Player> createState() => _PlayerState();
}

class _PlayerState extends State<Player> {
  final audioPlayer = AudioPlayer();

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments! as Map;

    void pressPlay() async {
      if (widget.isPlaying) {
        await audioPlayer.pause();
      } else {
        await audioPlayer.play(UrlSource(args['url']));
      }
      widget.isPlaying = !widget.isPlaying;
      setState(() {});
    }

    // print('isPlaying');
    // print(widget.isPlaying);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Player'),
      ),
      body: Column(
        children: [
          args['favicon'].isEmpty
              ? Image.network(
                  'https://picsum.photos/250?image=9',
                  width: 300,
                  height: 300,
                )
              : Image.network(
                  args['favicon'],
                  width: 300,
                  height: 300,
                ),
          Text(args['name']),
          const Text('Song name'),
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
