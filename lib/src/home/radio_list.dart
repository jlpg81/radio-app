import 'package:flutter/material.dart';

import 'package:radio_app/src/home/radio_list_item.dart';
import 'package:radio_app/helpers/globals.dart' as globals;

class RadioList extends StatelessWidget {
  const RadioList({super.key, required this.stations});

  final List stations;

  @override
  Widget build(BuildContext context) {
    int id = 0;
    List finalList = [];
    for (var element in stations) {
      id = id + 1;
      finalList.add({
        'id': id,
        'name': element['name'],
        'favicon': element['favicon'],
        'url': element['url'],
      });
    }

    globals.activeStations = finalList;

    List<Widget> list3 = finalList
        .map((station) => RadioListItem(
              id: station['id'],
              name: station['name'],
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
