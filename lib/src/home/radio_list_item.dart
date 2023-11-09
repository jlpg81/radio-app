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

  @override
  Widget build(BuildContext context) {
    return TextButton(
      child: Text(name),
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
