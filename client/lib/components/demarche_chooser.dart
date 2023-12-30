import 'package:flutter/material.dart';

/// This is the stateful widget that the main application instantiates.
class DemarcheChooser extends StatefulWidget {
  const DemarcheChooser({super.key});

  @override
  State<DemarcheChooser> createState() => _DemarcheChooserState();
}

/// This is the private State class that goes with MyStatefulWidget.
class _DemarcheChooserState extends State<DemarcheChooser> {
  String dropdownValue = 'One';

  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
      value: dropdownValue,
      icon: const Icon(Icons.arrow_downward),
      iconSize: 24,
      elevation: 16,
      style: const TextStyle(color: Colors.deepPurple),
      underline: Container(
        height: 2,
        color: Colors.deepPurpleAccent,
      ),
      onChanged: (String? newValue) {
        setState(() {
          dropdownValue = newValue!;
        });
      },
      items: <String>['One', 'Two', 'Free', 'Four']
          .map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
    );
  }
}
