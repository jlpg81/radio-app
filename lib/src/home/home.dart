import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:radio_app/src/home/country_selector.dart';
import 'package:radio_app/src/home/radio_list.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List completeList = [];
  var selectedCountry = 'ES';

  void changeCountry(String country) {
    setState(() {
      selectedCountry = country;
    });
  }

  Future<void> readJson() async {
    final String response =
        await rootBundle.loadString('assets/radio_stations.json');
    final data = await json.decode(response);
    setState(() {
      completeList = data;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (completeList.isEmpty) {
      readJson();
    }

    var filteredList =
        completeList.where((i) => i['countrycode'] == selectedCountry).toList();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Radio App'),
      ),
      body: Center(
        child: Column(
          children: [
            CountrySelector(onChange: changeCountry),
            const Text('Country'),
            Text(selectedCountry),
            RadioList(stations: filteredList),
          ],
        ),
      ),
    );
  }
}
