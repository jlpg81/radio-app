import 'package:flutter/material.dart';

class RadioListItem extends StatelessWidget {
  const RadioListItem({
    super.key,
    required this.id,
    required this.name,
  });

  final int id;
  final String name;

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
            'id': id,
            'name': name,
          },
        );
      },
    );
  }
}
