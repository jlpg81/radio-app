import 'package:flutter/material.dart';
import 'package:radio_app/helpers/country_list.dart';

class CountrySelector extends StatefulWidget {
  const CountrySelector({
    super.key,
    required this.onChange,
  });

  final Function onChange;

  @override
  State<CountrySelector> createState() => _CountrySelectorState();
}

class _CountrySelectorState extends State<CountrySelector> {
  String initialValue = 'ES';

  @override
  Widget build(BuildContext context) {
    funcc(value) {
      widget.onChange(value);
      setState(() {
        initialValue = value;
      });
    }

    var radioList = countryList.map<DropdownMenuItem>((value) {
      return DropdownMenuItem<String>(
        value: value['countrycode'],
        child: Text(value['country']),
      );
    }).toList();

    return DropdownButton(
      value: initialValue,
      items: radioList,
      onChanged: (value) => funcc(value),
    );
  }
}
