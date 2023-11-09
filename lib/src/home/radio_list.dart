import 'package:flutter/material.dart';
import 'package:radio_app/src/home/radio_list_item.dart';

class RadioList extends StatelessWidget {
  const RadioList({super.key, required this.stations});

  final List stations;

  @override
  Widget build(BuildContext context) {
    List<Widget> list3 = stations
        .map((station) => RadioListItem(
              name: station['name'],
              favicon: station['favicon'],
              url: station['url_resolved'],
            ))
        .toList();

    return Expanded(
      child: SingleChildScrollView(
        child: Container(
          alignment: Alignment.centerLeft,
          width: MediaQuery.of(context).size.width,
          child: Column(
            children: list3,
          ),
        ),
      ),
    );
  }
}
