import 'package:flutter/material.dart';
import 'package:radio_app/helpers/country_list.dart' as country_list;

// const List<String> list2 = <String>['Onee', 'Two', 'Three', 'Four'];
List<String> list = country_list.countryList;

class CountrySelector extends StatefulWidget {
  const CountrySelector({super.key, required this.changeCountry});

  final Function changeCountry;

  @override
  State<CountrySelector> createState() => _CountrySelectorState();
}

class _CountrySelectorState extends State<CountrySelector> {
  String dropdownValue = list.first;

  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
      value: dropdownValue,
      icon: const Icon(Icons.arrow_downward),
      elevation: 16,
      style: const TextStyle(color: Colors.deepPurple),
      underline: Container(
        height: 2,
        color: Colors.deepPurpleAccent,
      ),
      onChanged: (String? value) {
        widget.changeCountry(value);
        setState(() {
          dropdownValue = value!;
        });
      },
      items: list.map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
    );
  }
}
