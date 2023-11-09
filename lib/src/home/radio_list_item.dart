import 'package:flutter/material.dart';

class RadioListItem extends StatelessWidget {
  const RadioListItem(
      {super.key,
      required this.name,
      required this.favicon,
      required this.url});

  final String name;
  final String favicon;
  final String url;

  // favicon.isEmpty
  //             ? Image.asset(
  //                 'assets/images/radio.jpg',
  //                 width: 300,
  //                 height: 300,
  //               )
  //             : Image.network(
  //                 args['favicon'],
  //                 width: 300,
  //                 height: 300,
  //               ),

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: TextButton.styleFrom(
        fixedSize: Size(MediaQuery.of(context).size.width - 20, 0),
      ),
      child: Align(
        alignment: Alignment.centerLeft,
        child: Row(
          children: [
            const Icon(
              Icons.radio,
              size: 20.0,
            ),
            const Text('    '),
            Expanded(
              child: Text(
                name,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ),
      ),
      onPressed: () {
        Navigator.pushNamed(
          context,
          'player',
          arguments: {
            'name': name,
            'favicon': favicon,
            'url': url,
          },
        );
      },
    );
  }
}
