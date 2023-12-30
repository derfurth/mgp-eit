import 'package:flutter/material.dart';
import 'package:mgp_client/components/layout.dart';
import 'package:mgp_client/data_widgets/lists/demarches_list.dart';

class DemarcheChoicePage extends StatelessWidget {
  const DemarcheChoicePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Layout(
      navigation: Container(),
      body: const DemarchesList(),
    );
  }
}
