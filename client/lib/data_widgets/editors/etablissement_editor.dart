import 'package:flutter/material.dart';
import 'package:mgp_client/models/editables.dart';
import 'package:provider/provider.dart';

class EtablissementForm extends StatelessWidget {
  const EtablissementForm({super.key});

  @override
  Widget build(BuildContext context) {
    final EditableEtablissement etablissement = context.watch();

    return Form(
      autovalidateMode: AutovalidateMode.onUserInteraction,
      child: Wrap(
        runSpacing: 20,
        children: [
          ...[
            etablissement.siret,
            etablissement.adresseLigne1,
            etablissement.adresseLigne2,
            etablissement.codePostal,
            etablissement.ville,
            etablissement.cedex,
          ].map(
            (field) => TextFormField(
              decoration: InputDecoration(
                labelText: field.label,
                filled: true,
              ),
              initialValue: field.value,
              validator: field.validator.call,
              onChanged: field.update,
            ),
          ),
        ],
      ),
    );
  }
}
